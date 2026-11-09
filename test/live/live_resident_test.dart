// Live exit-criteria tests of phase B: the resident core of the real app
// (router, shell, Dio, token manager, generated client, drift cache) against a
// running OpenBekci dev server. Skipped unless OPENBEKCI_LIVE_SERVER is set,
// like live_server_test.dart (same variables, see README "Live tests").
//
// The seed (through the admin API) builds a site from a units CSV with bank
// details and a cash box, an owner, a tenant and a household member of unit 12
// (each with an account), overdue dues on both sides, a recorded cash payment
// and a published announcement.
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
import 'package:image/image.dart' as img;
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/db/database.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/money/application/money_providers.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/features/tickets/application/tickets_providers.dart';

import '../support/resident_harness.dart' show FakePhotoPicker;

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

/// A seeded resident: account tokens and the person id.
class Resident {
  new({
    required this.phone,
    required this.personId,
    required this.refreshToken,
    required this.userId,
  });
  final String phone;
  final String personId;
  final String refreshToken;
  final String userId;
}

class Seed {
  new({
    required this.admin,
    required this.orgId,
    required this.siteId,
    required this.unitId,
    required this.owner,
    required this.tenant,
    required this.household,
    required this.announcementId,
    required this.instanceId,
  });
  final Dio admin;
  final String orgId;
  final String siteId;
  final String unitId;
  final Resident owner;
  final Resident tenant;
  final Resident household;
  final String announcementId;
  final String instanceId;
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

/// Admin writes carry an idempotency key unless the call sets its own.
void _addKeys(Dio dio) {
  dio.interceptors.add(
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
}

Future<Map<String, dynamic>> _ok(
  Future<Response<dynamic>> request, {
  int max = 300,
}) async {
  final r = await request;
  final status = r.statusCode ?? 0;
  if (status >= max) {
    throw StateError(
      'seed request failed: ${r.requestOptions.method} '
      '${r.requestOptions.path} -> $status ${r.data}',
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

/// Creates a person with a phone number, an occupancy, an SMS invitation, accepts it
/// with a password and signs in for tokens.
Future<Resident> _createResident(
  Dio admin, {
  required String orgId,
  required String siteId,
  required String unitId,
  required String name,
  required Map<String, Object?> occupancy,
}) async {
  final phone = '+90534${Random().nextInt(9000000) + 1000000}';
  final person = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/persons',
      data: {
        'display_name': name,
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
        ...occupancy,
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
      data: {'password': password, 'display_name': name, 'client': 'mobile'},
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
  return Resident(
    phone: phone,
    personId: person['id'] as String,
    refreshToken: tokens['refresh_token'] as String,
    userId:
        ((accepted['user'] ?? tokens['user']) as Map)['id'] as String? ?? '',
  );
}

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
        'name': 'Live Resident ${DateTime.now().millisecondsSinceEpoch}',
        'timezone': 'Europe/Istanbul',
        'currency': 'TRY',
      },
    ),
  );
  final siteId = site['id'] as String;

  // Units from a CSV (the "golden" import: one block, three flats).
  final csv = MultipartFile.fromString(
    'block,door_number,type\nA Blok,12,flat\nA Blok,14,flat\nA Blok,16,flat\n',
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

  // Bank details need the current version in If-Match.
  final bank = await _ok(
    admin.get<dynamic>('/v1/orgs/$orgId/sites/$siteId/bank-details'),
  );
  await _ok(
    admin.put<dynamic>(
      '/v1/orgs/$orgId/sites/$siteId/bank-details',
      data: {
        'iban': 'TR330006100519786457841326',
        'holder': 'Live Site Management',
        'bank_name': 'Test Bank',
      },
      options: Options(headers: {'If-Match': '"${bank['version']}"'}),
    ),
  );
  // The site's default ticket workflow and categories are created the first
  // time a manager reads them; residents cannot trigger it.
  await _ok(
    admin.get<dynamic>(
      '/v1/orgs/$orgId/ticket-categories',
      queryParameters: {'site_id': siteId},
    ),
  );
  // A category whose tickets are common (residents get the category's
  // visibility; only managers choose it per ticket).
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/ticket-categories',
      data: {
        'site_id': siteId,
        'name': 'Elevator',
        'default_visibility': 'common',
      },
    ),
  );
  final box = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/cash-boxes',
      data: {'site_id': siteId, 'name': 'Cash'},
    ),
  );

  final owner = await _createResident(
    admin,
    orgId: orgId,
    siteId: siteId,
    unitId: unitId,
    name: 'Live Owner',
    occupancy: {'kind': 'owner', 'side': 'owner'},
  );
  final tenant = await _createResident(
    admin,
    orgId: orgId,
    siteId: siteId,
    unitId: unitId,
    name: 'Live Tenant',
    occupancy: {'kind': 'tenant', 'side': 'tenant'},
  );
  final household = await _createResident(
    admin,
    orgId: orgId,
    siteId: siteId,
    unitId: unitId,
    name: 'Live Household',
    occupancy: {'kind': 'household', 'may_see_money': false},
  );

  // Overdue dues on both sides (so the late fee accrues), a cash payment.
  for (final (kind, amount) in [('owner', 100000), ('tenant', 60000)]) {
    await _ok(
      admin.post<dynamic>(
        '/v1/orgs/$orgId/charges',
        data: {
          'site_id': siteId,
          'unit_id': unitId,
          'debtor_kind': kind,
          'charge_type': 'dues',
          'amount': {'amount': amount, 'currency': 'TRY'},
          'due_date': '2026-10-01',
        },
        options: Options(headers: {'Idempotency-Key': 'seed-$kind-$siteId'}),
      ),
    );
  }
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/payments',
      data: {
        'site_id': siteId,
        'method': 'cash',
        'amount': {'amount': 20000, 'currency': 'TRY'},
        'received_on': '2026-11-05',
        'asset_account_id': box['account_id'],
        'debtor': {
          'mode': 'unit_side',
          'unit_id': unitId,
          'debtor_kind': 'owner',
        },
      },
      options: Options(headers: {'Idempotency-Key': 'seed-cash-$siteId'}),
    ),
  );

  final draft = await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/announcements',
      data: {
        'site_id': siteId,
        'title': 'Water cut on Saturday',
        'body_md': 'Water will be **off** from 9 to 12.',
        'audience': {'kind': 'site'},
        'channels': ['in_app'],
      },
    ),
  );
  await _ok(
    admin.post<dynamic>(
      '/v1/orgs/$orgId/announcements/${draft['id']}:publish',
      data: {
        'channels': ['in_app'],
      },
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
    tenant: tenant,
    household: household,
    announcementId: draft['id'] as String,
    instanceId: discovery['instance_id'] as String,
  );
}

