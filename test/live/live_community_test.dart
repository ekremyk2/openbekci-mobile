// Live exit-criteria tests of phase C: bookings, visitors, parcels, governance
// and push of the real app (router, Dio, token manager, generated client, drift
// cache) against a running OpenBekci dev server. Skipped unless
// OPENBEKCI_LIVE_SERVER and OPENBEKCI_LIVE_LOG are set (see README, "Live
// tests"). Start the server with OPENBEKCI_PUSH_ALLOW_PRIVATE=true so it may
// post push payloads to the loopback endpoint of the push test.
import 'dart:async';
import 'dart:convert';
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
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/governance/application/governance_providers.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/push/application/push_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../support/push_harness.dart';

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

class Resident {
  new({
    required this.phone,
    required this.refreshToken,
    required this.userId,
    required this.personId,
  });
  final String phone;
  final String refreshToken;
  final String userId;
  final String personId;
}

class Seed {
  new({
    required this.admin,
    required this.orgId,
    required this.siteId,
    required this.unitId,
    required this.owner,
    required this.instanceId,
    required this.guardSession,
    required this.facilityId,
    required this.meetingId,
    required this.agendaId,
  });
  final Dio admin;
  final String orgId;
  final String siteId;
  final String unitId;
  final Resident owner;
  final String instanceId;
  final String guardSession;
  final String facilityId;
  final String meetingId;
  final String agendaId;
}

late Seed _seed;

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

void _addKeys(Dio dio) {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (o, h) {
        if (o.method != 'GET') {
          o.headers.putIfAbsent(
            'Idempotency-Key',
            () => 'livec-${DateTime.now().microsecondsSinceEpoch}-${_keys++}',
          );
        }
        h.next(o);
      },
    ),
  );
}

