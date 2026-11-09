import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/idempotency.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/community/domain/booking_logic.dart';
import 'package:openbekci_mobile/features/community/domain/visitors_logic.dart';
import 'package:openbekci_mobile/features/community/presentation/booking_widgets.dart';
import 'package:openbekci_mobile/features/governance/domain/governance_logic.dart';
import 'package:openbekci_mobile/features/push/application/web_link.dart';

import '../support/community_fixtures.dart';
import '../support/fixtures.dart';

const tz = 'Europe/Istanbul';

// 2026-11-09 15:00 in Istanbul (UTC+3).
final now = DateTime.utc(2026, 11, 9, 12);

FacilityRules rules({
  int? fee = 15000,
  int cutoff = 24,
  int? quota = 2,
  String period = 'month',
  List<String> who = const ['owner', 'tenant', 'household'],
}) => FacilityRules.fromJson(
  rulesJson(
    feeAmount: fee,
    cutoffHours: cutoff,
    quota: quota,
    quotaPeriod: period,
    who: who,
  ),
);

Booking booking({
  String id = bookingId,
  String status = 'confirmed',
  String start = '2026-11-21T15:00:00Z',
  String end = '2026-11-21T17:00:00Z',
  int? fee = 15000,
}) => Booking.fromJson(
  bookingJson(id: id, status: status, start: start, end: end, fee: fee),
);