class _En extends LocaleController {
  @override
  Locale? build() => const Locale('en');
}

/// The real stack for one signed-in resident: only storage, config and the
/// photo picker are replaced.
class LiveApp {
  new(Resident who, {FakePhotoPicker? picker}) {
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
          seedColor: Color(0xFF1A73E8),
        ),
      ),
      appInfoProvider.overrideWithValue(
        const AppInfo(version: '1.0.0', build: '1'),
      ),
      accountStoreProvider.overrideWithValue(store),
      databaseProvider.overrideWithValue(db),
      localeProvider.overrideWith(_En.new),
      incomingLinksProvider.overrideWithValue(const Stream<AppLink>.empty()),
      if (picker != null) photoPickerProvider.overrideWithValue(picker),
      httpAdapterProvider.overrideWithValue(
        IOHttpClientAdapter(
          createHttpClient: () => HttpClient()..idleTimeout = Duration.zero,
        ),
      ),
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

Future<void> pumpUntil(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 30),
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

Future<void> typeInto(WidgetTester tester, String key, String text) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.enterText(find.byKey(Key(key)), text);
  await tester.pump();
}

Future<void> tapKey(WidgetTester tester, String key) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.pump();
  await tester.tap(find.byKey(Key(key)));
  await tester.pump();
}

