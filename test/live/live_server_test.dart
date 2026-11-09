// Live exit-criteria tests of phase A: the real app (router, guards, Dio, token
// manager, generated client) against a running OpenBekci dev server over real
// HTTP. Skipped unless OPENBEKCI_LIVE_SERVER is set. See README ("Live tests").
//
//   OPENBEKCI_LIVE_SERVER=http://localhost:8484          server origin
//   OPENBEKCI_LIVE_LOG=path/to/server.log                 its log (SMS_PROVIDER=log, MAIL_PROVIDER=log)
//   OPENBEKCI_LIVE_ADMIN_EMAIL / OPENBEKCI_LIVE_ADMIN_PASSWORD   an organization administrator
//
// Run: flutter test test/live
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/db/database.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';

final _server = Platform.environment['OPENBEKCI_LIVE_SERVER'];
final _logPath = Platform.environment['OPENBEKCI_LIVE_LOG'];
final _adminEmail =
    Platform.environment['OPENBEKCI_LIVE_ADMIN_EMAIL'] ?? 'ayse@example.org';
final _adminPassword =
    Platform.environment['OPENBEKCI_LIVE_ADMIN_PASSWORD'] ??
    'correct horse battery';

String? get _skip => _server == null || _logPath == null
    ? 'set OPENBEKCI_LIVE_SERVER and OPENBEKCI_LIVE_LOG to run the live tests'
    : null;

/// What the seeding created on the server.
class Seed {
  new({
    required this.orgId,
    required this.siteId,
    required this.joinCode,
    required this.units,
    required this.admin,
  });

  final String orgId;
  final String siteId;
  final String joinCode;
  final Map<String, String> units; // door number -> unit id
  final Dio admin;
}

late Seed _seed;
late String _adminToken;

Dio _rawDio() => Dio(
  BaseOptions(
    baseUrl: _server!,
    validateStatus: (_) => true,
    headers: {'Accept': 'application/json'},
  ),
);

Future<Map<String, dynamic>> _ok(Future<Response<dynamic>> request) async {
  final r = await request;
  final status = r.statusCode ?? 0;
  if (status >= 300) {
    throw StateError(
      'seed request failed: ${r.requestOptions.method} '
      '${r.requestOptions.path} -> $status ${r.data}',
    );
  }
  return (r.data as Map?)?.cast<String, dynamic>() ?? const {};
}

Future<Map<String, dynamic>?> seedGet(Dio dio, String path) async {
  final r = await dio.get<dynamic>(path);
  if (r.statusCode == 404) return null;
  return await _ok(Future.value(r));
}

/// Creates a site with blocks, units and a join code through the admin API.
Future<Seed> _seedSite() async {
  final dio = _rawDio();
  final token = await _ok(
    dio.post<dynamic>(
      '/v1/auth/token',
      data: {
        'method': 'password',
        'identifier': _adminEmail,
        'password': _adminPassword,
        'client': 'mobile',
      },
    ),
  );
  _adminToken = token['access_token'] as String;
  dio.options.headers['Authorization'] = 'Bearer $_adminToken';
  final me = await _ok(dio.get<dynamic>('/v1/me'));
  final orgId = ((me['organizations'] as List).first as Map)['id'] as String;
  final stamp = DateTime.now().millisecondsSinceEpoch;
  final site = await _ok(
    dio.post<dynamic>(
      '/v1/orgs/$orgId/sites',
      data: {
        'name': 'Live Site $stamp',
        'timezone': 'Europe/Istanbul',
        'currency': 'TRY',
      },
    ),
  );
  final siteId = site['id'] as String;
  final block = await _ok(
    dio.post<dynamic>(
      '/v1/orgs/$orgId/blocks',
      data: {'site_id': siteId, 'name': 'A Blok'},
    ),
  );
  final units = <String, String>{};
  for (final door in ['12', '14', '16']) {
    final unit = await _ok(
      dio.post<dynamic>(
        '/v1/orgs/$orgId/units',
        data: {
          'site_id': siteId,
          'block_id': block['id'],
          'door_number': door,
          'type': 'flat',
        },
      ),
    );
    units[door] = unit['id'] as String;
  }
  // A site has no join code until the first rotation.
  final existing = await seedGet(
    dio,
    '/v1/orgs/$orgId/sites/$siteId/join-code',
  );
  var code =
      existing ??
      await _ok(
        dio.post<dynamic>('/v1/orgs/$orgId/sites/$siteId/join-code:rotate'),
      );
  if (code['enabled'] != true) {
    code = await _ok(
      dio.put<dynamic>(
        '/v1/orgs/$orgId/sites/$siteId/join-code',
        data: {'enabled': true},
      ),
    );
  }
  return Seed(
    orgId: orgId,
    siteId: siteId,
    joinCode: code['code'] as String,
    units: units,
    admin: dio,
  );
}

