import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' hide File, Notification;
import 'package:openbekci_mobile/features/push/domain/push_domain.dart';
import 'package:yaml/yaml.dart';

import '../support/community_fixtures.dart';
import '../support/fixtures.dart';

/// The generated client against the served contract for phase C: community,
/// governance and the push device. Unknown values of open enums must decode
/// to the unknown case, never throw (ADR 0001).
void main() {
  group('decoding', () {
    test('facility with its rules', () {
      final f = Facility.fromJson(facilityJson());
      expect(f.rules.maxDurationMinutes, 240);
      expect(f.rules.fee!.amount, 15000);
      expect(f.rules.quotaPeriod, FacilityRulesQuotaPeriodEnum.month);
      expect(f.rules.openingHours.single.days, [1, 2, 3, 4, 5, 6, 7]);
      expect(f.rules.whoMayBook, [
        FacilityRulesWhoMayBookEnum.owner,
        FacilityRulesWhoMayBookEnum.tenant,
        FacilityRulesWhoMayBookEnum.household,
      ]);
    });

    test('nullable rules decode as null', () {
      final f = Facility.fromJson(
        facilityJson(rules: rulesJson(feeAmount: null, quota: null)),
      );
      expect(f.rules.fee, isNull);
      expect(f.rules.quotaPerUnit, isNull);
      expect(f.rules.quotaPeriod, isNull);
    });

    test('visitor entry, recurring visitor, request and parcel', () {
      final e = VisitorEntry.fromJson(visitorEntryJson());
      expect(e.qrToken, 'obk1.abcDEF123');
      expect(e.approvalStatus, VisitorEntryApprovalStatusEnum.preApproved);
      expect(e.source_, VisitorEntrySource_Enum.preRegistered);
      final managerView = VisitorEntry.fromJson(visitorEntryJson(qr: null));
      expect(managerView.qrToken, isNull);
      final r = RecurringVisitor.fromJson(recurringJson());
      expect(r.days, [1, 3, 5]);
      expect(r.status, RecurringVisitorStatusEnum.active);
      final req = VisitorApprovalRequest.fromJson(approvalRequestJson());
      expect(req.status, VisitorApprovalRequestStatusEnum.pending);
      expect(req.expiresAt, DateTime.utc(2026, 11, 9, 12, 2));
      final d = Delivery.fromJson(deliveryJson(status: 'collected'));
      expect(d.status, DeliveryStatusEnum.collected);
      expect(d.collectedByName, 'Ayse Yilmaz');
    });

    test('meeting as the caller sees it', () {
      final m = MyMeeting.fromJson(myMeetingJson(answered: [unit12]));
      expect(m.meeting.status, MeetingStatusEnum.called);
      expect(m.eligibleUnitIds, [unit12]);
      expect(m.attendanceQr, 'obk-att.tok-123');
      expect(m.polls.single.answeredUnits, [unit12]);
      final tenant = MyMeeting.fromJson(myMeetingJson(eligible: [], qr: false));
      expect(tenant.attendanceToken, isNull);
      expect(tenant.attendanceQr, isNull);
      final poll = Poll.fromJson(pollJson());
      expect(poll.status, PollStatusEnum.open);
      final decision = Decision.fromJson(decisionJson());
      expect(decision.outcome, DecisionOutcomeEnum.accepted);
      expect(decision.concernsResidents, isTrue);
    });

    test('device, web-login link and the unread count', () {
      final device = Device.fromJson({
        'id': '0192a3f0-1000-7000-8000-0000000000e2',
        'push_kind': 'unifiedpush',
        'relay_id': null,
        'app_version': '1.0.0',
        'locale': 'tr',
        'enabled': true,
        'created_at': '2026-11-09T12:00:00Z',
        'updated_at': '2026-11-09T12:00:00Z',
      });
      expect(device.pushKind, 'unifiedpush');
      expect(device.relayId, isNull);
      final link = WebLoginLink.fromJson({
        'token': 't',
        'url': 'https://x.example/login/link/t',
        'expires_at': '2026-11-09T12:02:00Z',
      });
      expect(link.token, 't');
      final unread = UnreadCount.fromJson({
        'unread': 4,
        'visitor_approvals_pending': 1,
      });
      expect(unread.visitorApprovalsPending, 1);
    });
  });

  group('unknown values of open enums decode to the unknown case', () {
    test('booking, visitor, request, parcel', () {
      expect(
        Booking.fromJson({...bookingJson(), 'status': 'refunded'}).status,
        BookingStatusEnum.unknownDefaultOpenApi,
      );
      expect(
        VisitorEntry.fromJson({
          ...visitorEntryJson(),
          'approval_status': 'maybe',
        }).approvalStatus,
        VisitorEntryApprovalStatusEnum.unknownDefaultOpenApi,
      );
      expect(
        VisitorEntry.fromJson({...visitorEntryJson(), 'source': 'drone'})
            .source_,
        VisitorEntrySource_Enum.unknownDefaultOpenApi,
      );
      expect(
        RecurringVisitor.fromJson({...recurringJson(), 'status': 'paused'})
            .status,
        RecurringVisitorStatusEnum.unknownDefaultOpenApi,
      );
      expect(
        VisitorApprovalRequest.fromJson({
          ...approvalRequestJson(),
          'status': 'later',
        }).status,
        VisitorApprovalRequestStatusEnum.unknownDefaultOpenApi,
      );
      expect(
        Delivery.fromJson({...deliveryJson(), 'status': 'lost'}).status,
        DeliveryStatusEnum.unknownDefaultOpenApi,
      );
    });

    test('facility rules', () {
      final r = FacilityRules.fromJson({
        ...rulesJson(),
        'quota_period': 'fortnight',
        'who_may_book': ['owner', 'guest'],
      });
      expect(r.quotaPeriod, FacilityRulesQuotaPeriodEnum.unknownDefaultOpenApi);
      expect(r.whoMayBook, [
        FacilityRulesWhoMayBookEnum.owner,
        FacilityRulesWhoMayBookEnum.unknownDefaultOpenApi,
      ]);
    });

    test('meeting, poll, answer and decision', () {
      expect(
        Meeting.fromJson({...meetingJson(), 'status': 'postponed'}).status,
        MeetingStatusEnum.unknownDefaultOpenApi,
      );
      expect(
        Meeting.fromJson({...meetingJson(), 'kind': 'council'}).kind,
        MeetingKindEnum.unknownDefaultOpenApi,
      );
      expect(
        Poll.fromJson({...pollJson(), 'status': 'paused'}).status,
        PollStatusEnum.unknownDefaultOpenApi,
      );
      expect(
        PollAnswer.fromJson({
          'agenda_item_id': agendaId,
          'unit_id': unit12,
          'unit_door_number': '12',
          'answer': 'maybe',
          'answered_by': personId,
          'answered_at': '2026-11-09T12:00:00Z',
        }).answer,
        PollAnswerAnswerEnum.unknownDefaultOpenApi,
      );
      expect(
        Decision.fromJson({...decisionJson(), 'outcome': 'tabled'}).outcome,
        DecisionOutcomeEnum.unknownDefaultOpenApi,
      );
    });

    test('a whole meeting document with unknown values still decodes', () {
      final doc = myMeetingJson();
      (doc['meeting']! as Map<String, Object?>)['status'] = 'adjourned';
      final m = MyMeeting.fromJson(doc);
      expect(m.meeting.status, MeetingStatusEnum.unknownDefaultOpenApi);
      expect(m.polls, hasLength(1));
    });
  });

  group('requests the app sends', () {
    test('the recurring visitor dates are plain YYYY-MM-DD strings', () {
      final body = RecurringVisitorCreate(
        siteId: siteId,
        unitId: unit12,
        name: 'Fatma',
        days: const [1, 3],
        start: '09:00',
        end: '13:00',
        validFrom: '2026-11-09',
        validTo: '2027-02-07',
      ).toJson();
      expect(body['valid_from'], '2026-11-09');
      expect(body['valid_to'], '2027-02-07');
    });

    test('visitor entry window is an RFC 3339 instant', () {
      final body = VisitorEntryCreate(
        siteId: siteId,
        unitId: unit12,
        name: 'Mehmet',
        windowFrom: DateTime.utc(2026, 11, 21, 9),
        windowTo: DateTime.utc(2026, 11, 21, 12),
      ).toJson();
      expect(body['window_from'], '2026-11-21T09:00:00.000Z');
      expect(body.containsKey('plate'), isFalse);
    });

    test('booking, poll answer and decision', () {
      final booking = BookingCreate(
        facilityId: facilityId,
        unitId: unit12,
        start: DateTime.utc(2026, 11, 21, 12),
        end: DateTime.utc(2026, 11, 21, 14),
      ).toJson();
      expect(booking['start'], '2026-11-21T12:00:00.000Z');
      expect(booking.containsKey('debtor_kind'), isFalse);
      expect(
        PollAnswerSet(
          unitId: unit12,
          answer: PollAnswerSetAnswerEnum.abstain,
        ).toJson(),
        {'unit_id': unit12, 'answer': 'abstain'},
      );
      expect(
        VisitorDecision(decision: VisitorDecisionDecisionEnum.deny).toJson(),
        {'decision': 'deny'},
      );
    });

    test('device registration: kind, token, relay, version, locale', () {
      final fcm = DeviceRegister(
        pushKind: 'fcm',
        token: 'abc',
        relayId: 'official',
        appVersion: '1.0.0',
        locale: 'en',
      ).toJson();
      expect(fcm, {
        'push_kind': 'fcm',
        'token': 'abc',
        'relay_id': 'official',
        'app_version': '1.0.0',
        'locale': 'en',
      });
      final up = DeviceRegister(
        pushKind: 'unifiedpush',
        token: 'http://x',
      ).toJson();
      expect(up.keys.toSet(), {'push_kind', 'token'});
    });
  });

  test(
    'every notification type the contract names has a title and a channel',
    () {
      final spec =
          loadYaml(File('spec/openapi.yaml').readAsStringSync()) as YamlMap;
      final schema = (spec['components'] as YamlMap)['schemas'] as YamlMap;
      final known = [
        for (final v
            in (schema['NotificationType'] as YamlMap)['x-known-values']
                as YamlList)
          v as String,
      ];
      expect(known, isNotEmpty);
      for (final type in known) {
        expect(
          notificationVocabulary,
          contains(type),
          reason: 'no title for $type',
        );
        expect(areaOfType(type), isA<NotificationArea>());
      }
      // The device kinds of the contract are the ones the app can register.
      final device = schema['DeviceRegister'] as YamlMap;
      final kinds =
          ((device['properties'] as YamlMap)['push_kind']
                  as YamlMap)['x-known-values']
              as YamlList;
      expect(kinds, containsAll(['fcm', 'unifiedpush']));
    },
  );

  test(
    'the notification payload of the spec is exactly the six keys of the app',
    () {
      // The spec describes the push payload in `Device` docs; the app keeps one
      // definition (PushPayload) and the test pins its keys.
      expect(
        PushPayload.tryParse({
          'instance_id': instanceId,
          'org_id': orgId,
          'notification_id': notificationId,
          'type': 'delivery.received',
          'collapse_key': 'k',
          'badge': 1,
        })!.toData().keys.toList()..sort(),
        [
          'badge',
          'collapse_key',
          'instance_id',
          'notification_id',
          'org_id',
          'type',
        ],
      );
    },
  );
}