Future<LiveApp> _launch(
  WidgetTester tester,
  Resident who, {
  FakePhotoPicker? picker,
}) async {
  tester.view
    ..physicalSize = const Size(390 * 3, 844 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final app = LiveApp(who, picker: picker);
  addTearDown(app.dispose);
  await tester.pumpWidget(app.widget());
  await pumpUntil(tester, find.byKey(const Key('homeWelcome')));
  return app;
}

void _go(WidgetTester tester, LiveApp app, String location) {
  app.container(tester).read(routerProvider).go(location);
}

Future<Map<String, dynamic>> _admin(
  WidgetTester tester,
  Future<Response<dynamic>> Function(Dio) call,
) async {
  final r = await tester.runAsync(() => _ok(call(_seed.admin)));
  return r!;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  setUpAll(() async {
    if (_skip != null) return;
    _seed = await _seedSite();
  });

  testWidgets(
    'owner: home and statement per side, declared transfer, ticket with a '
    'photo, +1, comment, announcement read receipt',
    (tester) async {
      final s = _seed;
      final app = await _launch(
        tester,
        s.owner,
        picker: FakePhotoPicker([
          PickedPhoto(
            name: 'leak.png',
            bytes: img.encodePng(img.Image(width: 64, height: 48)),
          ),
        ]),
      );
      final c = app.container(tester);

      // Home: the owner side (the server lists the caller's own debtor side),
      // with the late fee accrued to today in its total.
      await pumpUntil(tester, find.byKey(Key('side_${s.unitId}_owner')));
      await pumpUntil(tester, find.byKey(const Key('tileAnnouncements')));
      final dash = c.read(dashboardProvider).value!.data!;
      final ownerSide = dash.sides.firstWhere(
        (x) => x.debtorKind.value == 'owner',
      );
      expect(ownerSide.principal.amount, 80000); // 1000.00 less the 200.00 cash
      expect(ownerSide.accruedLateFee.amount, greaterThanOrEqualTo(0));
      expect(
        ownerSide.total.amount,
        ownerSide.principal.amount + ownerSide.accruedLateFee.amount,
      );
      expect(dash.unreadAnnouncements, 1);
      expect(ownerSide.bankDetails?.iban, 'TR330006100519786457841326');

      // Statement of the owner side: the payment is a line, the fee is shown.
      await tester.tap(find.byKey(const Key('navMoney')));
      await pumpUntil(tester, find.byKey(const Key('totalDue')));
      await tapKey(tester, 'period_all');
      await pumpUntil(tester, find.byKey(const Key('line_1')));
      final repo = c.read(moneyRepositoryProvider)!;
      final statement = await tester.runAsync(
        () => repo.statementOrLedger(
          orgId: s.orgId,
          siteId: s.siteId,
          currency: 'TRY',
          today: _isoToday(),
          target: StatementTarget(
            unitId: s.unitId,
            unitLabel: '12',
            kind: 'owner',
          ),
          from: '2000-01-01',
          to: _isoToday(),
          side: ownerSide,
        ),
      );
      expect(statement, isNotNull);
      expect(statement!.totalDue.amount, ownerSide.total.amount);
      expect(statement.accruedLateFee.amount, ownerSide.accruedLateFee.amount);
      expect(statement.closingBalance.amount, 80000);
      expect(
        find.byKey(const Key('accruedLine')),
        ownerSide.accruedLateFee.amount > 0 ? findsOneWidget : findsNothing,
      );

      // Pay by transfer: declare 300.00.
      await tapKey(tester, 'payByTransfer');
      await pumpUntil(tester, find.byKey(const Key('bankDetails')));
      expect(find.text('TR330006100519786457841326'), findsOneWidget);
      await typeInto(tester, 'declareAmount', '300,00');
      await typeInto(tester, 'declareReference', 'LIVE-12');
      await tapKey(tester, 'declareSubmit');
      await pumpUntil(tester, find.byKey(const Key('declareDone')));
      final payments = await _admin(
        tester,
        (d) => d.get<dynamic>(
          '/v1/orgs/${s.orgId}/payments',
          queryParameters: {'site_id': s.siteId},
        ),
      );
      final declared = (payments['items'] as List)
          .cast<Map<String, dynamic>>()
          .where((p) => p['status'] == 'pending_declared');
      expect(declared, hasLength(1));
      expect(
        (declared.single['gross'] as Map<String, dynamic>)['amount'],
        30000,
      );
      expect(declared.single['reference'], 'LIVE-12');

      // The statement shows it as declared, awaiting confirmation, and the
      // balance did not move.
      _go(tester, app, '/money');
      await pumpUntil(
        tester,
        find.byWidgetPredicate(
          (w) =>
              w.key is ValueKey<String> &&
              (w.key! as ValueKey<String>).value.startsWith('declared_'),
        ),
      );

      // Ticket with a photo, common, then +1 and a comment.
      _go(tester, app, '/tickets/new');
      await pumpUntil(tester, find.byKey(const Key('ticketCategory')));
      await pumpUntilTrue(
        tester,
        () => c.read(ticketCategoriesProvider).value?.data?.isNotEmpty ?? false,
      );
      // Picking in the dropdown is covered by the widget tests; here the
      // first category the server offers is chosen.
      final categories = c.read(ticketCategoriesProvider).value!.data!;
      final shared = categories.firstWhere((x) => x.name == 'Elevator');
      c
          .read(ticketDraftProvider.notifier)
          .update((d) => d.copyWith(categoryId: shared.id));
      await tester.pump(const Duration(milliseconds: 400));
      await typeInto(tester, 'ticketTitleField', 'Leak in the cellar');
      await typeInto(tester, 'ticketDescriptionField', 'Water on the floor.');
      await tapKey(tester, 'addPhotoGallery');
      await pumpUntil(tester, find.byKey(const Key('photo_0')));
      await tapKey(tester, 'ticketSubmit');
      await pumpUntil(tester, find.byKey(const Key('ticketStatus')));
      final tickets = await _admin(
        tester,
        (d) => d.get<dynamic>(
          '/v1/orgs/${s.orgId}/tickets',
          queryParameters: {'site_id': s.siteId},
        ),
      );
      final ticket = (tickets['items'] as List)
          .cast<Map<String, dynamic>>()
          .single;
      expect(ticket['title'], 'Leak in the cellar');
      expect(ticket['visibility'], 'common');
      expect(ticket['attachments'] as List, hasLength(1));
      expect(ticket['reporter_person_id'], s.owner.personId);

      await tapKey(tester, 'voteButton');
      await pumpUntil(tester, find.textContaining('+1 given'));
      await typeInto(tester, 'commentField', 'Still leaking this morning');
      await tapKey(tester, 'commentSend');
      // The field clears once the comment was sent.
      await pumpUntilTrue(
        tester,
        () => tester
            .widget<TextField>(find.byKey(const Key('commentField')))
            .controller!
            .text
            .isEmpty,
      );
      await pumpUntil(tester, find.text('Still leaking this morning'));
      final comments = await _admin(
        tester,
        (d) => d.get<dynamic>(
          '/v1/orgs/${s.orgId}/tickets/${ticket['id']}/comments',
        ),
      );
      expect(
        (comments['items'] as List).cast<Map<String, dynamic>>().map(
          (m) => m['body'],
        ),
        contains('Still leaking this morning'),
      );
      final refreshed = await _admin(
        tester,
        (d) => d.get<dynamic>('/v1/orgs/${s.orgId}/tickets/${ticket['id']}'),
      );
      expect(refreshed['vote_count'], 1);

      // The status shown is the workflow's own name for the initial status.
      expect(find.text(refreshed['status_name'] as String), findsWidgets);

      // Announcement: opening it sends the read receipt.
      _go(tester, app, '/more/announcements/${s.announcementId}');
      await pumpUntil(tester, find.byKey(const Key('announcementBody')));
      // The receipt is sent once the announcement is on screen: poll the
      // admin view (pumping the app in between) until it shows.
      var read = false;
      for (var i = 0; i < 40 && !read; i++) {
        await tester.pump(const Duration(milliseconds: 50));
        final reads = await _admin(
          tester,
          (d) => d.get<dynamic>(
            '/v1/orgs/${s.orgId}/announcements/${s.announcementId}/reads',
          ),
        );
        read = (reads['items'] as List).cast<Map<String, dynamic>>().any(
          (r) => r['person_id'] == s.owner.personId && r['read_at'] != null,
        );
        if (!read) {
          await tester.runAsync(
            () => Future<void>.delayed(const Duration(milliseconds: 250)),
          );
        }
      }
      expect(read, isTrue, reason: 'the read receipt reached the server');
      await _finish(tester);
    },
    skip: _skip != null,
    timeout: const Timeout(Duration(minutes: 4)),
  );

  testWidgets(
    'tenant sees the tenant side only',
    (tester) async {
      final s = _seed;
      final app = await _launch(tester, s.tenant);
      await pumpUntil(tester, find.byKey(Key('side_${s.unitId}_tenant')));
      expect(find.byKey(Key('side_${s.unitId}_owner')), findsNothing);
      final dash = app.container(tester).read(dashboardProvider).value!.data!;
      expect(dash.sides.map((x) => x.debtorKind.value), ['tenant']);
      expect(dash.sides.single.principal.amount, 60000);
      await tester.tap(find.byKey(const Key('navMoney')));
      await pumpUntil(tester, find.byKey(const Key('totalDue')));
      expect(find.byKey(Key('side_${s.unitId}:owner')), findsNothing);
      expect(find.byKey(const Key('payByTransfer')), findsOneWidget);
      await _finish(tester);
    },
    skip: _skip != null,
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'household member without may_see_money sees no money at all',
    (tester) async {
      final s = _seed;
      final app = await _launch(tester, s.household);
      await pumpUntil(tester, find.byKey(const Key('noMoneyNote')));
      expect(find.byKey(const Key('navMoney')), findsNothing);
      final dash = app.container(tester).read(dashboardProvider).value!.data!;
      expect(dash.sides, isEmpty);
      // The server refuses the statement too (S3: no money without access).
      final repo = app.container(tester).read(moneyRepositoryProvider)!;
      final refused = await tester.runAsync(() async {
        try {
          await repo.statement(orgId: s.orgId, unitId: s.unitId, kind: 'owner');
          return null;
        } on AppError catch (e) {
          return e.status;
        }
      });
      expect(refused, 403);
      await _finish(tester);
    },
    skip: _skip != null,
    timeout: const Timeout(Duration(minutes: 2)),
  );
}

String _isoToday() {
  final d = DateTime.now();
  return '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}

/// Lets in-flight requests finish (real sockets), then tears the app down so no
/// timer outlives the test.
Future<void> _finish(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox());
  // Requests still in flight own a 10 s connect-timeout timer in the fake
  // clock: let them finish in real time, then advance the clock past it.
  for (var i = 0; i < 3; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 800)),
    );
    await tester.pump(const Duration(seconds: 11));
  }
}