/// Creates a person with [phone] and an SMS invitation for [door]; returns the
/// invitation token read from the server log.
Future<String> _invite(Seed seed, String phone, String door) async {
  final mark = File(_logPath!).lengthSync();
  final person = await _ok(
    seed.admin.post<dynamic>(
      '/v1/orgs/${seed.orgId}/persons',
      data: {
        'display_name': 'Live Resident',
        'contact': {'phone': phone, 'preferred_channel': 'sms'},
      },
    ),
  );
  await _ok(
    seed.admin.post<dynamic>(
      '/v1/orgs/${seed.orgId}/invitations',
      data: {
        'site_id': seed.siteId,
        'person_id': person['id'],
        'channel': 'sms',
        'unit_id': seed.units[door],
      },
    ),
  );
  final match = await _waitForLog(
    RegExp(r'https?://[^\s"\\]+/invite/[A-Za-z0-9_.\-]+'),
    after: mark,
  );
  return match.group(0)!;
}

/// Waits for [pattern] to appear in the server log after byte offset [after].
Future<RegExpMatch> _waitForLog(RegExp pattern, {required int after}) async {
  final end = DateTime.now().add(const Duration(seconds: 25));
  while (DateTime.now().isBefore(end)) {
    final bytes = File(_logPath!).readAsBytesSync();
    final text = String.fromCharCodes(bytes.sublist(min(after, bytes.length)));
    final m = pattern.allMatches(text).lastOrNull;
    if (m != null) return m;
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }
  throw TestFailure('"$pattern" did not appear in the server log');
}

/// A freshly pumped app with the real stack: only storage, the link stream and
/// the config are replaced.
class LiveApp {
  new() {
    store = MemoryAccountStore();
    db = AppDatabase.forTesting(NativeDatabase.memory());
    links = StreamController<AppLink>.broadcast();
    overrides = [
      appConfigProvider.overrideWithValue(
        const AppConfig(
          flavor: Flavor.dev,
          appName: 'OpenBekci',
          relayId: 'official',
          seedColor: Color(0xFF1A73E8),
        ),
      ),
      appInfoProvider.overrideWithValue(
        const AppInfo(version: '1.0.0', build: '1'),
      ),
      accountStoreProvider.overrideWithValue(store),
      databaseProvider.overrideWithValue(db),
      localeProvider.overrideWith(_En.new),
      incomingLinksProvider.overrideWithValue(links.stream),
      // No idle keep-alive timer: the fake-async test zone would report it
      // as a pending timer.
      httpAdapterProvider.overrideWithValue(
        IOHttpClientAdapter(
          createHttpClient: () => HttpClient()..idleTimeout = Duration.zero,
        ),
      ),
    ];
  }

  late final MemoryAccountStore store;
  late final AppDatabase db;
  late final StreamController<AppLink> links;
  late final List<Override> overrides;

  Widget widget() =>
      ProviderScope(overrides: overrides, child: const OpenBekciApp());

  ProviderContainer container(WidgetTester tester) =>
      ProviderScope.containerOf(tester.element(find.byType(OpenBekciApp)));

  Future<void> dispose() async {
    await links.close();
    await db.close();
  }
}

