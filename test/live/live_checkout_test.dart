// Live exit-criteria test of phase D: card checkout of the real app (router,
// Dio, token manager, generated client) against a running OpenBekci dev server
// built with `-tags examplepack`. Skipped unless OPENBEKCI_LIVE_SERVER and
// OPENBEKCI_LIVE_LOG are set (see README, "Live tests").
//
// The example pack's fake provider has no payment page a test can drive: the
// test plays the provider and posts the signed "paid" callback straight to the
// server (`POST .../packs/example/payments/example/webhook`, HMAC-SHA256 of the
// body in `X-Example-Signature`, keyed with the pack's webhook secret). The
// Custom Tab is a fake URL opener; the return link is fed to the app.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
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
import 'package:openbekci_mobile/core/services/services.dart';

import '../support/resident_harness.dart' show FakeUrlOpener;

final _server = Platform.environment['OPENBEKCI_LIVE_SERVER'];
final _logPath = Platform.environment['OPENBEKCI_LIVE_LOG'];
final _adminEmail =
    Platform.environment['OPENBEKCI_LIVE_ADMIN_EMAIL'] ?? 'ayse@example.org';
final _adminPassword =
    Platform.environment['OPENBEKCI_LIVE_ADMIN_PASSWORD'] ??
    'correct horse battery';
const _webhookSecret = 'whsec_live_0123456789';

String? get _skip => _server == null || _logPath == null
    ? 'set OPENBEKCI_LIVE_SERVER and OPENBEKCI_LIVE_LOG to run the live tests'
    : null;

Dio _dio({String? token}) => Dio(
  BaseOptions(
    baseUrl: _server!,
    validateStatus: (_) => true,
    headers: {
      'Accept': 'application/json',
      'Authorization': ?(token == null ? null : 'Bearer $token'),
    },
  ),
);

int _keys = 0;

Future<Map<String, dynamic>> _ok(
  Future<Response<dynamic>> request, {
  int max = 300,
}) async {
  final r = await request;
  if ((r.statusCode ?? 0) >= max) {
    throw StateError(
      'request failed: ${r.requestOptions.method} ${r.requestOptions.path} '
      '-> ${r.statusCode} ${r.data}',
    );
  }
  return (r.data as Map?)?.cast<String, dynamic>() ?? const {};
}

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

class _Seed {
  new({
    required this.admin,
    required this.orgId,
    required this.siteId,
    required this.unitId,
    required this.refreshToken,
    required this.userId,
    required this.instanceId,
    required this.chargeA,
    required this.chargeB,
  });
  final Dio admin;
  final String orgId;
  final String siteId;
  final String unitId;
  final String refreshToken;
  final String userId;
  final String instanceId;
  final String chargeA;
  final String chargeB;
}

late _Seed _seed;

