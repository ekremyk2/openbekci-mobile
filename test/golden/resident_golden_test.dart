import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' hide File, Notification;
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/home/home_screen.dart';
import 'package:openbekci_mobile/features/money/application/money_providers.dart';
import 'package:openbekci_mobile/features/money/presentation/money_screen.dart';
import 'package:openbekci_mobile/features/notifications/application/notifications_providers.dart';
import 'package:openbekci_mobile/features/tickets/application/tickets_providers.dart';
import 'package:openbekci_mobile/features/tickets/presentation/tickets_screens.dart';

import '../support/app_harness.dart';
import '../support/fixtures.dart';
import '../support/golden_support.dart';

/// Owner, tenant and household goldens of home and statement: they prove which
/// sides each kind of resident sees (mobile plan 17, phase B exit). Light, dark,
/// Turkish and RTL like phase A. Never regenerate on Windows: take the images
/// CI renders (see README).
void main() {
  setUpAll(ensureTimeZones);

  Stream<CacheState<T>> data<T>(T v) => Stream.value(CacheState<T>(data: v));

  List<Override> base({
    required Map<String, Object?> me,
    required Map<String, Object?> dash,
    Map<String, Object?>? statement,
    String statementKind = 'owner',
  }) {
    final store = MemoryAccountStore()
      ..account = const Account(
        serverOrigin: testOrigin,
        instanceId: '0192a3f0-1000-7000-8000-000000000999',
        instanceName: 'Gul Sitesi',
        userId: '0192a3f0-1000-7000-8000-0000000000aa',
      );
    return [
      appConfigProvider.overrideWithValue(testConfig()),
      accountStoreProvider.overrideWithValue(store),
      meProvider.overrideWith((ref) => data(Me.fromJson(me))),
      dashboardProvider.overrideWith((ref) => data(MeDashboard.fromJson(dash))),
      unreadCountProvider.overrideWith((ref) => data(3)),
      pendingClaimsProvider.overrideWith((ref) async => const <UnitClaim>[]),
      if (statement != null)
        statementProvider.overrideWith(
          (ref, q) => data(Statement.fromJson(statement)),
        ),
      paymentsProvider.overrideWith(
        (ref, t) => data([Payment.fromJson(paymentJson())]),
      ),
      ticketsProvider.overrideWith(
        (ref) => data([
          Ticket.fromJson(ticketJson()),
          Ticket.fromJson(
            ticketJson(
              id: '0192a3f0-1000-7000-8000-0000000000d2',
              title: 'Broken gate',
              status: 'Resolved',
              semantic: 'closed_like',
              visibility: 'private',
            ),
          ),
        ]),
      ),
    ];
  }

  final owner = residentMeJson();
  final tenant = residentMeJson(
    occupancies: [occupancyJson(kind: 'tenant', side: 'tenant')],
  );
  final household = residentMeJson(
    occupancies: [
      occupancyJson(kind: 'household', side: null, maySeeMoney: false),
    ],
  );
  final ownerDash = dashboardJson(
    sides: [
      sideJson(),
      sideJson(kind: 'tenant', total: 90000, fee: 0),
    ],
  );
  final tenantDash = dashboardJson(
    sides: [sideJson(kind: 'tenant', total: 90000, fee: 0)],
  );
  final householdDash = dashboardJson(sides: [], openTickets: 0);

  testWidgets('home: owner sees both sides', (tester) async {
    await expectGolden(
      tester,
      'home_owner',
      screen: HomeScreen.new,
      overrides: (_) => base(me: owner, dash: ownerDash),
    );
  });

  testWidgets('home: tenant sees the tenant side only', (tester) async {
    await expectGolden(
      tester,
      'home_tenant',
      screen: HomeScreen.new,
      overrides: (_) => base(me: tenant, dash: tenantDash),
    );
  });

  testWidgets('home: household without money access', (tester) async {
    await expectGolden(
      tester,
      'home_household',
      screen: HomeScreen.new,
      overrides: (_) => base(me: household, dash: householdDash),
    );
  });

  testWidgets('statement: owner side with the accrued late fee', (
    tester,
  ) async {
    await expectGolden(
      tester,
      'statement_owner',
      screen: MoneyScreen.new,
      overrides: (_) =>
          base(me: owner, dash: ownerDash, statement: statementJson()),
    );
  });

  testWidgets('statement: tenant side', (tester) async {
    await expectGolden(
      tester,
      'statement_tenant',
      screen: MoneyScreen.new,
      overrides: (_) => base(
        me: tenant,
        dash: tenantDash,
        statement: statementJson(kind: 'tenant', fee: 0),
      ),
    );
  });

  testWidgets('statement: household with no money access sees nothing', (
    tester,
  ) async {
    await expectGolden(
      tester,
      'statement_household',
      screen: MoneyScreen.new,
      overrides: (_) => base(me: household, dash: householdDash),
    );
  });

  testWidgets('tickets list: open and closed, 200 percent text', (
    tester,
  ) async {
    await expectGolden(
      tester,
      'tickets_list_large_text',
      screen: TicketsScreen.new,
      textScale: 2,
      variants: const [lightEn, rtlAr],
      overrides: (_) => base(me: owner, dash: ownerDash),
    );
  });
}