class _En extends LocaleController {
  @override
  Locale? build() => const Locale('en');
}

/// Pumps real time until [finder] matches (real sockets need `runAsync`).
Future<void> pumpUntil(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 25),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 80)),
    );
    await tester.pump(const Duration(milliseconds: 40));
    if (finder.evaluate().isNotEmpty) return;
  }
  throw TestFailure('timed out waiting for $finder');
}

Future<void> typeInto(WidgetTester tester, String key, String text) async {
  await tester.enterText(find.byKey(Key(key)), text);
  await tester.pump();
}

Future<void> tapKey(WidgetTester tester, String key) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.pump();
  await tester.tap(find.byKey(Key(key)));
  await tester.pump();
}

String _location(WidgetTester tester, LiveApp app) => app
    .container(tester)
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

Future<LiveApp> _launch(WidgetTester tester) async {
  tester.view
    ..physicalSize = const Size(390 * 3, 844 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final app = LiveApp();
  addTearDown(app.dispose);
  await tester.pumpWidget(app.widget());
  await tester.pumpAndSettle();
  return app;
}

Future<void> _connect(WidgetTester tester) async {
  expect(find.text('Connect to your site'), findsOneWidget);
  await typeInto(tester, 'serverField', _server!);
  await tapKey(tester, 'serverConnect');
  await pumpUntil(tester, find.byKey(const Key('method_password')));
}

Future<void> _signOut(WidgetTester tester, LiveApp app) async {
  app.container(tester).read(routerProvider).go('/');
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('openProfile')));
  await tester.pumpAndSettle();
  await tapKey(tester, 'signOut');
  await tester.pumpAndSettle();
  await tapKey(tester, 'confirmSignOut');
  await pumpUntil(tester, find.text('Connect to your site'));
}

