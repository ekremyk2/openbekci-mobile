import 'fixtures.dart';

/// JSON fixtures of phase C: community and governance, shaped like the served
/// contract.

const facilityId = '0192a3f0-1000-7000-8000-0000000000f2';
const bookingId = '0192a3f0-1000-7000-8000-0000000000f3';
const entryId = '0192a3f0-1000-7000-8000-0000000000f4';
const recurringId = '0192a3f0-1000-7000-8000-0000000000f5';
const requestId = '0192a3f0-1000-7000-8000-0000000000f6';
const deliveryId = '0192a3f0-1000-7000-8000-0000000000f7';
const meetingId = '0192a3f0-1000-7000-8000-0000000000f1';
const agendaId = '0192a3f0-1000-7000-8000-0000000000f8';
const decisionId = '0192a3f0-1000-7000-8000-0000000000f9';
const notificationId = '0192a3f0-1000-7000-8000-0000000000fb';
const instanceId = '0192a3f0-1000-7000-8000-000000000999';

Map<String, Object?> rulesJson({
  int? feeAmount = 15000,
  int cutoffHours = 24,
  int? quota = 2,
  String quotaPeriod = 'month',
  List<String> who = const ['owner', 'tenant', 'household'],
  int maxDays = 30,
  int minNotice = 60,
  int maxDuration = 240,
}) => {
  'opening_hours': [
    {
      'days': [1, 2, 3, 4, 5, 6, 7],
      'start': '09:00',
      'end': '22:00',
    },
  ],
  'max_duration_minutes': maxDuration,
  'max_days_ahead': maxDays,
  'min_notice_minutes': minNotice,
  'quota_per_unit': quota,
  'quota_period': quota == null ? null : quotaPeriod,
  'who_may_book': who,
  'fee': feeAmount == null ? null : money(feeAmount),
  'cancel_refund_cutoff_hours': cutoffHours,
};