/// An administrator, the example pack enabled, a site with one unit, an owner
/// with an account and two open charges (500.00 and 300.00).
Future<_Seed> _seedSite() async {
  final auth = await _ok(
    _dio().post<dynamic>(
      '/v1/auth/token',
      data: {
        'method': 'password',
        'identifier': _adminEmail,
        'password': _adminPassword,
        'client': 'mobile',
      },
    ),
  );
  final admin = _dio(token: auth['access_token'] as String);
  admin.interceptors.add(
    InterceptorsWrapper(
      onRequest: (o, h) {
        if (o.method != 'GET') {
          o.headers.putIfAbsent(
            'Idempotency-Key',
            () => 'live-${DateTime.now().microsecondsSinceEpoch}-${_keys++}',
          );
        }
        h.next(o);
      },
    ),
  );
  final me = await _ok(admin.get<dynamic>('/v1/me'));
  final orgId = ((me['organizations'] as List).first as Map)['id'] as String;
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/packs/example/enable',
      data: {
        'settings': {
          'example_api_key': 'live-key',
          'example_webhook_secret': _webhookSecret,
        },
      },
    ),
  );
  final site = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/sites',
      data: {
        'name': 'Live Checkout ${DateTime.now().millisecondsSinceEpoch}',
        'timezone': 'Europe/Istanbul',
        'currency': 'TRY',
      },
    ),
  );
  final siteId = site['id'] as String;
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/units:import',
      data: FormData.fromMap({
        'site_id': siteId,
        'file': MultipartFile.fromString(
          'block,door_number,type\nA Blok,12,flat\n',
          filename: 'units.csv',
          contentType: DioMediaType('text', 'csv'),
        ),
      }),
    ),
  );
  final units = await _ok(
    admin.get<dynamic>(
      '/v1/orgs/$orgId/units',
      queryParameters: {'site_id': siteId},
    ),
  );
  final unitId = ((units['items'] as List).first as Map)['id'] as String;

  final phone = '+90534${Random().nextInt(9000000) + 1000000}';
  final person = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/persons',
      data: {
        'display_name': 'Live Payer',
        'contact': {'phone': phone, 'preferred_channel': 'sms'},
      },
    ),
  );
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/occupancies',
      data: {
        'person_id': person['id'],
        'unit_id': unitId,
        'valid_from': '2026-01-01',
        'kind': 'owner',
        'side': 'owner',
      },
    ),
  );
  final mark = File(_logPath!).lengthSync();
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/invitations',
      data: {'site_id': siteId, 'person_id': person['id'], 'channel': 'sms'},
    ),
  );
  final link = (await _waitForLog(
    RegExp(r'https?://[^\s"\\]+/invite/[A-Za-z0-9_.\-]+'),
    after: mark,
  )).group(0)!;
  final token = link.substring(link.lastIndexOf('/invite/') + 8);
  const password = 'correct horse battery 9';
  final accepted = await _ok(
    _dio().post<dynamic>(
      '/v1/invitations/${Uri.encodeComponent(token)}:accept',
      data: {
        'password': password,
        'display_name': 'Live Payer',
        'client': 'mobile',
      },
    ),
  );
  final tokens = await _ok(
    _dio().post<dynamic>(
      '/v1/auth/token',
      data: {
        'method': 'password',
        'identifier': phone,
        'password': password,
        'client': 'mobile',
      },
    ),
  );

  Future<String> charge(int amount, String description) async {
    final c = await _ok(
      admin.post<dynamic>(
        '/v1/orgs/$orgId/charges',
        data: {
          'site_id': siteId,
          'unit_id': unitId,
          'debtor_kind': 'owner',
          'charge_type': 'dues',
          'amount': {'amount': amount, 'currency': 'TRY'},
          'due_date': '2026-12-01',
          'description': description,
        },
      ),
    );
    return c['id'] as String;
  }

  final discovery = await _ok(
    _dio().get<dynamic>('/.well-known/openbekci.json'),
  );
  return _Seed(
    admin: admin,
    orgId: orgId,
    siteId: siteId,
    unitId: unitId,
    refreshToken: tokens['refresh_token'] as String,
    userId:
        ((accepted['user'] ?? tokens['user']) as Map)['id'] as String? ?? '',
    instanceId: discovery['instance_id'] as String,
    chargeA: await charge(50000, 'Dues A'),
    chargeB: await charge(30000, 'Dues B'),
  );
}

class _En extends LocaleController {
  @override
  Locale? build() => const Locale('en');
}

/// The provider's "paid" callback, signed like the example pack expects.
Future<int> _providerPays(String checkoutUrl, {required int gross}) async {
  final s = _seed;
  final body = Uint8List.fromList(
    utf8.encode(
      jsonEncode({
        'event': 'paid',
        'txn': Uri.parse(checkoutUrl).pathSegments.last,
        'gross': gross,
        'fee': 0,
        'currency': 'TRY',
        'site': s.siteId,
        'unit': s.unitId,
        'debtor_kind': 'owner',
      }),
    ),
  );
  final signature = Hmac(
    sha256,
    utf8.encode(_webhookSecret),
  ).convert(body).toString();
  final r = await _dio().post<dynamic>(
    '/v1/orgs/${s.orgId}/packs/example/payments/example/webhook',
    data: body,
    options: Options(
      contentType: 'application/json',
      headers: {'X-Example-Signature': signature},
    ),
  );
  return r.statusCode ?? 0;
}

Future<void> _pumpUntil(WidgetTester tester, Finder finder) async {
  final end = DateTime.now().add(const Duration(seconds: 40));
  while (DateTime.now().isBefore(end)) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 80)),
    );
    await tester.pump(const Duration(milliseconds: 40));
    if (finder.evaluate().isNotEmpty) return;
  }
  throw TestFailure('timed out waiting for $finder');
}