void main() {
  // The test binding installs an HttpClient that answers 400 to everything;
  // remove it so these tests can use real sockets.
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  setUpAll(() async {
    if (_skip != null) return;
    _seed = await _seedSite();
  });

  testWidgets(
    'password: connect, sign in, /v1/me parsed by the generated client',
    (tester) async {
      final app = await _launch(tester);
      await _connect(tester);
      await tester.tap(find.byKey(const Key('method_password')));
      await tester.pumpAndSettle();
      await typeInto(tester, 'identifierField', _adminEmail);
      await typeInto(tester, 'passwordField', _adminPassword);
      await tapKey(tester, 'passwordSubmit');
      await pumpUntil(tester, find.byKey(const Key('homeWelcome')));

      expect(_location(tester, app), '/');
      expect(app.store.account!.serverOrigin, _server);
      expect(app.store.refreshToken, isNotEmpty);
      final me = app.container(tester).read(meProvider).value!.data!;
      expect(me.user.email, _adminEmail);
      expect(me.organizations, isNotEmpty);
      await _settle(tester);
    },
    skip: _skip != null,
  );

  testWidgets(
    'invitation, then SMS code and password sign-in of the same account',
    (tester) async {
      final seed = _seed;
      final phone = '+90532${Random().nextInt(9000000) + 1000000}';
      final invite = (await tester.runAsync(() => _invite(seed, phone, '12')))!;
      expect(invite, startsWith(_server!));

      final app = await _launch(tester);
      // The SMS holds the web link {BASE_URL}/invite/{token}; pasting it into
      // the server field connects and opens the invitation in one go.
      await typeInto(tester, 'serverField', invite);
      await tapKey(tester, 'serverConnect');
      await pumpUntil(tester, find.byKey(const Key('inviteAccept')));
      expect(find.text('Unit 12'), findsOneWidget);
      await typeInto(tester, 'inviteName', 'Live Resident');
      await typeInto(tester, 'invitePassword', 'correct horse battery 2');
      await tapKey(tester, 'inviteAccept');
      await pumpUntil(tester, find.byKey(const Key('homeWelcome')));
      expect(app.store.account, isNotNull);
      final me = app.container(tester).read(meProvider).value!.data!;
      expect(me.user.phone, phone);

      // Sign out, then SMS one-time code (code read from the server log).
      await _signOut(tester, app);
      expect(app.store.account, isNull);
      await _connect(tester);
      await tester.tap(find.byKey(const Key('method_sms_otp')));
      await tester.pumpAndSettle();
      final mark = File(_logPath!).lengthSync();
      await typeInto(tester, 'phoneField', phone);
      await tapKey(tester, 'smsSend');
      await pumpUntil(tester, find.byKey(const Key('codeField')));
      final code = (await tester.runAsync(
        () => _waitForLog(
          RegExp(r'(?:sign-in code|kodunuz): (\d{6})'),
          after: mark,
        ),
      ))!.group(1)!;
      await typeInto(tester, 'codeField', code);
      await tapKey(tester, 'smsVerify');
      await pumpUntil(tester, find.byKey(const Key('homeWelcome')));
      expect(_location(tester, app), '/');

      // A wrong password is rejected with the translated message.
      await _signOut(tester, app);
      await _connect(tester);
      await tester.tap(find.byKey(const Key('method_password')));
      await tester.pumpAndSettle();
      await typeInto(tester, 'identifierField', phone);
      await typeInto(tester, 'passwordField', 'definitely wrong password');
      await tapKey(tester, 'passwordSubmit');
      await pumpUntil(
        tester,
        find.text('The code, password or link is wrong or has expired.'),
      );
      // The right one signs in (phone as identifier).
      await typeInto(tester, 'passwordField', 'correct horse battery 2');
      await tapKey(tester, 'passwordSubmit');
      await pumpUntil(tester, find.byKey(const Key('homeWelcome')));
      await _settle(tester);
    },
    skip: _skip != null,
  );

  testWidgets(
    'magic link: request, open the emailed openbekci:// link, signed in',
    (tester) async {
      final app = await _launch(tester);
      await _connect(tester);
      await tester.tap(find.byKey(const Key('method_magic_link')));
      await tester.pumpAndSettle();
      final mark = File(_logPath!).lengthSync();
      await typeInto(tester, 'emailField', _adminEmail);
      await tapKey(tester, 'magicSend');
      await pumpUntil(tester, find.byKey(const Key('magicSentBody')));
      final match = (await tester.runAsync(
        () => _waitForLog(
          // openbekci://<host>/login/magic?token=...[&scheme=http]
          RegExp(
            r'openbekci://[^\s"\\/]+/login/magic\?token=[A-Za-z0-9_\-]+(?:&scheme=http)?',
          ),
          after: mark,
        ),
      ))!;
      // The mail client opens the link in the app.
      app.links.add(AppLink.parse(match.group(0)!)!);
      await pumpUntil(tester, find.byKey(const Key('homeWelcome')));
      expect(app.store.account, isNotNull);

      // The link is single use.
      await _signOut(tester, app);
      await _connect(tester);
      app.links.add(AppLink.parse(match.group(0)!)!);
      await pumpUntil(
        tester,
        find.text('The code, password or link is wrong or has expired.'),
      );
      await _settle(tester);
    },
    skip: _skip != null,
  );

  testWidgets('site QR: join code, pick a unit, claim waits for approval', (
    tester,
  ) async {
    final seed = _seed;
    final app = await _launch(tester);
    // Scan: https-style QR payload {BASE_URL}/join/{code}.
    app.links.add(AppLink.parse('$_server/join/${seed.joinCode}')!);
    // A link for a server the app is not connected to asks first; Connect
    // resumes it.
    await pumpUntil(
      tester,
      find.text('Enter the server address to join your site.'),
    );
    await typeInto(tester, 'serverField', _server!);
    await tapKey(tester, 'serverConnect');
    await pumpUntil(tester, find.byKey(const Key('joinSignUp')));
    expect(find.textContaining('Live Site'), findsWidgets);

    // Sign up through the join code: a new phone number, then its SMS code.
    final phone = '+90535${Random().nextInt(9000000) + 1000000}';
    await tapKey(tester, 'joinSignUp');
    await tester.pumpAndSettle();
    final mark = File(_logPath!).lengthSync();
    await typeInto(tester, 'phoneField', phone);
    await tapKey(tester, 'smsSend');
    await pumpUntil(tester, find.byKey(const Key('codeField')));
    final code = (await tester.runAsync(
      () => _waitForLog(
        RegExp(r'(?:sign-in code|kodunuz): (\d{6})'),
        after: mark,
      ),
    ))!.group(1)!;
    await typeInto(tester, 'codeField', code);
    await tapKey(tester, 'smsVerify');
    // Back at the unit picker for the same code.
    await pumpUntil(tester, find.byKey(const Key('joinSubmit')));
    expect(_location(tester, app), '/join/${seed.joinCode}');
    await pumpUntil(tester, find.text('A Blok · 14'));

    await tester.tap(find.text('A Blok · 14'));
    await tester.pump();
    await tester.tap(find.text('Tenant'));
    await tester.pump();
    await tapKey(tester, 'joinSubmit');
    await pumpUntil(tester, find.byKey(const Key('claimTitle')));
    expect(find.text('Waiting for approval'), findsWidgets);
    expect(
      find.textContaining('review your request for unit 14'),
      findsOneWidget,
    );

    // The server has the pending claim for the manager.
    final claims = await tester.runAsync(
      () => _ok(
        seed.admin.get<dynamic>(
          '/v1/orgs/${seed.orgId}/unit-claims',
          queryParameters: {'status': 'pending'},
        ),
      ),
    );
    final items = (claims!['items'] as List).cast<Map<String, dynamic>>();
    expect(
      items.where((c) => c['unit_id'] == seed.units['14']),
      isNotEmpty,
      reason: 'pending claim visible to the manager',
    );

    // Home keeps showing it until the manager approves.
    await tapKey(tester, 'claimHome');
    await pumpUntil(tester, find.text('Request for 14: waiting for approval'));
    await _settle(tester);
  }, skip: _skip != null);

  testWidgets(
    'refresh: expired access token, concurrent calls share one refresh',
    (tester) async {
      final app = await _launch(tester);
      await _connect(tester);
      await tester.tap(find.byKey(const Key('method_password')));
      await tester.pumpAndSettle();
      await typeInto(tester, 'identifierField', _adminEmail);
      await typeInto(tester, 'passwordField', _adminPassword);
      await tapKey(tester, 'passwordSubmit');
      await pumpUntil(tester, find.byKey(const Key('homeWelcome')));

      final container = app.container(tester);
      final tokens = container.read(tokenManagerProvider)!;
      final api = container.read(apiProvider)!;
      final before = app.store.refreshToken;
      final stale = tokens.currentAccessToken;
      // Make the in-memory token garbage: every request now answers 401.
      await tokens.setTokens(
        accessToken: 'not-a-valid-token',
        accessExpiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
        refreshToken: before!,
      );
      final results = await tester.runAsync(
        () => Future.wait([for (var i = 0; i < 6; i++) api.me.meGet()]),
      );
      expect(results!.every((r) => r.statusCode == 200), isTrue);
      expect(tokens.refreshCount, 1, reason: 'six 401s, one refresh');
      expect(app.store.refreshToken, isNot(before), reason: 'rotated');
      expect(tokens.currentAccessToken, isNot(stale));
      await _settle(tester);
    },
    skip: _skip != null,
  );
}

/// Lets the claims request the home screen starts (GET /v1/me/unit-claims)
/// finish before the widget tree goes, so no timer outlives the test.
Future<void> _settle(WidgetTester tester) async {
  if (find.byType(OpenBekciApp).evaluate().isNotEmpty) {
    final container = ProviderScope.containerOf(
      tester.element(find.byType(OpenBekciApp)),
    );
    // Requests started inside the test zone finish through pumps.
    for (var i = 0; i < 50; i++) {
      if (!container.read(pendingClaimsProvider).isLoading) break;
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 100)),
      );
      await tester.pump(const Duration(milliseconds: 20));
    }
  }
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pumpWidget(const SizedBox());
}