void main() {
  setUpAll(() async {
    ensureTimeZones();
    await initializeDateFormatting();
  });

  group('fee preview and refund rule', () {
    final start = DateTime.utc(2026, 11, 21, 12); // 15:00 local

    test(
      'a fee is charged on confirmation and refundable until the cutoff',
      () {
        final q = BookingQuote.fromRules(rules(), start);
        expect(q.hasFee, isTrue);
        expect(q.fee!.amount, 15000);
        expect(q.refundableUntil, start.subtract(const Duration(hours: 24)));
        expect(q.refundableAt(now), isTrue);
        expect(
          q.refundableAt(start.subtract(const Duration(hours: 24))),
          isTrue,
        );
        expect(
          q.refundableAt(start.subtract(const Duration(hours: 23))),
          isFalse,
        );
      },
    );

    test('no fee means nothing to refund', () {
      for (final fee in [null, 0]) {
        final q = BookingQuote.fromRules(rules(fee: fee), start);
        expect(q.hasFee, isFalse);
        expect(q.refundableUntil, isNull);
        expect(q.refundableAt(now), isFalse);
      }
    });

    test('a facility without a cutoff never refunds', () {
      final r = FacilityRules.fromJson({
        ...rulesJson(),
        'cancel_refund_cutoff_hours': null,
      });
      final q = BookingQuote.fromRules(r, start);
      expect(q.hasFee, isTrue);
      expect(q.refundableUntil, isNull);
      expect(q.refundableAt(now), isFalse);
    });

    test('cancel outcome of an existing booking', () {
      final b = booking();
      final early = cancelOutcome(booking: b, cutoffHours: 24, now: now);
      expect(early.refunded, isTrue);
      expect(early.fee!.amount, 15000);
      final late = cancelOutcome(
        booking: b,
        cutoffHours: 24,
        now: DateTime.utc(2026, 11, 21, 10),
      );
      expect(late.refunded, isFalse);
      expect(late.until, DateTime.utc(2026, 11, 20, 15));
      final free = cancelOutcome(
        booking: booking(fee: null),
        cutoffHours: 24,
        now: now,
      );
      expect(free.fee, isNull);
      expect(free.refunded, isFalse);
    });
  });

  group('slot rules', () {
    DateTime at(int day, int hour, [int minute = 0]) =>
        siteInstant(tz, 2026, 11, day, hour: hour, minute: minute);

    BookingProblem? check(
      DateTime start,
      int minutes, {
      Availability? av,
      int used = 0,
      OccupancyRole? role,
      FacilityRules? r,
    }) => checkSlot(
      rules: r ?? rules(),
      start: start,
      end: start.add(Duration(minutes: minutes)),
      now: now,
      timezone: tz,
      availability: av,
      quotaAlreadyUsed: used,
      role: role,
    );

    test('a slot inside every rule is free', () {
      expect(check(at(21, 15), 120), isNull);
    });

    test('opening hours are read in the site timezone', () {
      expect(check(at(21, 8, 30), 60), BookingProblem.closed);
      expect(check(at(21, 21), 120), BookingProblem.closed);
      expect(check(at(21, 20), 120), isNull);
      expect(
        siteInstant(tz, 2026, 11, 21, hour: 9),
        DateTime.utc(2026, 11, 21, 6),
      );
    });

    test('maximum duration, lead time and horizon', () {
      expect(check(at(21, 10), 300), BookingProblem.tooLong);
      expect(
        check(now.add(const Duration(minutes: 30)), 60),
        BookingProblem.tooSoon,
      );
      expect(check(at(9 + 31, 12), 60), BookingProblem.tooFar);
      // 30 days ahead is the last allowed day.
      expect(check(siteInstant(tz, 2026, 12, 9, hour: 12), 60), isNull);
    });

    test('taken and blocked ranges', () {
      final av = Availability.fromJson({
        'facility_id': facilityId,
        'from': '2026-11-21T00:00:00Z',
        'to': '2026-11-22T00:00:00Z',
        'taken': [
          {'start': '2026-11-21T12:00:00Z', 'end': '2026-11-21T14:00:00Z'},
        ],
        'blocked': [
          {'start': '2026-11-21T17:00:00Z', 'end': '2026-11-21T18:00:00Z'},
        ],
      });
      expect(check(at(21, 15), 60, av: av), BookingProblem.taken);
      expect(check(at(21, 17), 60, av: av), isNull); // ends when it starts
      expect(
        check(at(21, 20, 30), 60, av: av),
        BookingProblem.taken,
      ); // blocked
      expect(check(at(21, 19), 60, av: av), isNull);
    });

    test('the quota of the unit and who may book', () {
      expect(check(at(21, 15), 60, used: 1), isNull);
      expect(check(at(21, 15), 60, used: 2), BookingProblem.quotaReached);
      final ownersOnly = rules(who: ['owner']);
      expect(
        check(at(21, 15), 60, role: OccupancyRole.tenant, r: ownersOnly),
        BookingProblem.notAllowed,
      );
      expect(
        check(at(21, 15), 60, role: OccupancyRole.owner, r: ownersOnly),
        isNull,
      );
    });

    test(
      'start times: every half hour inside the hours, with their problems',
      () {
        const day = (year: 2026, month: 11, day: 21);
        final slots = startTimes(
          rules: rules(),
          day: day,
          duration: 120,
          now: now,
          timezone: tz,
        );
        expect(slots.length, 23); // 09:00 .. 20:00
        expect(slots.first.start, DateTime.utc(2026, 11, 21, 6));
        expect(slots.last.start, DateTime.utc(2026, 11, 21, 17));
        expect(slots.every((s) => s.problem == null), isTrue);
        // Today, one hour of notice: 15:00 is too soon, 16:00 is fine.
        final today = startTimes(
          rules: rules(),
          day: (year: 2026, month: 11, day: 9),
          duration: 60,
          now: now,
          timezone: tz,
        );
        final byLocalHour = {
          for (final s in today)
            inSiteZone(s.start, tz).hour * 60 + inSiteZone(s.start, tz).minute:
                s.problem,
        };
        expect(byLocalHour[9 * 60], BookingProblem.tooSoon);
        expect(byLocalHour[15 * 60], BookingProblem.tooSoon);
        expect(byLocalHour[16 * 60], isNull);
      },
    );

    test('bookable days run from today to the horizon', () {
      final days = bookableDays(rules: rules(), now: now, timezone: tz);
      expect(days.length, 31);
      expect(days.first, (year: 2026, month: 11, day: 9));
      expect(days.last, (year: 2026, month: 12, day: 9));
      final weekdaysOnly = FacilityRules.fromJson({
        ...rulesJson(),
        'opening_hours': [
          {
            'days': [1, 2, 3, 4, 5],
            'start': '09:00',
            'end': '17:00',
          },
        ],
      });
      final wd = bookableDays(rules: weekdaysOnly, now: now, timezone: tz);
      expect(wd.every((d) => isoWeekday(d) <= 5), isTrue);
    });

    test('durations are half-hour steps up to the maximum', () {
      expect(durationChoices(rules()), [30, 60, 90, 120, 150, 180, 210, 240]);
    });
  });

  group('quota', () {
    test('counts confirmed bookings of the unit in the period', () {
      final mine = [
        booking(
          id: 'a',
          start: '2026-11-02T10:00:00Z',
          end: '2026-11-02T12:00:00Z',
        ),
        booking(
          id: 'b',
          start: '2026-11-21T10:00:00Z',
          end: '2026-11-21T12:00:00Z',
        ),
        booking(
          id: 'c',
          status: 'cancelled',
          start: '2026-11-22T10:00:00Z',
          end: '2026-11-22T12:00:00Z',
        ),
        booking(
          id: 'd',
          start: '2026-12-02T10:00:00Z',
          end: '2026-12-02T12:00:00Z',
        ),
      ];
      int used(FacilityRules r, DateTime start) => quotaUsed(
        mine: mine,
        rules: r,
        facilityId: facilityId,
        unitId: unit12,
        start: start,
        timezone: tz,
      );
      expect(used(rules(), DateTime.utc(2026, 11, 25, 12)), 2);
      expect(used(rules(), DateTime.utc(2026, 12, 20, 12)), 1);
      expect(used(rules(period: 'week'), DateTime.utc(2026, 11, 21, 12)), 1);
      expect(used(rules(quota: null), DateTime.utc(2026, 11, 21, 12)), 0);
    });
  });

  test('bookings: upcoming first, soonest first, then the rest', () {
    final list = sortBookings([
      booking(
        id: 'past',
        start: '2026-11-01T10:00:00Z',
        end: '2026-11-01T11:00:00Z',
      ),
      booking(
        id: 'later',
        start: '2026-12-01T10:00:00Z',
        end: '2026-12-01T11:00:00Z',
      ),
      booking(
        id: 'cancelled',
        status: 'cancelled',
        start: '2026-11-20T10:00:00Z',
        end: '2026-11-20T11:00:00Z',
      ),
      booking(
        id: 'soon',
        start: '2026-11-12T10:00:00Z',
        end: '2026-11-12T11:00:00Z',
      ),
    ], now);
    expect(
      [for (final b in list) b.id],
      ['soon', 'later', 'cancelled', 'past'],
    );
  });

  test('weekday and duration labels', () {
    expect(weekdaysLabel([1, 2, 3, 4, 5], 'en'), 'Mon–Fri');
    expect(weekdaysLabel([1, 3, 5], 'en'), 'Mon, Wed, Fri');
    expect(weekdaysLabel([6, 7], 'en'), 'Sat, Sun');
    expect(weekdaysLabel([5, 1, 1, 2, 9], 'en'), 'Mon, Tue, Fri');
    expect(weekdaysLabel([1, 2, 3, 4, 5], 'tr'), 'Pzt–Cum');
    expect(weekdaysLabel([], 'en'), '');
  });

  test('a range shows the end date only on another day', () {
    final s = DateTime.utc(2026, 11, 21, 12);
    final same = formatSiteRange(
      s,
      s.add(const Duration(hours: 2)),
      timezone: tz,
      locale: 'en',
    );
    expect(same, endsWith('– 17:00'));
    final next = formatSiteRange(
      s,
      s.add(const Duration(days: 1)),
      timezone: tz,
      locale: 'en',
    );
    expect(next, contains('Nov 22'));
  });

  group('visitors', () {
    test(
      'the QR payload is the server token, verbatim and only when valid',
      () {
        expect(visitorQrPayload('obk1.abcDEF123'), 'obk1.abcDEF123');
        expect(visitorQrPayload('  obk1.abc \n'), 'obk1.abc');
        expect(visitorQrPayload(null), isNull);
        expect(visitorQrPayload(''), isNull);
        expect(visitorQrPayload('obk1.'), isNull);
        expect(visitorQrPayload('abc123'), isNull);
        expect(visitorQrPayload('obk2.abc'), isNull);
      },
    );

    VisitorEntry entry({
      String from = '2026-11-21T09:00:00Z',
      String to = '2026-11-21T12:00:00Z',
      bool cancelled = false,
      String? arrived,
      String source = 'pre_registered',
      String id = entryId,
    }) => VisitorEntry.fromJson(
      visitorEntryJson(
        id: id,
        from: from,
        to: to,
        cancelled: cancelled,
        arrivedAt: arrived,
        source: source,
      ),
    );

    test('a pass is valid for its window plus 30 minutes either side', () {
      final e = entry();
      expect(
        passState(e, DateTime.utc(2026, 11, 21, 8, 29)),
        PassState.upcoming,
      );
      expect(passState(e, DateTime.utc(2026, 11, 21, 8, 30)), PassState.valid);
      expect(passState(e, DateTime.utc(2026, 11, 21, 12, 30)), PassState.valid);
      expect(passState(e, DateTime.utc(2026, 11, 21, 12, 31)), PassState.ended);
      expect(
        passState(entry(cancelled: true), DateTime.utc(2026, 11, 21, 10)),
        PassState.cancelled,
      );
      expect(
        passState(
          entry(arrived: '2026-11-21T10:00:00Z'),
          DateTime.utc(2026, 11, 21, 10),
        ),
        PassState.used,
      );
    });

    test('expected and history lists', () {
      final upcoming = entry(id: 'up');
      final ended = entry(
        id: 'old',
        from: '2026-11-01T09:00:00Z',
        to: '2026-11-01T10:00:00Z',
      );
      final walkIn = entry(id: 'walk', source: 'walk_in');
      final cancelled = entry(id: 'x', cancelled: true);
      final all = [ended, upcoming, walkIn, cancelled];
      expect([for (final e in expectedVisitors(all, now)) e.id], ['up']);
      expect(
        {for (final e in visitorHistory(all, now)) e.id},
        {'old', 'walk', 'x'},
      );
    });

    VisitorApprovalRequest request({String status = 'pending'}) =>
        VisitorApprovalRequest.fromJson(approvalRequestJson(status: status));

    test('approval countdown and phases', () {
      final r = request();
      final t0 = DateTime.utc(2026, 11, 9, 12);
      expect(approvalPhase(r, t0), ApprovalPhase.pending);
      expect(approvalRemaining(r, t0), const Duration(minutes: 2));
      expect(countdownText(approvalRemaining(r, t0)), '2:00');
      expect(
        countdownText(
          approvalRemaining(r, t0.add(const Duration(seconds: 61))),
        ),
        '0:59',
      );
      // After the expiry it is expired for the user, even if the server has
      // not flipped the status yet.
      final late = DateTime.utc(2026, 11, 9, 12, 2);
      expect(approvalPhase(r, late), ApprovalPhase.expired);
      expect(approvalRemaining(r, late), Duration.zero);
      expect(
        approvalPhase(request(status: 'approved'), t0),
        ApprovalPhase.approved,
      );
      expect(
        approvalPhase(request(status: 'denied'), t0),
        ApprovalPhase.denied,
      );
      expect(
        approvalPhase(request(status: 'expired'), t0),
        ApprovalPhase.expired,
      );
      expect(
        approvalPhase(request(status: 'something_new'), t0),
        ApprovalPhase.pending,
      );
    });

    test('recurring times must run forward', () {
      expect(recurringTimesValid('09:00', '17:00'), isTrue);
      expect(recurringTimesValid('17:00', '09:00'), isFalse);
      expect(recurringTimesValid('09:00', '09:00'), isFalse);
      expect(recurringTimesValid('9:00', '17:00'), isFalse);
    });

    test('parcels: waiting oldest first, collected only the recent ones', () {
      Delivery d(
        String id,
        String status, {
        String? collected,
        String received = '2026-11-08T14:00:00Z',
      }) => Delivery.fromJson({
        ...deliveryJson(id: id, status: status),
        'received_at': received,
        'collected_at': collected,
      });
      final all = [
        d('w2', 'waiting'),
        d('w1', 'waiting', received: '2026-11-01T14:00:00Z'),
        d('c-new', 'collected', collected: '2026-11-09T08:00:00Z'),
        d('c-old', 'collected', collected: '2026-09-01T08:00:00Z'),
      ];
      expect([for (final p in waitingParcels(all)) p.id], ['w1', 'w2']);
      expect([for (final p in recentParcels(all, now)) p.id], ['c-new']);
    });
  });

  group('governance', () {
    MeOccupancy occ(String kind, String unit, {String label = 'A D:12'}) =>
        MeOccupancy.fromJson(
          occupancyJson(
            unit: unit,
            kind: kind,
            side: kind == 'household' ? null : kind,
            label: label,
          ),
        );

    MyMeeting my(List<String> eligible) =>
        MyMeeting.fromJson(myMeetingJson(eligible: eligible));

    test('polls: one answer per unit, owners only', () {
      final owner = occ('owner', unit12);
      final tenant = occ('tenant', unit12);
      final household = occ('household', unit12);
      final other = occ('owner', unit14, label: 'A D:14');
      expect(pollEligibleUnits(my([unit12]), [owner]).map((o) => o.unitId), [
        unit12,
      ]);
      expect(pollEligibleUnits(my([unit12]), [tenant]), isEmpty);
      expect(pollEligibleUnits(my([unit12]), [household]), isEmpty);
      // An owned unit the server did not list is not answerable.
      expect(
        pollEligibleUnits(my([unit12]), [owner, other]).map((o) => o.unitId),
        [unit12],
      );
      // The same unit twice (owner of both sides) counts once.
      expect(pollEligibleUnits(my([unit12]), [owner, owner]).length, 1);
      expect(pollEligibleUnits(my([]), [owner]), isEmpty);
    });

    test('poll phase and who can answer', () {
      Poll poll(
        String status, {
        String opens = '2026-11-01T00:00:00Z',
        String closes = '2026-12-19T00:00:00Z',
      }) =>
          Poll.fromJson(pollJson(status: status, opens: opens, closes: closes));
      expect(pollPhase(poll('open'), now), PollPhase.open);
      expect(pollPhase(poll('draft'), now), PollPhase.notOpen);
      expect(pollPhase(poll('closed'), now), PollPhase.closed);
      expect(
        pollPhase(poll('open', opens: '2026-11-20T00:00:00Z'), now),
        PollPhase.notOpen,
      );
      expect(
        pollPhase(poll('open', closes: '2026-11-08T00:00:00Z'), now),
        PollPhase.closed,
      );
      final eligible = [occ('owner', unit12)];
      expect(
        canAnswerPoll(
          phase: PollPhase.open,
          unitId: unit12,
          eligible: eligible,
        ),
        isTrue,
      );
      expect(
        canAnswerPoll(
          phase: PollPhase.closed,
          unitId: unit12,
          eligible: eligible,
        ),
        isFalse,
      );
      expect(
        canAnswerPoll(
          phase: PollPhase.open,
          unitId: unit14,
          eligible: eligible,
        ),
        isFalse,
      );
    });

    test('decisions: tenants see only those that concern residents', () {
      final all = [
        Decision.fromJson(decisionJson(id: 'a', seq: 1, residents: false)),
        Decision.fromJson(decisionJson(id: 'b', seq: 2)),
        Decision.fromJson({...decisionJson(id: 'c'), 'year': 2025}),
      ];
      expect(
        [for (final d in decisionsVisibleTo(all, isOwner: true)) d.id],
        ['b', 'a', 'c'],
      );
      expect(
        [for (final d in decisionsVisibleTo(all, isOwner: false)) d.id],
        ['b', 'c'],
      );
    });

    test('meetings: upcoming and past', () {
      Meeting m(String id, String status, String at) => Meeting.fromJson({
        ...meetingJson(id: id, status: status),
        'scheduled_at': at,
        'second_call_at': at,
      });
      final all = [
        m('next', 'called', '2026-12-20T15:00:00Z'),
        m('sitting', 'in_session', '2026-11-09T09:00:00Z'),
        m('done', 'closed', '2026-05-01T15:00:00Z'),
        m('draft', 'draft', '2026-12-30T15:00:00Z'),
        m('off', 'cancelled', '2026-12-25T15:00:00Z'),
        m('missed', 'called', '2026-06-01T15:00:00Z'),
      ];
      expect(
        [for (final x in upcomingMeetings(all, now)) x.id],
        ['sitting', 'next'],
      );
      expect(
        [for (final x in pastMeetings(all, now)) x.id],
        ['missed', 'done'],
      );
    });

    test('the check-in QR is what the server issued', () {
      expect(checkInQrPayload(my([unit12])), 'obk-att.tok-123');
      expect(
        checkInQrPayload(MyMeeting.fromJson(myMeetingJson(qr: false))),
        isNull,
      );
      expect(isOwnerIn([occ('owner', unit12)]), isTrue);
      expect(isOwnerIn([occ('tenant', unit12)]), isFalse);
    });
  });

  group('web login link', () {
    WebLoginLink link(String url, {String token = 'tok123'}) =>
        WebLoginLink.fromJson({
          'token': token,
          'url': url,
          'expires_at': '2026-11-09T12:02:00Z',
        });

    test('next is always an /orgs/{org}/ path', () {
      expect(webNextPath(orgId, '/bookings'), '/orgs/$orgId/bookings');
      expect(webNextPath(orgId, 'visitors/gate'), '/orgs/$orgId/visitors/gate');
      expect(webNextPath(orgId, ''), '/orgs/$orgId');
    });

    test('only plain /orgs/{org}/... paths are sent as next', () {
      expect(isSafeWebNext('/orgs/$orgId/meetings/m_1'), isTrue);
      for (final bad in [
        '/login',
        '//evil.example/orgs/1',
        '/orgs/1/../admin',
        '/orgs/1/x?next=https://evil.example',
        '/orgs/1/x#f',
        'https://evil.example/orgs/1',
        '/orgs/',
        '/orgs/1/a b',
      ]) {
        expect(isSafeWebNext(bad), isFalse, reason: bad);
      }
    });

    test('a next inside the server URL is replaced by ours', () {
      final u = webLoginUri(
        serverOrigin: 'https://gul.example.org',
        link: link('https://app.example.org/login/link/tok123?next=%2Fevil'),
        next: '/orgs/1/bookings',
      );
      expect(u.queryParameters, {'next': '/orgs/1/bookings'});
    });

    test(
      'the server URL is used when it is absolute and carries the token',
      () {
        final u = webLoginUri(
          serverOrigin: 'https://gul.example.org',
          link: link(
            'https://app.example.org/login/link/tok123?next=%2Forgs%2F1%2Fbookings',
          ),
          next: '/orgs/1/bookings',
        );
        expect(u.host, 'app.example.org');
        expect(u.pathSegments, ['login', 'link', 'tok123']);
        expect(u.queryParameters['next'], '/orgs/1/bookings');
      },
    );

    test(
      'a relative or foreign URL is rebuilt on the server of the account',
      () {
        for (final url in [
          '/login/link/tok123',
          'javascript:alert(1)',
          'https://evil.example/x',
        ]) {
          final u = webLoginUri(
            serverOrigin: 'https://gul.example.org',
            link: link(url),
            next: '/orgs/1/bookings',
          );
          expect(
            u.toString(),
            'https://gul.example.org/login/link/tok123?next=%2Forgs%2F1%2Fbookings',
          );
        }
      },
    );
  });

  group('idempotency keys', () {
    test(
      'a retry of the same request reuses its key, a changed one does not',
      () {
        final keys = IdempotencyKeys();
        final a = keys.keyFor('booking:1');
        expect(keys.keyFor('booking:1'), a);
        expect(keys.keyFor('booking:2'), isNot(a));
        keys.done('booking:1');
        expect(keys.keyFor('booking:1'), isNot(a));
        expect(keys.pending, 2);
      },
    );
  });

  test('resident units: current residents only, one entry per unit', () {
    final units = residentUnits([
      MeOccupancy.fromJson(occupancyJson()),
      MeOccupancy.fromJson(occupancyJson(kind: 'tenant', side: 'tenant')),
      MeOccupancy.fromJson(
        occupancyJson(unit: unit14, kind: 'former_occupant', side: null),
      ),
      MeOccupancy.fromJson(
        occupancyJson(unit: unit14, kind: 'household', side: null),
      ),
    ]);
    expect(units.map((u) => u.unitId), [unit12, unit14]);
    expect(units.first.role, OccupancyRole.owner);
    expect(units.last.role, OccupancyRole.household);
  });
}