Future<Map<String, dynamic>> _ok(Future<Response<dynamic>> request) async {
  final r = await request;
  final status = r.statusCode ?? 0;
  if (status >= 300) {
    throw StateError(
      'seed request failed: ${r.requestOptions.method} '
      '${r.requestOptions.path} -> $status ${r.data}',
    );
  }
  final data = r.data;
  return data is Map ? data.cast<String, dynamic>() : const {};
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

String _iso(DateTime d) => d.toUtc().toIso8601String();

Future<Seed> _seedSite() async {
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
  _addKeys(admin);
  final me = await _ok(admin.get<dynamic>('/v1/me'));
  final orgId = ((me['organizations'] as List).first as Map)['id'] as String;
  final site = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/sites',
      data: {
        'name': 'Live Community ${DateTime.now().millisecondsSinceEpoch}',
        'timezone': 'Europe/Istanbul',
        'currency': 'TRY',
      },
    ),
  );
  final siteId = site['id'] as String;
  final csv = MultipartFile.fromString(
    'block,door_number,type\nA Blok,12,flat\nA Blok,14,flat\n',
    filename: 'units.csv',
    contentType: DioMediaType('text', 'csv'),
  );
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/units:import',
      data: FormData.fromMap({'site_id': siteId, 'file': csv}),
    ),
  );
  final units = await _ok(
    admin.get<dynamic>(
      '/v1/orgs/$orgId/units',
      queryParameters: {'site_id': siteId},
    ),
  );
  final unitId =
      (units['items'] as List).cast<Map<String, dynamic>>().firstWhere(
            (u) => u['door_number'] == '12',
          )['id']
          as String;

  // The owner of unit 12, with an account (invitation link from the log).
  final phone = '+90534${Random().nextInt(9000000) + 1000000}';
  final person = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/persons',
      data: {
        'display_name': 'Live Owner',
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
        'display_name': 'Live Owner',
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
  final owner = Resident(
    phone: phone,
    refreshToken: tokens['refresh_token'] as String,
    userId:
        ((accepted['user'] ?? tokens['user']) as Map)['id'] as String? ?? '',
    personId: person['id'] as String,
  );

  // A guard (a person with a guard membership and a PIN) for the walk-in and
  // the parcel; the console session is opened with the admin's login.
  final guard = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/persons',
      data: {'display_name': 'Live Guard'},
    ),
  );
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/memberships',
      data: {
        'person_id': guard['id'],
        'role': 'guard',
        'scope_type': 'site',
        'scope_id': siteId,
        'valid_from': '2026-01-01',
      },
    ),
  );
  await _ok(
    admin.put<dynamic>(
      '/v1/orgs/$orgId/persons/${guard['id']}/gate-pin',
      data: {'pin': '8642'},
    ),
  );
  final session = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/gate/sessions',
      data: {'site_id': siteId, 'person_id': guard['id'], 'pin': '8642'},
    ),
  );

  // A facility with a fee and a refund cutoff.
  final facility = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/facilities',
      data: {
        'site_id': siteId,
        'name': 'Barbecue area',
        'description': 'By the pool.',
        'rules': {
          'opening_hours': [
            {
              'days': [1, 2, 3, 4, 5, 6, 7],
              'start': '00:00',
              'end': '23:59',
            },
          ],
          'max_duration_minutes': 240,
          'max_days_ahead': 30,
          'min_notice_minutes': 0,
          'quota_per_unit': null,
          'quota_period': null,
          'who_may_book': ['owner', 'tenant', 'household'],
          'fee': {'amount': 15000, 'currency': 'TRY'},
          'cancel_refund_cutoff_hours': 24,
        },
        'enabled': true,
      },
    ),
  );

  // An assembly 20 days ahead (second call a week later) with a voted agenda
  // item and an open pre-meeting poll.
  final now = DateTime.now().toUtc();
  final meeting = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/meetings',
      data: {
        'site_id': siteId,
        'kind': 'general_assembly',
        'scope': 'site',
        'title': 'Live assembly',
        'scheduled_at': _iso(now.add(const Duration(days: 20))),
        'second_call_at': _iso(now.add(const Duration(days: 28))),
        'location': 'Community hall',
      },
    ),
  );
  final agenda = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/meetings/${meeting['id']}/agenda-items',
      data: {
        'title': 'Approve the budget',
        'description': 'The budget for next year.',
        'will_be_voted': true,
      },
    ),
  );
  await _ok(
    admin.put<dynamic>(
      '/v1/orgs/$orgId/agenda-items/${agenda['id']}/poll',
      data: {
        'question': 'Do you approve the budget?',
        'opens_at': _iso(now.subtract(const Duration(minutes: 5))),
        'closes_at': _iso(now.add(const Duration(days: 10))),
      },
    ),
  );
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/meetings/${meeting['id']}:call',
      data: {'notify_channels': <String>[]},
    ),
  );
  final discovery = await _ok(
    _dio().get<dynamic>('/.well-known/openbekci.json'),
  );
  return Seed(
    admin: admin,
    orgId: orgId,
    siteId: siteId,
    unitId: unitId,
    owner: owner,
    instanceId: discovery['instance_id'] as String,
    guardSession: session['token'] as String,
    facilityId: facility['id'] as String,
    meetingId: meeting['id'] as String,
    agendaId: agenda['id'] as String,
  );
}

class _En extends LocaleController {
  @override
  Locale? build() => const Locale('en');
}

class LiveApp {
  new(Resident who, {List<Override> extra = const []}) {
    store = MemoryAccountStore()
      ..account = Account(
        serverOrigin: _server!,
        instanceId: _seed.instanceId,
        instanceName: 'Live',
        userId: who.userId,
      )
      ..refreshToken = who.refreshToken;
    db = AppDatabase.forTesting(NativeDatabase.memory());
    overrides = [
      appConfigProvider.overrideWithValue(
        const AppConfig(
          flavor: Flavor.dev,
          appName: 'OpenBekci',
          relayId: 'official',
          seedColor: Color(0xFFBD4E27),
        ),
      ),
      appInfoProvider.overrideWithValue(
        const AppInfo(version: '1.0.0', build: '1'),
      ),
      accountStoreProvider.overrideWithValue(store),
      databaseProvider.overrideWithValue(db),
      localeProvider.overrideWith(_En.new),
      incomingLinksProvider.overrideWithValue(const Stream<AppLink>.empty()),
      httpAdapterProvider.overrideWithValue(
        IOHttpClientAdapter(
          createHttpClient: () => HttpClient()..idleTimeout = Duration.zero,
        ),
      ),
      ...extra,
    ];
  }

  late final MemoryAccountStore store;
  late final AppDatabase db;
  late final List<Override> overrides;

  Widget widget() =>
      ProviderScope(overrides: overrides, child: const OpenBekciApp());

