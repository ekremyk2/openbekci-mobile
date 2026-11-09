import 'package:flutter/material.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' hide File, Notification;
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/community/presentation/bookings_screens.dart';
import 'package:openbekci_mobile/features/community/presentation/parcels_screen.dart';
import 'package:openbekci_mobile/features/community/presentation/visitors_screens.dart';
import 'package:openbekci_mobile/features/governance/application/governance_providers.dart';
import 'package:openbekci_mobile/features/governance/presentation/governance_screens.dart';
import 'package:openbekci_mobile/features/notifications/application/notifications_providers.dart';
import 'package:openbekci_mobile/features/notifications/presentation/notifications_screens.dart';
import 'package:openbekci_mobile/features/profile/application/profile_providers.dart';
import 'package:openbekci_mobile/features/push/application/push_service.dart';

import '../support/app_harness.dart';
import '../support/community_fixtures.dart';
import '../support/fixtures.dart';
import '../support/golden_support.dart';

/// Goldens of the phase C screens: light, dark, Turkish and the RTL pseudo
/// locale. New images are taken from the CI run (Linux), never rendered on
/// Windows or macOS and committed (see README).
void main() {
  setUpAll(ensureTimeZones);

  Stream<CacheState<T>> data<T>(T v) => Stream.value(CacheState<T>(data: v));

  // 15:00 in Istanbul on Monday 9 November 2026.
  final now = DateTime.utc(2026, 11, 9, 12);

  List<Override> base({Map<String, Object?>? me}) {
    final store = MemoryAccountStore()
      ..account = const Account(
        serverOrigin: testOrigin,
        instanceId: instanceId,
        instanceName: 'Gul Sitesi',
        userId: '0192a3f0-1000-7000-8000-0000000000aa',
      );
    return [
      appConfigProvider.overrideWithValue(testConfig()),
      accountStoreProvider.overrideWithValue(store),
      meProvider.overrideWith(
        (ref) => data(Me.fromJson(me ?? residentMeJson())),
      ),
      unreadCountProvider.overrideWith((ref) => data(3)),
      nowProvider.overrideWithValue(() => now),
      pushEnabledProvider.overrideWithValue(false),
    ];
  }

  final facility = Facility.fromJson(facilityJson());
  final noFee = Facility.fromJson(
    facilityJson(
      id: '0192a3f0-1000-7000-8000-0000000000e9',
      name: 'Meeting room',
      rules: rulesJson(feeAmount: null, quota: null),
    ),
  );

  testWidgets('bookings: facilities with their rules', (tester) async {
    await expectGolden(
      tester,
      'bookings_facilities',
      screen: BookingsScreen.new,
      overrides: (_) => [
        ...base(),
        facilitiesProvider.overrideWith((ref) => data([facility, noFee])),
        myBookingsProvider.overrideWith((ref) => data(<Booking>[])),
      ],
    );
  });

  testWidgets('bookings: my bookings', (tester) async {
    await expectGolden(
      tester,
      'bookings_mine',
      screen: BookingsScreen.new,
      overrides: (_) => [
        ...base(),
        facilitiesProvider.overrideWith((ref) => data([facility])),
        myBookingsProvider.overrideWith(
          (ref) => data([
            Booking.fromJson(bookingJson()),
            Booking.fromJson(
              bookingJson(
                id: '0192a3f0-1000-7000-8000-0000000000ea',
                status: 'cancelled',
                start: '2026-11-03T15:00:00Z',
                end: '2026-11-03T17:00:00Z',
                refund: 15000,
              ),
            ),
          ]),
        ),
      ],
      interact: (tester) async {
        for (var i = 0; i < 4; i++) {
          await tester.tap(find.byKey(const Key('tabMyBookings')).at(i));
        }
      },
    );
  });

  testWidgets('bookings: slot picker with the fee preview', (tester) async {
    await expectGolden(
      tester,
      'facility_picker',
      screen: () => FacilityScreen(
        facilityId: facility.id,
        initialDuration: 120,
        initialStart: DateTime.utc(2026, 11, 9, 14),
      ),
      overrides: (_) => [
        ...base(),
        facilitiesProvider.overrideWith((ref) => data([facility])),
        myBookingsProvider.overrideWith((ref) => data(<Booking>[])),
        availabilityProvider.overrideWith(
          (ref, q) async => Availability.fromJson({
            'facility_id': facility.id,
            'from': '2026-11-09T00:00:00Z',
            'to': '2026-11-10T00:00:00Z',
            'taken': [
              {'start': '2026-11-09T17:00:00Z', 'end': '2026-11-09T19:00:00Z'},
            ],
            'blocked': <Object?>[],
          }),
        ),
      ],
    );
  });

  final entry = VisitorEntry.fromJson(visitorEntryJson());

  testWidgets('visitors: expected, with a request at the gate', (tester) async {
    await expectGolden(
      tester,
      'visitors_expected',
      screen: VisitorsScreen.new,
      overrides: (_) => [
        ...base(),
        visitorEntriesProvider.overrideWith((ref) => data([entry])),
        recurringVisitorsProvider.overrideWith(
          (ref) => data([RecurringVisitor.fromJson(recurringJson())]),
        ),
        approvalRequestsProvider.overrideWith(
          (ref) =>
              data([VisitorApprovalRequest.fromJson(approvalRequestJson())]),
        ),
      ],
    );
  });

  testWidgets('visitors: the pass with its QR code', (tester) async {
    await expectGolden(
      tester,
      'visitor_pass',
      screen: () => VisitorEntryScreen(entryId: entry.id),
      overrides: (_) => [
        ...base(),
        visitorEntriesProvider.overrideWith((ref) => data([entry])),
      ],
    );
  });

  testWidgets('visitors: approve or deny with the countdown', (tester) async {
    await expectGolden(
      tester,
      'approval_pending',
      screen: () => const ApprovalRequestScreen(requestId: requestId),
      overrides: (_) => [
        ...base(),
        approvalRequestsProvider.overrideWith(
          (ref) =>
              data([VisitorApprovalRequest.fromJson(approvalRequestJson())]),
        ),
      ],
    );
  });

  testWidgets('visitors: expired, with the gate contact hint', (tester) async {
    await expectGolden(
      tester,
      'approval_expired',
      screen: () => const ApprovalRequestScreen(requestId: requestId),
      overrides: (_) => [
        ...base(),
        approvalRequestsProvider.overrideWith(
          (ref) => data([
            VisitorApprovalRequest.fromJson(
              approvalRequestJson(expiresAt: '2026-11-09T11:58:00Z'),
            ),
          ]),
        ),
        myPersonProvider.overrideWith(
          (ref) => data(
            Person.fromJson({
              'id': personId,
              'org_id': orgId,
              'user_id': '0192a3f0-1000-7000-8000-0000000000aa',
              'display_name': 'Ayse Yilmaz',
              'contact': {'phone': '+905321234567', 'email': null},
              'national_id_masked': null,
              'national_id_country': null,
              'gate_contact_phone': '+905551112233',
              'notes': null,
              'join_status': 'joined',
              'directory_consent': <Object?>[],
              'created_at': '2026-01-01T00:00:00Z',
              'updated_at': '2026-01-01T00:00:00Z',
              'version': 7,
            }),
          ),
        ),
      ],
    );
  });

  testWidgets('parcels: waiting and collected', (tester) async {
    await expectGolden(
      tester,
      'parcels',
      screen: ParcelsScreen.new,
      overrides: (_) => [
        ...base(),
        parcelsProvider.overrideWith(
          (ref) => data([
            Delivery.fromJson(deliveryJson()),
            Delivery.fromJson(
              deliveryJson(
                id: '0192a3f0-1000-7000-8000-0000000000fc',
                status: 'collected',
                description: 'Envelope',
              ),
            ),
          ]),
        ),
      ],
    );
  });

  MeetingDetail meeting({
    List<String> eligible = const [unit12],
    bool qr = true,
    String status = 'called',
  }) => MeetingDetail(
    my: MyMeeting.fromJson(
      myMeetingJson(eligible: eligible, qr: qr, status: status),
    ),
    agenda: [
      AgendaItem.fromJson(agendaItemJson()),
      AgendaItem.fromJson(
        agendaItemJson(
          id: '0192a3f0-1000-7000-8000-0000000000e8',
          position: 2,
          title: 'Elect the board',
        ),
      ),
    ],
    polls: {agendaId: Poll.fromJson(pollJson())},
  );

  testWidgets('assembly: agenda, poll and the owner check-in QR', (
    tester,
  ) async {
    await expectGolden(
      tester,
      'meeting_owner',
      screen: () => const MeetingScreen(meetingId: meetingId),
      overrides: (_) => [
        ...base(),
        meetingDetailProvider.overrideWith((ref, id) => data(meeting())),
      ],
    );
  });

  testWidgets('assembly: a tenant sees no poll buttons and no check-in', (
    tester,
  ) async {
    await expectGolden(
      tester,
      'meeting_tenant',
      screen: () => const MeetingScreen(meetingId: meetingId),
      overrides: (_) => [
        ...base(
          me: residentMeJson(
            occupancies: [occupancyJson(kind: 'tenant', side: 'tenant')],
          ),
        ),
        meetingDetailProvider.overrideWith(
          (ref, id) => data(meeting(eligible: [], qr: false)),
        ),
      ],
    );
  });

  final decisions = [
    Decision.fromJson(decisionJson()),
    Decision.fromJson(
      decisionJson(
        id: '0192a3f0-1000-7000-8000-0000000000fd',
        seq: 2,
        residents: false,
        outcome: 'rejected',
        text: 'The roof is repaired in spring.',
      ),
    ),
  ];

  testWidgets('decisions: an owner sees them all', (tester) async {
    await expectGolden(
      tester,
      'decisions_owner',
      screen: DecisionsScreen.new,
      overrides: (_) => [
        ...base(),
        decisionsProvider.overrideWith((ref) => data(decisions)),
      ],
    );
  });

  testWidgets('decisions: a tenant sees only those for residents', (
    tester,
  ) async {
    await expectGolden(
      tester,
      'decisions_tenant',
      screen: DecisionsScreen.new,
      overrides: (_) => [
        ...base(
          me: residentMeJson(
            occupancies: [occupancyJson(kind: 'tenant', side: 'tenant')],
          ),
        ),
        decisionsProvider.overrideWith((ref) => data(decisions)),
      ],
    );
  });

  testWidgets('notifications: the delayed hint', (tester) async {
    await expectGolden(
      tester,
      'notifications_delayed',
      screen: NotificationsScreen.new,
      variants: const [lightEn, rtlAr],
      overrides: (_) => [
        ...base(),
        notificationsProvider.overrideWith(
          (ref) => data([
            AppNotification.fromJson(
              notificationJson(type: 'delivery.received'),
            ),
          ]),
        ),
        pushDelayedHintProvider.overrideWithValue(true),
      ],
    );
  });
}