Future<void> _tap(WidgetTester tester, String key) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.pump();
  await tester.tap(find.byKey(Key(key)));
  await tester.pump();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  setUpAll(() async {
    if (_skip != null) return;
    _seed = await _seedSite();
  });

  testWidgets(
    'owner: Pay by card, Custom Tab, provider callback, return link, mismatch',
    (tester) async {
      final s = _seed;
      final opener = FakeUrlOpener();
      final links = StreamController<AppLink>.broadcast();
      addTearDown(links.close);
      final db = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      final overrides = <Override>[
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
        accountStoreProvider.overrideWithValue(
          MemoryAccountStore()
            ..account = Account(
              serverOrigin: _server!,
              instanceId: s.instanceId,
              instanceName: 'Live',
              userId: s.userId,
            )
            ..refreshToken = s.refreshToken,
        ),
        databaseProvider.overrideWithValue(db),
        localeProvider.overrideWith(_En.new),
        incomingLinksProvider.overrideWithValue(links.stream),
        urlOpenerProvider.overrideWithValue(opener),
        httpAdapterProvider.overrideWithValue(
          IOHttpClientAdapter(
            createHttpClient: () => HttpClient()..idleTimeout = Duration.zero,
          ),
        ),
      ];
      tester.view
        ..physicalSize = const Size(390 * 3, 844 * 3)
        ..devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        ProviderScope(overrides: overrides, child: const OpenBekciApp()),
      );
      await _pumpUntil(tester, find.byKey(const Key('homeWelcome')));
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OpenBekciApp)),
      );

      // The site offers card payment (pack enabled): the button shows.
      await tester.tap(find.byKey(const Key('navMoney')));
      await _pumpUntil(tester, find.byKey(const Key('payByCard')));

      // Checkout 1: the charge "Dues A" (500.00).
      await _tap(tester, 'payByCard');
      await _pumpUntil(tester, find.byKey(Key('charge_${s.chargeA}')));
      await _tap(tester, 'charge_${s.chargeA}');
      await _tap(tester, 'checkoutContinue');
      await _pumpUntil(tester, find.byKey(const Key('checkout_pending')));
      expect(opener.opened, hasLength(1));
      expect(opener.opened.last.host, 'pay.example.test');

      // The provider confirms exactly what was asked.
      final first = (await tester.runAsync(
        () => _ok(
          s.admin.get<dynamic>(
            '/v1/orgs/${s.orgId}/checkouts',
            queryParameters: {'site_id': s.siteId},
          ),
        ),
      ))!;
      final firstUrl =
          ((first['items'] as List).single as Map)['checkout_url'] as String;
      expect(
        await tester.runAsync(() => _providerPays(firstUrl, gross: 50000)),
        200,
      );
      await _pumpUntil(tester, find.byKey(const Key('checkout_paid')));
      expect(find.byKey(const Key('checkoutMismatch')), findsNothing);

      // Checkout 2: an amount of 300.00, and the user comes back through the
      // return link while on another screen; the provider confirms 250.00.
      container.read(routerProvider).go('/money');
      await tester.pump(const Duration(milliseconds: 200));
      await _pumpUntil(tester, find.byKey(const Key('payByCard')));
      await _tap(tester, 'payByCard');
      await _pumpUntil(tester, find.byKey(const Key('checkoutAmount')));
      await tester.enterText(find.byKey(const Key('checkoutAmount')), '300,00');
      await tester.pump();
      await _tap(tester, 'checkoutContinue');
      await _pumpUntil(tester, find.byKey(const Key('checkout_pending')));
      final all = (await tester.runAsync(
        () => _ok(
          s.admin.get<dynamic>(
            '/v1/orgs/${s.orgId}/checkouts',
            queryParameters: {'site_id': s.siteId},
          ),
        ),
      ))!;
      final second = (all['items'] as List)
          .cast<Map<String, dynamic>>()
          .firstWhere(
            (c) => c['id'] != ((first['items'] as List).single as Map)['id'],
          );
      expect((second['amount'] as Map<String, dynamic>)['amount'], 30000);
      container.read(routerProvider).go('/money');
      await tester.pump(const Duration(milliseconds: 200));
      expect(
        await tester.runAsync(
          () => _providerPays(second['checkout_url'] as String, gross: 25000),
        ),
        200,
      );
      links.add(
        PayReturnLink(orgId: s.orgId, checkoutId: second['id'] as String),
      );
      await _pumpUntil(tester, find.byKey(const Key('checkout_paid')));
      expect(find.byKey(const Key('checkoutMismatch')), findsOneWidget);

      // My checkouts lists both; the server booked what the provider confirmed.
      container.read(routerProvider).go('/money/checkouts');
      await _pumpUntil(tester, find.byKey(Key('myCheckout_${second['id']}')));
      final mine = (await tester.runAsync(
        () => _ok(
          s.admin.get<dynamic>(
            '/v1/orgs/${s.orgId}/checkouts',
            queryParameters: {'site_id': s.siteId, 'status': 'paid'},
          ),
        ),
      ))!;
      expect(mine['items'], hasLength(2));
      final paid = (await tester.runAsync(
        () => _ok(
          s.admin.get<dynamic>(
            '/v1/orgs/${s.orgId}/payments',
            queryParameters: {'site_id': s.siteId},
          ),
        ),
      ))!;
      final grosses = [
        for (final p in (paid['items'] as List).cast<Map<String, dynamic>>())
          if ((p['method'] as String).startsWith('card:'))
            (p['gross'] as Map)['amount'],
      ]..sort();
      expect(grosses, [25000, 50000]);
    },
    skip: _skip != null,
    timeout: const Timeout(Duration(minutes: 3)),
  );
}