  ProviderContainer container(WidgetTester tester) =>
      ProviderScope.containerOf(tester.element(find.byType(OpenBekciApp)));

  Future<void> dispose() => db.close();
}

Future<void> pumpUntilTrue(
  WidgetTester tester,
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 80)),
    );
    await tester.pump(const Duration(milliseconds: 40));
    if (condition()) return;
  }
  throw TestFailure('timed out waiting for a condition');
}

Future<void> pumpUntil(WidgetTester tester, Finder finder) =>
    pumpUntilTrue(tester, () => finder.evaluate().isNotEmpty);

Future<void> tapKey(WidgetTester tester, String key) async {
  // A lazy list builds only what is near the screen: scroll to it first.
  if (find.byKey(Key(key)).evaluate().isEmpty) {
    await tester.scrollUntilVisible(
      find.byKey(Key(key)),
      300,
      scrollable: find
          .descendant(
            of: find.byType(ListView).last,
            matching: find.byType(Scrollable),
          )
          .first,
    );
  }
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.pump();
  await tester.tap(find.byKey(Key(key)));
  await tester.pump();
}

Future<void> typeInto(WidgetTester tester, String key, String text) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.enterText(find.byKey(Key(key)), text);
  await tester.pump();
}

Future<LiveApp> _launch(
  WidgetTester tester, {
  List<Override> extra = const [],
}) async {
  tester.view
    ..physicalSize = const Size(390 * 3, 844 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  // Refresh tokens rotate: every launch signs in again.
  final fresh = await tester.runAsync(
    () => _ok(
      _dio().post<dynamic>(
        '/v1/auth/token',
        data: {
          'method': 'password',
          'identifier': _seed.owner.phone,
          'password': 'correct horse battery 9',
          'client': 'mobile',
        },
      ),
    ),
  );
  final who = Resident(
    phone: _seed.owner.phone,
    refreshToken: fresh!['refresh_token'] as String,
    userId: _seed.owner.userId,
    personId: _seed.owner.personId,
  );
  final app = LiveApp(who, extra: extra);
  addTearDown(app.dispose);
  await tester.pumpWidget(app.widget());
  await pumpUntil(tester, find.byKey(const Key('homeWelcome')));
  return app;
}

/// Tears the app down and lets its last timers run out.
Future<void> _finish(WidgetTester tester) async {
  await _settle(tester);
  await tester.pump(const Duration(minutes: 2));
}

void _go(WidgetTester tester, LiveApp app, String location) =>
    app.container(tester).read(routerProvider).go(location);

String _orgPath(String tail) => '/v1/orgs/${_seed.orgId}$tail';

/// A visitor at the gate or a parcel, logged by the guard (real async: the
/// widget tester's fake clock would never complete a socket).
Future<Map<String, dynamic>> _guard(
  WidgetTester tester,
  String path,
  Map<String, Object?> body,
) async => (await tester.runAsync(
  () => _ok(
    _seed.admin.post<dynamic>(
      _orgPath(path),
      data: body,
      options: Options(headers: {'X-Guard-Session': _seed.guardSession}),
    ),
  ),
))!;

Future<Map<String, dynamic>> _adminGet(
  WidgetTester tester,
  String path, {
  Map<String, Object?>? query,
}) async => (await tester.runAsync(
  () => _ok(_seed.admin.get<dynamic>(_orgPath(path), queryParameters: query)),
))!;

void main() {
  if (_skip != null) {
    test('live community suite', () {}, skip: _skip);
    return;
  }
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;
  SharedPreferences.setMockInitialValues({});

  setUpAll(() async {
    _seed = await _seedSite();
  });

  testWidgets('book a facility with a fee, then cancel with a refund', (
    tester,
  ) async {
    final app = await _launch(tester);
    _go(tester, app, '/more/bookings/facility/${_seed.facilityId}');
    final dayChips = find.byWidgetPredicate(
      (w) => w is ChoiceChip && w.key.toString().contains("'day_"),
    );
    await pumpUntil(tester, dayChips);
    // Three days ahead: well before the 24 h refund cutoff.
    await tester.ensureVisible(dayChips.at(3));
    await tester.pump();
    await tester.tap(dayChips.at(3));
    await tester.pump();
    await tapKey(tester, 'duration_60');
    final slots = find.byWidgetPredicate(
      (w) => w is ChoiceChip && w.key.toString().contains("'slot_"),
    );
    await pumpUntil(tester, slots);
    await tester.ensureVisible(slots.at(20));
    await tester.pump();
    await tester.tap(slots.at(20));
    await tester.pump();
    // What the sheet promises before the tap must be what the server charges.
    final preview = [
      for (final t in tester.widgetList<Text>(
        find.descendant(
          of: find.byKey(const Key('feePreview')),
          matching: find.byType(Text),
        ),
      ))
        t.data ?? t.textSpan?.toPlainText() ?? '',
    ].join(' ');
    await tapKey(tester, 'confirmBooking');
    await tester.pump(const Duration(milliseconds: 300));
    late Map<String, dynamic> booking;
    var items = <Map<String, dynamic>>[];
    for (var i = 0; i < 60 && items.isEmpty; i++) {
      final listed = await _adminGet(
        tester,
        '/bookings',
        query: {'site_id': _seed.siteId},
      );
      items = (listed['items'] as List).cast<Map<String, dynamic>>();
      if (items.isEmpty) {
        await tester.runAsync(
          () => Future<void>.delayed(const Duration(milliseconds: 250)),
        );
        await tester.pump(const Duration(milliseconds: 100));
      }
    }
    booking = items.single;
    expect(booking['status'], 'confirmed');
    expect((booking['fee'] as Map)['amount'], 15000);
    expect(
      preview,
      contains(
        formatMoney(
          (booking['fee'] as Map)['amount'] as int,
          (booking['fee'] as Map)['currency'] as String,
          locale: 'en',
        ),
      ),
      reason: 'the previewed fee equals the fee the server charged',
    );
    expect(booking['charge_id'], isNotNull, reason: 'the fee posts a charge');

    // My bookings: cancel, the refund rule is shown first.
    _go(tester, app, '/more/bookings');
    await pumpUntil(tester, find.byKey(const Key('tabMyBookings')));
    await tester.tap(find.byKey(const Key('tabMyBookings')));
    await tester.pump();
    await pumpUntil(tester, find.byKey(Key('cancel_${booking['id']}')));
    await tapKey(tester, 'cancel_${booking['id']}');
    await pumpUntil(tester, find.byKey(const Key('refundRule')));
    expect(
      tester.widget<Text>(find.byKey(const Key('refundRule'))).data,
      contains('refunds the fee'),
    );
    await tapKey(tester, 'confirmCancel');
    // The dialog closes (an animation) before the cancel is sent.
    await tester.pump(const Duration(milliseconds: 400));
    late Map<String, dynamic> after;
    for (var i = 0; i < 40; i++) {
      after = await _adminGet(tester, '/bookings/${booking['id']}');
      if (after['status'] == 'cancelled') break;
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 250)),
      );
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(after['status'], 'cancelled');
    expect((after['refund'] as Map?)?['amount'], 15000);
    await _finish(tester);
  });

  testWidgets('pre-register a visitor and read its QR token', (tester) async {
    final app = await _launch(tester);
    _go(tester, app, '/more/visitors/new');
    await pumpUntil(tester, find.byKey(const Key('visitorName')));
    await typeInto(tester, 'visitorName', 'Mehmet Kaya');
    await typeInto(tester, 'visitorPlate', '34abc123');
    await tapKey(tester, 'registerVisitor');
    await pumpUntil(tester, find.byKey(const Key('visitorQr')));
    final entries = app.container(tester).read(visitorEntriesProvider).value!;
    final e = entries.data!.firstWhere((x) => x.name == 'Mehmet Kaya');
    expect(e.plate, '34ABC123');
    expect(e.qrToken, startsWith('obk1.'));
    await _finish(tester);
  });

  testWidgets('answer a visitor approval request from the app', (tester) async {
    final app = await _launch(tester);
    final walkIn = await _guard(tester, '/gate/visitors:walk-in', {
      'site_id': _seed.siteId,
      'unit_id': _seed.unitId,
      'name': 'Ali Veli',
      'plate': '06XYZ789',
    });
    final entryId = (walkIn['id'] ?? walkIn['entry_id']) as String;
    _go(tester, app, '/more/visitors');
    // The request shows at the top of the visitors screen; open it.
    final pending = find.byWidgetPredicate(
      (w) => w.key.toString().contains("'pendingRequest_"),
    );
    await pumpUntil(tester, pending);
    await tester.tap(pending.first);
    await tester.pump();
    await pumpUntil(tester, find.byKey(const Key('approve')));
    await tapKey(tester, 'approve');
    await pumpUntil(tester, find.byKey(const Key('resultApproved')));
    final entry = await _adminGet(tester, '/visitor-entries/$entryId');
    expect(entry['approval_status'], 'approved');
    await _finish(tester);
  });

  testWidgets('a parcel logged by the guard is listed', (tester) async {
    final app = await _launch(tester);
    final parcel = await _guard(tester, '/gate/deliveries', {
      'site_id': _seed.siteId,
      'unit_id': _seed.unitId,
      'description': 'Large box',
    });
    _go(tester, app, '/more/parcels');
    await pumpUntil(tester, find.byKey(Key('parcel_${parcel['id']}')));
    expect(find.text('Large box'), findsOneWidget);
    await _finish(tester);
  });

  testWidgets('answer the pre-meeting poll and read the check-in token', (
    tester,
  ) async {
    final app = await _launch(tester);
    _go(tester, app, '/more/assembly/${_seed.meetingId}');
    final yes = 'answer_${_seed.agendaId}_${_seed.unitId}_yes';
    await pumpUntil(tester, find.byKey(Key(yes)));
    await tapKey(tester, yes);
    await pumpUntilTrue(tester, () {
      final d = app
          .container(tester)
          .read(meetingDetailProvider(_seed.meetingId))
          .value
          ?.data;
      return d != null &&
          d.my.polls.any((p) => p.answeredUnits.contains(_seed.unitId));
    });
    final detail = app
        .container(tester)
        .read(meetingDetailProvider(_seed.meetingId))
        .value!
        .data!;
    expect(detail.my.attendanceToken, isNotNull);
    expect(detail.my.attendanceQr, isNotNull);
    expect(detail.my.eligibleUnitIds, contains(_seed.unitId));
    expect(find.byKey(const Key('checkInQr')), findsOneWidget);
    await _finish(tester);
  });

  testWidgets(
    'push: a device registers as unifiedpush and the server posts the '
    'content-free payload to its endpoint',
    (tester) async {
      final received = <Map<String, Object?>>[];
      final http = await tester.runAsync(
        () => HttpServer.bind(InternetAddress.loopbackIPv4, 0),
      );
      http!.listen((req) async {
        final body = await utf8.decoder.bind(req).join();
        received.add((json.decode(body) as Map).cast<String, Object?>());
        req.response.statusCode = 201;
        await req.response.close();
      });
      addTearDown(() => http.close(force: true));
      final endpoint = 'http://127.0.0.1:${http.port}/up/abc';
      final transport = FakePushTransport(kind: 'unifiedpush', token: endpoint);
      final notifier = FakeLocalNotifier();
      final app = await _launch(
        tester,
        extra: [
          pushTransportProvider.overrideWithValue(transport),
          localNotifierProvider.overrideWithValue(notifier),
        ],
      );
      final container = app.container(tester);
      await pumpUntilTrue(tester, () {
        final h = container.read(pushControllerProvider).health;
        return h.registered;
      });
      // Registered on the server (the token never comes back).
      expect(transport.starts, 1);

      // A parcel arrives at the gate: the server notifies the owner, and
      // posts the payload straight to the UnifiedPush endpoint.
      await _guard(tester, '/gate/deliveries', {
        'site_id': _seed.siteId,
        'unit_id': _seed.unitId,
        'description': 'Push test parcel',
      });
      await pumpUntilTrue(tester, () => received.isNotEmpty);
      final payload = received.last;
      expect(payload.keys.toSet(), {
        'instance_id',
        'org_id',
        'notification_id',
        'type',
        'collapse_key',
        'badge',
      }, reason: 'exactly the six keys, nothing readable');
      expect(payload['instance_id'], _seed.instanceId);
      expect(payload['org_id'], _seed.orgId);
      expect(payload['type'], 'delivery.received');

      // The wire hands it to the app: a generic title, then the server text.
      transport.deliver(payload);
      await pumpUntilTrue(tester, () => notifier.shown.length >= 2);
      expect(notifier.shown.first.title, 'Parcel received');
      expect(notifier.shown.last.body, 'Push test parcel');
      await _finish(tester);
    },
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
