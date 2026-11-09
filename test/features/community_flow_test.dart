import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

import '../support/community_fixtures.dart';
import '../support/fake_api.dart';
import '../support/fixtures.dart';
import '../support/resident_harness.dart';

/// 15:00:30 in Istanbul on Monday 9 November 2026.
final clockNow = DateTime.utc(2026, 11, 9, 12, 0, 30);

class FakeQrImages implements QrImageService {
  final rendered = <String>[];

  @override
  Future<Uint8List> png(String data, {int size = 720}) async {
    rendered.add(data);
    return Uint8List.fromList([137, 80, 78, 71, 1, 2, 3]);
  }
}

class FakeUrlOpener implements UrlOpener {
  final opened = <Uri>[];
  bool ok = true;

  @override
  Future<bool> open(Uri uri) async {
    opened.add(uri);
    return ok;
  }
}

Map<String, Object?> personJson({String? gatePhone}) => {
  'id': personId,
  'org_id': orgId,
  'user_id': '0192a3f0-1000-7000-8000-0000000000aa',
  'display_name': 'Ayse Yilmaz',
  'contact': {'phone': '+905321234567', 'email': null},
  'national_id_masked': null,
  'national_id_country': null,
  'gate_contact_phone': gatePhone,
  'notes': null,
  'join_status': 'joined',
  'directory_consent': <Object?>[],
  'created_at': '2026-01-01T00:00:00Z',
  'updated_at': '2026-01-01T00:00:00Z',
  'version': 7,
};