Map<String, Object?> facilityJson({
  String id = facilityId,
  String name = 'Barbecue area',
  Map<String, Object?>? rules,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'name': name,
  'description': 'By the pool.',
  'rules': rules ?? rulesJson(),
  'enabled': true,
  'created_at': '2026-01-01T00:00:00Z',
  'updated_at': '2026-01-01T00:00:00Z',
  'version': 1,
};

Map<String, Object?> bookingJson({
  String id = bookingId,
  String status = 'confirmed',
  String start = '2026-11-21T15:00:00Z',
  String end = '2026-11-21T17:00:00Z',
  int? fee = 15000,
  int? refund,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'facility_id': facilityId,
  'facility_name': 'Barbecue area',
  'unit_id': unit12,
  'unit_door_number': '12',
  'person_id': personId,
  'person_display_name': 'Ayse Yilmaz',
  'start': start,
  'end': end,
  'status': status,
  'charge_id': null,
  'fee': fee == null ? null : money(fee),
  'refund': refund == null ? null : money(refund),
  'cancelled_reason': null,
  'created_at': '2026-11-09T10:00:00Z',
  'updated_at': '2026-11-09T10:00:00Z',
};

Map<String, Object?> visitorEntryJson({
  String id = entryId,
  String name = 'Mehmet Kaya',
  String? plate = '34ABC123',
  String from = '2026-11-21T09:00:00Z',
  String to = '2026-11-21T12:00:00Z',
  String status = 'pre_approved',
  String source = 'pre_registered',
  String? qr = 'obk1.abcDEF123',
  bool cancelled = false,
  String? arrivedAt,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'unit_id': unit12,
  'unit_door_number': '12',
  'name': name,
  'plate': plate,
  'window_from': from,
  'window_to': to,
  'approval_status': status,
  'source': source,
  'qr_token': qr,
  'decided_by': null,
  'decided_at': null,
  'arrived_at': arrivedAt,
  'left_at': null,
  'cancelled': cancelled,
  'recurring_visitor_id': null,
  'created_at': '2026-11-09T10:00:00Z',
  'updated_at': '2026-11-09T10:00:00Z',
  'version': 1,
};

Map<String, Object?> recurringJson({
  String id = recurringId,
  String status = 'active',
  String? qr = 'obk1.recurringQR9',
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'unit_id': unit12,
  'name': 'Fatma Hanim',
  'plate': null,
  'days': [1, 3, 5],
  'start': '09:00',
  'end': '13:00',
  'valid_from': '2026-11-01',
  'valid_to': null,
  'status': status,
  'qr_token': qr,
  'created_at': '2026-11-01T10:00:00Z',
  'updated_at': '2026-11-01T10:00:00Z',
  'version': 1,
};

Map<String, Object?> approvalRequestJson({
  String id = requestId,
  String status = 'pending',
  String expiresAt = '2026-11-09T12:02:00Z',
  String requestedAt = '2026-11-09T12:00:00Z',
}) => {
  'id': id,
  'org_id': orgId,
  'entry_id': entryId,
  'unit_id': unit12,
  'unit_door_number': '12',
  'visitor_name': 'Ali Veli',
  'plate': '06XYZ789',
  'requested_at': requestedAt,
  'expires_at': expiresAt,
  'status': status,
  'decided_by': null,
  'decided_at': null,
  'created_at': requestedAt,
  'updated_at': requestedAt,
};

Map<String, Object?> deliveryJson({
  String id = deliveryId,
  String status = 'waiting',
  String? description = 'Large box',
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'unit_id': unit12,
  'unit_door_number': '12',
  'received_at': '2026-11-08T14:00:00Z',
  'received_by_display_name': 'Guard',
  'description': description,
  'status': status,
  'collected_at': status == 'collected' ? '2026-11-09T08:00:00Z' : null,
  'collected_by_name': status == 'collected' ? 'Ayse Yilmaz' : null,
  'created_at': '2026-11-08T14:00:00Z',
  'updated_at': '2026-11-08T14:00:00Z',
};

Map<String, Object?> meetingJson({
  String id = meetingId,
  String status = 'called',
  String? minutes,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'kind': 'general_assembly',
  'scope': 'site',
  'title': 'Annual assembly',
  'scheduled_at': '2026-12-20T15:00:00Z',
  'second_call_at': '2026-12-20T16:00:00Z',
  'location': 'Community hall',
  'status': status,
  'eligibility_snapshot': null,
  'call_letter_document_id': '0192a3f0-1000-7000-8000-0000000000fa',
  'minutes_document_id': minutes,
  'called_at': '2026-11-20T10:00:00Z',
  'held_call': null,
  'first_call_failed_at': null,
  'created_at': '2026-11-01T10:00:00Z',
  'updated_at': '2026-11-20T10:00:00Z',
  'version': 3,
};

Map<String, Object?> agendaItemJson({
  String id = agendaId,
  int position = 1,
  String title = 'Approve the budget',
  bool voted = true,
}) => {
  'id': id,
  'org_id': orgId,
  'meeting_id': meetingId,
  'position': position,
  'title': title,
  'description': 'The budget for next year.',
  'will_be_voted': voted,
  'topic': null,
  'decision_id': null,
  'created_at': '2026-11-01T10:00:00Z',
  'updated_at': '2026-11-01T10:00:00Z',
  'version': 1,
};

Map<String, Object?> myMeetingJson({
  List<String> eligible = const [unit12],
  bool qr = true,
  bool checkedIn = false,
  List<String> answered = const [],
  String status = 'called',
}) => {
  'meeting': meetingJson(status: status),
  'eligible_unit_ids': eligible,
  'notice': null,
  'attendance_token': qr ? 'tok-123' : null,
  'attendance_qr': qr ? 'obk-att.tok-123' : null,
  'checked_in': checkedIn,
  'polls': [
    {
      'agenda_item_id': agendaId,
      'title': 'Approve the budget',
      'answered_units': answered,
      'answers': <Object?>[],
    },
  ],
};

Map<String, Object?> pollJson({
  String status = 'open',
  String opens = '2026-11-01T00:00:00Z',
  String closes = '2026-12-19T00:00:00Z',
}) => {
  'agenda_item_id': agendaId,
  'question': 'Do you approve the budget?',
  'opens_at': opens,
  'closes_at': closes,
  'status': status,
  'version': 1,
};

Map<String, Object?> decisionJson({
  String id = decisionId,
  int seq = 3,
  String outcome = 'accepted',
  bool residents = true,
  String text = 'The dues are raised by 10 percent.',
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'meeting_id': meetingId,
  'agenda_item_id': agendaId,
  'sequence_no': seq,
  'year': 2026,
  'text': text,
  'outcome': outcome,
  'vote_count': null,
  'dissents': <Object?>[],
  'outcome_override_reason': null,
  'concerns_residents': residents,
  'notified_at': null,
  'effect': null,
  'created_at': '2026-11-20T10:00:00Z',
  'updated_at': '2026-11-20T10:00:00Z',
  'version': 1,
};

/// `GET /v1/orgs/{org}/me/notifications/{id}`.
Map<String, Object?> notificationJson({
  String id = notificationId,
  String type = 'visitor.approval_requested',
  Map<String, Object?>? payload,
  String? readAt,
}) => {
  'id': id,
  'site_id': siteId,
  'type': type,
  'payload':
      payload ??
      {
        'request_id': requestId,
        'visitor_name': 'Ali Veli',
        'unit_door_number': '12',
      },
  'read_at': readAt,
  'link': null,
  'created_at': '2026-11-09T12:00:00Z',
};