void main() {
  late FakeQrImages qr;
  late FakeUrlOpener opener;

  ResidentApp build({
    Map<String, Object?>? me,
    Locale locale = const Locale('en'),
  }) {
    qr = FakeQrImages();
    opener = FakeUrlOpener();
    final r = ResidentApp(
      me: me,
      locale: locale,
      extra: [
        nowProvider.overrideWithValue(() => clockNow),
        qrImageServiceProvider.overrideWithValue(qr),
        urlOpenerProvider.overrideWithValue(opener),
      ],
    );
    r.adapter.answer(
      'GET /v1/orgs/$orgId/me/person',
      FakeResponse.ok(personJson(gatePhone: '+905551112233')),
    );
    return r;
  }

  Future<void> teardown(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
  }

  group('bookings', () {
    testWidgets('facilities show their rules and the fee', (tester) async {
      final r = build();
      await pumpResident(tester, r);
      await open(tester, '/more/bookings');
      expect(find.byKey(const Key('facility_$facilityId')), findsOneWidget);
      expect(find.text('Barbecue area'), findsOneWidget);
      expect(
        find.textContaining('Open Mon–Sun, 09:00 to 22:00'),
        findsOneWidget,
      );
      expect(find.textContaining('Up to 4 h per booking'), findsOneWidget);
      expect(find.textContaining('Book at least 1 h ahead'), findsOneWidget);
      expect(find.textContaining('Up to 30 days ahead'), findsOneWidget);
      expect(find.textContaining('2 per unit per month'), findsOneWidget);
      expect(find.textContaining('150'), findsOneWidget);
      await teardown(tester);
    });

    testWidgets(
      'the picker offers free slots, shows the fee and books with a key',
      (tester) async {
        final r = build();
        r.adapter.answer(
          'POST /v1/orgs/$orgId/bookings',
          FakeResponse(201, bookingJson()),
        );
        await pumpResident(tester, r);
        await open(tester, '/more/bookings/facility/$facilityId');
        await tapKey(tester, 'day_2026-11-21');
        await tapKey(tester, 'duration_120');
        const slot = 'slot_2026-11-21T12:00:00.000Z'; // 15:00 in Istanbul
        await tapKey(tester, slot);
        expect(find.byKey(const Key('feePreview')), findsOneWidget);
        expect(find.textContaining('150'), findsWidgets);
        expect(
          find.descendant(
            of: find.byKey(const Key('feePreview')),
            matching: find.textContaining('refunds the fee'),
          ),
          findsOneWidget,
          reason: 'cutoff is 24 h before the start',
        );
        await tapKey(tester, 'confirmBooking');
        final post = r.seen('POST /v1/orgs/$orgId/bookings').single;
        expect(post.headers['Idempotency-Key'], isNotEmpty);
        final body = bodyOf(post)! as Map<String, dynamic>;
        expect(body['facility_id'], facilityId);
        expect(body['unit_id'], unit12);
        expect(body['start'], '2026-11-21T12:00:00.000Z');
        expect(body['end'], '2026-11-21T14:00:00.000Z');
        expect(find.text('Booked. Your booking is confirmed.'), findsOneWidget);
        await teardown(tester);
      },
    );

    testWidgets('a taken slot cannot be picked', (tester) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/facilities/$facilityId/availability',
        const FakeResponse.ok({
          'facility_id': facilityId,
          'from': '2026-11-21T00:00:00Z',
          'to': '2026-11-22T00:00:00Z',
          'taken': [
            {'start': '2026-11-21T11:00:00Z', 'end': '2026-11-21T13:00:00Z'},
          ],
          'blocked': <Object?>[],
        }),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/bookings/facility/$facilityId');
      await tapKey(tester, 'day_2026-11-21');
      await tapKey(tester, 'duration_120');
      final taken = tester.widget<ChoiceChip>(
        find.byKey(const Key('slot_2026-11-21T12:00:00.000Z')),
      );
      expect(taken.onSelected, isNull);
      final free = tester.widget<ChoiceChip>(
        find.byKey(const Key('slot_2026-11-21T13:00:00.000Z')),
      );
      expect(free.onSelected, isNotNull);
      await teardown(tester);
    });

    testWidgets('a retry after a conflict reuses the Idempotency-Key', (
      tester,
    ) async {
      final r = build();
      var calls = 0;
      r.adapter.on('POST /v1/orgs/$orgId/bookings', (_) {
        calls++;
        return calls == 1
            ? FakeResponse.problem(409, 'conflict')
            : FakeResponse(201, bookingJson());
      });
      await pumpResident(tester, r);
      await open(tester, '/more/bookings/facility/$facilityId');
      await tapKey(tester, 'day_2026-11-21');
      await tapKey(tester, 'duration_120');
      await tapKey(tester, 'slot_2026-11-21T12:00:00.000Z');
      await tapKey(tester, 'confirmBooking');
      expect(
        find.text(
          'This conflicts with the current state. Reload and try again.',
        ),
        findsOneWidget,
      );
      await tapKey(tester, 'confirmBooking');
      final posts = r.seen('POST /v1/orgs/$orgId/bookings');
      expect(posts, hasLength(2));
      expect(
        posts[0].headers['Idempotency-Key'],
        posts[1].headers['Idempotency-Key'],
      );
      await teardown(tester);
    });

    testWidgets('a household role the facility does not allow cannot book', (
      tester,
    ) async {
      final me = residentMeJson(
        occupancies: [
          occupancyJson(kind: 'household', side: null, maySeeMoney: false),
        ],
      );
      final r = build(me: me);
      r.adapter.answer(
        'GET /v1/orgs/$orgId/facilities',
        FakeResponse.ok(
          pageOf([
            facilityJson(rules: rulesJson(who: ['owner'])),
          ]),
        ),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/bookings/facility/$facilityId');
      await tapKey(tester, 'day_2026-11-21');
      await tapKey(tester, 'duration_120');
      expect(
        find.text('Your household role cannot book this facility.'),
        findsOneWidget,
      );
      await teardown(tester);
    });

    testWidgets('my bookings: cancel shows the refund rule, then cancels', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/bookings/$bookingId:cancel',
        FakeResponse.ok(bookingJson(status: 'cancelled', refund: 15000)),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/bookings');
      await tester.tap(find.byKey(const Key('tabMyBookings')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('booking_$bookingId')), findsOneWidget);
      await tapKey(tester, 'cancel_$bookingId');
      expect(
        tester.widget<Text>(find.byKey(const Key('refundRule'))).data,
        contains('refunds the fee'),
      );
      await tapKey(tester, 'confirmCancel');
      final post = r
          .seen('POST /v1/orgs/$orgId/bookings/$bookingId:cancel')
          .single;
      expect(post.headers['Idempotency-Key'], isNotEmpty);
      expect(bodyOf(post), <String, Object?>{}, reason: 'never a null body');
      expect(find.text('Booking cancelled.'), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('cancelling after the cutoff says the fee is kept', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/bookings',
        FakeResponse.ok(
          pageOf([
            bookingJson(
              start: '2026-11-10T09:00:00Z',
              end: '2026-11-10T11:00:00Z',
            ),
          ]),
        ),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/bookings');
      await tester.tap(find.byKey(const Key('tabMyBookings')));
      await tester.pumpAndSettle();
      await tapKey(tester, 'cancel_$bookingId');
      expect(
        tester.widget<Text>(find.byKey(const Key('refundRule'))).data,
        contains('is refunded if you cancel before'),
      );
      await teardown(tester);
    });
  });

  group('visitors', () {
    testWidgets('expected visitors and a request waiting at the gate', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      await open(tester, '/more/visitors');
      expect(find.byKey(const Key('visitor_$entryId')), findsOneWidget);
      expect(
        find.byKey(const Key('pendingRequest_$requestId')),
        findsOneWidget,
      );
      expect(
        find.textContaining('Ali Veli is waiting at the gate'),
        findsOneWidget,
      );
      await teardown(tester);
    });

    testWidgets('the pass shows the server QR and shares image and text', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/entry/$entryId');
      expect(find.byKey(const Key('visitorQr')), findsOneWidget);
      await tapKey(tester, 'shareQr');
      expect(qr.rendered, ['obk1.abcDEF123']);
      final shared = r.share.shared.single;
      expect(shared.mime, 'image/png');
      expect(shared.filename, 'visitor-pass.png');
      expect(shared.size, greaterThan(0));
      expect(shared.text, contains('Mehmet Kaya'));
      expect(shared.text, contains('obk1.abcDEF123'));
      expect(shared.text, contains('Gul Yonetim'));
      await teardown(tester);
    });

    testWidgets('no QR is drawn when the server issued none', (tester) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/visitor-entries',
        FakeResponse.ok(pageOf([visitorEntryJson(qr: null)])),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/entry/$entryId');
      expect(find.byKey(const Key('visitorQr')), findsNothing);
      expect(find.byKey(const Key('noQr')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('pre-register: the entry is created with a window and shown', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/visitor-entries',
        FakeResponse(201, visitorEntryJson()),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/new');
      await typeInto(tester, 'visitorName', 'Mehmet Kaya');
      await typeInto(tester, 'visitorPlate', '34 abc 123');
      await tapKey(tester, 'visitFor_120');
      await tapKey(tester, 'registerVisitor');
      final post = r.seen('POST /v1/orgs/$orgId/visitor-entries').single;
      expect(post.headers['Idempotency-Key'], isNotEmpty);
      final body = bodyOf(post)! as Map<String, dynamic>;
      expect(body['site_id'], siteId);
      expect(body['unit_id'], unit12);
      expect(body['name'], 'Mehmet Kaya');
      expect(body['plate'], '34 ABC 123');
      // Next half hour after 15:00:30 local, for two hours.
      expect(body['window_from'], '2026-11-09T12:30:00.000Z');
      expect(body['window_to'], '2026-11-09T14:30:00.000Z');
      expect(topLocation(tester), '/more/visitors/entry/$entryId');
      expect(find.byKey(const Key('visitorQr')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('a name is required', (tester) async {
      final r = build();
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/new');
      expect(
        tester
            .widget<FilledButton>(find.byKey(const Key('registerVisitor')))
            .onPressed,
        isNull,
      );
      await teardown(tester);
    });

    testWidgets('recurring visitors: create, then revoke', (tester) async {
      final r = build();
      r.adapter
        ..answer(
          'POST /v1/orgs/$orgId/recurring-visitors',
          FakeResponse(201, recurringJson()),
        )
        ..answer(
          'POST /v1/orgs/$orgId/recurring-visitors/$recurringId:revoke',
          FakeResponse.ok(recurringJson(status: 'revoked', qr: null)),
        );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors');
      await tester.tap(find.byKey(const Key('tabRecurring')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('recurring_$recurringId')), findsOneWidget);
      await tapKey(tester, 'addVisitor');
      expect(topLocation(tester), '/more/visitors/recurring/new');
      await typeInto(tester, 'recurringName', 'Fatma Hanim');
      await tapKey(tester, 'recDay_6');
      await tapKey(tester, 'createRecurring');
      final post = r.seen('POST /v1/orgs/$orgId/recurring-visitors').single;
      final body = bodyOf(post)! as Map<String, dynamic>;
      expect(body['days'], [1, 2, 3, 4, 5, 6]);
      expect(body['start'], '09:00');
      expect(body['end'], '17:00');
      expect(body['valid_from'], '2026-11-09');
      expect(body['valid_to'], '2027-02-07', reason: 'three months by default');
      // The long-lived QR is on the detail screen; revoke it.
      expect(find.byKey(const Key('visitorQr')), findsOneWidget);
      await tapKey(tester, 'revokeRecurring');
      await tapKey(tester, 'confirmRevoke');
      expect(
        r.seen('POST /v1/orgs/$orgId/recurring-visitors/$recurringId:revoke'),
        hasLength(1),
      );
      await teardown(tester);
    });
  });

  group('approval request', () {
    testWidgets('who is waiting and the countdown, then approve', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
        FakeResponse.ok(approvalRequestJson(status: 'approved')),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId');
      expect(find.text('Ali Veli is waiting at the gate'), findsOneWidget);
      expect(find.textContaining('06XYZ789'), findsOneWidget);
      expect(
        tester.widget<Text>(find.byKey(const Key('countdown'))).data,
        'Answer within 1:30',
      );
      await tapKey(tester, 'approve');
      final post = r
          .seen(
            'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
          )
          .single;
      expect((bodyOf(post)! as Map)['decision'], 'approve');
      expect(post.headers['Idempotency-Key'], isNotEmpty);
      expect(find.byKey(const Key('resultApproved')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('deny', (tester) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
        FakeResponse.ok(approvalRequestJson(status: 'denied')),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId');
      await tapKey(tester, 'deny');
      final post = r
          .seen(
            'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
          )
          .single;
      expect((bodyOf(post)! as Map)['decision'], 'deny');
      expect(find.byKey(const Key('resultDenied')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('a button of the notification answers at once', (tester) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
        FakeResponse.ok(approvalRequestJson(status: 'denied')),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId?decision=deny');
      final posts = r.seen(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
      );
      expect(posts, hasLength(1), reason: 'sent once, not on every rebuild');
      expect((bodyOf(posts.single)! as Map)['decision'], 'deny');
      expect(find.byKey(const Key('resultDenied')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('after the expiry the gate contact hint shows the number', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/visitor-approval-requests',
        FakeResponse.ok(
          pageOf([approvalRequestJson(expiresAt: '2026-11-09T12:00:10Z')]),
        ),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId');
      expect(find.byKey(const Key('resultExpired')), findsOneWidget);
      expect(find.byKey(const Key('approve')), findsNothing);
      expect(find.byKey(const Key('gateContactHint')), findsOneWidget);
      expect(
        find.textContaining('+905551112233'),
        findsOneWidget,
        reason: 'the number the guard calls',
      );
      await teardown(tester);
    });

    testWidgets('without a gate contact number it invites to add one', (
      tester,
    ) async {
      final r = build();
      r.adapter
        ..answer('GET /v1/orgs/$orgId/me/person', FakeResponse.ok(personJson()))
        ..answer(
          'GET /v1/orgs/$orgId/visitor-approval-requests',
          FakeResponse.ok(pageOf([approvalRequestJson(status: 'expired')])),
        );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId');
      expect(find.byKey(const Key('setGateContact')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('an answer that comes too late (409) turns into the hint', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
        FakeResponse.problem(409, 'conflict'),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId');
      await tapKey(tester, 'approve');
      expect(find.byKey(const Key('resultExpired')), findsOneWidget);
      expect(find.byKey(const Key('gateContactHint')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('the countdown runs and the screen expires by itself', (
      tester,
    ) async {
      var offset = Duration.zero;
      final qr2 = FakeQrImages();
      final r = ResidentApp(
        extra: [
          nowProvider.overrideWithValue(() => clockNow.add(offset)),
          qrImageServiceProvider.overrideWithValue(qr2),
        ],
      );
      r.adapter.answer(
        'GET /v1/orgs/$orgId/me/person',
        FakeResponse.ok(personJson(gatePhone: '+905551112233')),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/visitors/requests/$requestId');
      expect(find.byKey(const Key('approve')), findsOneWidget);
      offset = const Duration(seconds: 100);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byKey(const Key('resultExpired')), findsOneWidget);
      await teardown(tester);
    });
  });

  testWidgets('parcels: waiting first, then the recently collected', (
    tester,
  ) async {
    final r = build();
    await pumpResident(tester, r);
    await open(tester, '/more/parcels');
    expect(find.byKey(const Key('parcel_$deliveryId')), findsOneWidget);
    expect(find.text('Large box'), findsOneWidget);
    expect(find.text('Envelope'), findsOneWidget);
    expect(find.textContaining('Waiting for you'), findsOneWidget);
    expect(find.text('Recently collected'), findsOneWidget);
    await teardown(tester);
  });

  group('governance', () {
    testWidgets('the assembly: when, where, agenda and call letter', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/meetings/$meetingId/call-letter',
        const FakeResponse(200, <int>[1, 2, 3]),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/assembly');
      expect(find.byKey(const Key('meeting_$meetingId')), findsOneWidget);
      await tapKey(tester, 'meeting_$meetingId');
      expect(find.text('Community hall'), findsOneWidget);
      expect(find.text('Approve the budget'), findsWidgets);
      expect(find.byKey(const Key('agenda_$agendaId')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('an owner answers the poll for the unit, one answer', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'PUT /v1/orgs/$orgId/agenda-items/$agendaId/poll/answer',
        const FakeResponse.ok({
          'agenda_item_id': agendaId,
          'unit_id': unit12,
          'unit_door_number': '12',
          'answer': 'yes',
          'answered_by': personId,
          'answered_at': '2026-11-09T12:00:00Z',
        }),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/assembly/$meetingId');
      expect(find.text('Do you approve the budget?'), findsOneWidget);
      await tapKey(tester, 'answer_${agendaId}_${unit12}_yes');
      final put = r
          .seen('PUT /v1/orgs/$orgId/agenda-items/$agendaId/poll/answer')
          .single;
      expect(put.headers['Idempotency-Key'], isNotEmpty);
      expect(bodyOf(put), {'unit_id': unit12, 'answer': 'yes'});
      await teardown(tester);
    });

    testWidgets('a tenant sees no answer buttons, only the owners-only note', (
      tester,
    ) async {
      final me = residentMeJson(
        occupancies: [occupancyJson(kind: 'tenant', side: 'tenant')],
      );
      final r = build(me: me);
      r.adapter.answer(
        'GET /v1/orgs/$orgId/meetings/$meetingId/me',
        FakeResponse.ok(myMeetingJson(eligible: [], qr: false)),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/assembly/$meetingId');
      expect(
        find.byKey(const Key('answer_${agendaId}_${unit12}_yes')),
        findsNothing,
      );
      expect(find.byKey(const Key('pollNoAnswer_$agendaId')), findsOneWidget);
      expect(find.byKey(const Key('checkInQr')), findsNothing);
      await teardown(tester);
    });

    testWidgets('a closed poll cannot be answered', (tester) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/agenda-items/$agendaId/poll',
        FakeResponse.ok(pollJson(status: 'closed')),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/assembly/$meetingId');
      final chip = tester.widget<ChoiceChip>(
        find.byKey(const Key('answer_${agendaId}_${unit12}_yes')),
      );
      expect(chip.onSelected, isNull);
      await teardown(tester);
    });

    testWidgets('an owner sees the check-in QR; answered units are marked', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/meetings/$meetingId/me',
        FakeResponse.ok(
          myMeetingJson(answered: [unit12], status: 'in_session'),
        ),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/assembly/$meetingId');
      expect(find.byKey(const Key('checkInQr')), findsOneWidget);
      expect(
        find.text('Show this QR code at the attendance desk.'),
        findsOneWidget,
      );
      expect(find.text('Answered'), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('closed meeting: the minutes open as a PDF', (tester) async {
      final r = build();
      const fileId = '0192a3f0-1000-7000-8000-0000000000fe';
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/meetings/$meetingId/me',
          FakeResponse.ok({
            ...myMeetingJson(status: 'closed'),
            'meeting': meetingJson(status: 'closed', minutes: 'doc-1'),
          }),
        )
        ..answer(
          'GET /v1/orgs/$orgId/meetings/$meetingId/minutes',
          const FakeResponse.ok({
            'meeting_id': meetingId,
            'document_id': 'doc-1',
            'file_id': fileId,
          }),
        )
        ..answer(
          'GET /v1/orgs/$orgId/files/$fileId',
          const FakeResponse(200, <int>[1, 2, 3, 4]),
        );
      await pumpResident(tester, r);
      await open(tester, '/more/assembly/$meetingId');
      await tapKey(tester, 'minutesTile');
      expect(r.seen('GET /v1/orgs/$orgId/files/$fileId'), hasLength(1));
      await teardown(tester);
    });

    testWidgets(
      'decisions: an owner sees all, a tenant only those for residents',
      (tester) async {
        final owner = build();
        await pumpResident(tester, owner);
        await open(tester, '/more/assembly/decisions');
        expect(find.byKey(const Key('decision_$decisionId')), findsOneWidget);
        expect(
          find.byKey(
            const Key('decision_0192a3f0-1000-7000-8000-0000000000fd'),
          ),
          findsOneWidget,
        );
        expect(find.byKey(const Key('residentsOnlyNote')), findsNothing);
        await teardown(tester);

        final tenantMe = residentMeJson(
          occupancies: [occupancyJson(kind: 'tenant', side: 'tenant')],
        );
        final tenant = build(me: tenantMe);
        await pumpResident(tester, tenant);
        await open(tester, '/more/assembly/decisions');
        expect(find.byKey(const Key('decision_$decisionId')), findsOneWidget);
        expect(
          find.byKey(
            const Key('decision_0192a3f0-1000-7000-8000-0000000000fd'),
          ),
          findsNothing,
        );
        expect(find.byKey(const Key('residentsOnlyNote')), findsOneWidget);
        await teardown(tester);
      },
    );
  });

  group('open in web', () {
    testWidgets('asks for a one-time link and opens it with next', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/me/web-login-link',
        const FakeResponse(201, {
          'token': 'tok123',
          'url':
              'https://gul.example.org/login/link/tok123?next=%2Forgs%2F$orgId%2Fbookings',
          'expires_at': '2026-11-09T12:02:00Z',
        }),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/bookings');
      await tapKey(tester, 'openInWeb');
      final post = r.seen('POST /v1/me/web-login-link').single;
      expect((bodyOf(post)! as Map)['next'], '/orgs/$orgId/bookings');
      expect(opener.opened.single.host, 'gul.example.org');
      expect(opener.opened.single.pathSegments, ['login', 'link', 'tok123']);
      await teardown(tester);
    });

    testWidgets('says so when the browser cannot be opened', (tester) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/me/web-login-link',
        const FakeResponse(201, {
          'token': 'tok123',
          'url': '/login/link/tok123',
          'expires_at': '2026-11-09T12:02:00Z',
        }),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/bookings');
      opener.ok = false;
      await tapKey(tester, 'openInWeb');
      expect(find.text('The browser could not be opened.'), findsOneWidget);
      expect(
        opener.opened.single.toString(),
        'https://gul.example.org/login/link/tok123?next=%2Forgs%2F$orgId%2Fbookings',
      );
      await teardown(tester);
    });
  });

  testWidgets('home tiles lead to the community screens', (tester) async {
    final r = build();
    await pumpResident(tester, r);
    await tapKey(tester, 'tileBookings');
    expect(topLocation(tester), '/more/bookings');
    goTo(tester, '/');
    await tester.pumpAndSettle();
    await tapKey(tester, 'tileVisitors');
    expect(topLocation(tester), '/more/visitors');
    goTo(tester, '/');
    await tester.pumpAndSettle();
    await tapKey(tester, 'tileParcels');
    expect(topLocation(tester), '/more/parcels');
    goTo(tester, '/');
    await tester.pumpAndSettle();
    await tapKey(tester, 'nextAssembly');
    expect(topLocation(tester), startsWith('/more/assembly/'));
    await teardown(tester);
  });

  testWidgets('the More tab lists the community screens', (tester) async {
    final r = build();
    await pumpResident(tester, r);
    await open(tester, '/more');
    for (final key in [
      'moreBookings',
      'moreVisitors',
      'moreParcels',
      'moreAssembly',
    ]) {
      expect(find.byKey(Key(key)), findsOneWidget, reason: key);
    }
    expect(find.text('Coming soon'), findsNothing);
    await teardown(tester);
  });

  testWidgets('Turkish strings load for the new screens', (tester) async {
    final r = build(locale: const Locale('tr'));
    await pumpResident(tester, r);
    await open(tester, '/more/bookings');
    final l = lookupAppLocalizations(const Locale('tr'));
    expect(find.text(l.bookingsTitle), findsOneWidget);
    await teardown(tester);
  });
}
