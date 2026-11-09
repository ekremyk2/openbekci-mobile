import 'package:openbekci_api/openbekci_api.dart' hide Notification;

/// JSON fixtures of the resident core, shaped like the served contract.

const orgId = '0192a3f0-1000-7000-8000-000000000001';
const siteId = '0192a3f0-1000-7000-8000-000000000002';
const unit12 = '0192a3f0-1000-7000-8000-0000000000c1';
const unit14 = '0192a3f0-1000-7000-8000-0000000000c2';
const personId = '0192a3f0-1000-7000-8000-0000000000e1';

Map<String, Object?> money(int amount) => {'amount': amount, 'currency': 'TRY'};

Map<String, Object?> bankJson() => {
  'version': 1,
  'iban': 'TR330006100519786457841326',
  'holder': 'Gul Sitesi Yonetimi',
  'bank_name': 'Ornek Bank',
  'reference_hint': 'Write the door number',
  'suggested_reference': 'GUL-12-OWNER',
};

Map<String, Object?> sideJson({
  String unit = unit12,
  String door = '12',
  String kind = 'owner',
  int total = 150000,
  int fee = 5000,
  bool bank = true,
}) => {
  'unit_id': unit,
  'unit_door_number': door,
  'debtor_kind': kind,
  'principal': money(total - fee),
  'accrued_late_fee': money(fee),
  'total': money(total),
  'credit': money(0),
  'next_due_date': '2026-12-01',
  'bank_details': bank ? bankJson() : null,
};

Map<String, Object?> dashboardJson({
  List<Map<String, Object?>>? sides,
  int unreadAnnouncements = 2,
  int openTickets = 1,
  bool meeting = true,
}) => {
  'home': 'resident',
  'sides': sides ?? [sideJson()],
  'unread_notifications': 3,
  'unread_announcements': unreadAnnouncements,
  'my_open_tickets': openTickets,
  'upcoming_meetings': [
    if (meeting)
      {
        'id': '0192a3f0-1000-7000-8000-0000000000f1',
        'title': 'Annual assembly',
        'scheduled_at': '2026-12-20T15:00:00Z',
        'status': 'called',
      },
  ],
  'pending_visitor_approvals': 0,
  'waiting_deliveries': 1,
};

Map<String, Object?> occupancyJson({
  String id = '0192a3f0-1000-7000-8000-0000000000a1',
  String unit = unit12,
  String label = 'A Blok D:12',
  String kind = 'owner',
  String? side = 'owner',
  bool maySeeMoney = true,
  String from = '2025-01-01',
  String? to,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'unit_id': unit,
  'unit_label': label,
  'kind': kind,
  'side': side,
  'may_see_money': maySeeMoney,
  'valid_from': from,
  'valid_to': to,
};

/// `GET /v1/me` of a resident in one organization with one site.
Map<String, Object?> residentMeJson({
  List<Map<String, Object?>>? occupancies,
  List<Map<String, Object?>>? organizations,
  String name = 'Ayse Yilmaz',
}) => {
  'user': {
    'id': '0192a3f0-1000-7000-8000-0000000000aa',
    'display_name': name,
    'email': 'ayse@example.org',
    'phone': '+905321234567',
    'locale': 'tr',
    'is_platform_admin': false,
  },
  'organizations':
      organizations ??
      [
        {
          'id': orgId,
          'slug': 'gul',
          'name': 'Gul Yonetim',
          'default_locale': 'tr',
          'roles': <Object?>[],
          'permissions': <Object?>[],
          'sites': [
            {
              'id': siteId,
              'name': 'Gul Sitesi',
              'timezone': 'Europe/Istanbul',
              'currency': 'TRY',
            },
          ],
          'person_id': personId,
        },
      ],
  'occupancies': occupancies ?? [occupancyJson()],
  'policies': {'app_lock_required': false, 'reauth_window_minutes': 10},
};

Map<String, Object?> statementLineJson({
  String date = '2026-11-01',
  String kind = 'charge',
  String description = 'November dues',
  int debit = 100000,
  int credit = 0,
  int balance = 100000,
}) => {
  'date': date,
  'kind': kind,
  'description': description,
  'ref_type': null,
  'ref_id': null,
  'debtor_kind': 'owner',
  'debtor_display_name': 'Ayse Yilmaz',
  'principal': money(debit),
  'late_fee': money(0),
  'debit': money(debit),
  'credit': money(credit),
  'balance': money(balance),
};

Map<String, Object?> statementJson({
  String kind = 'owner',
  String unit = unit12,
  int fee = 5000,
}) => {
  'debtor': {'mode': 'unit_side', 'unit_id': unit, 'debtor_kind': kind},
  'from': '2026-01-01',
  'to': '2026-11-09',
  'opening_balance': money(0),
  'lines': [
    statementLineJson(),
    statementLineJson(
      date: '2026-11-05',
      kind: 'payment',
      description: 'Cash payment',
      debit: 0,
      credit: 20000,
      balance: 80000,
    ),
  ],
  'closing_balance': money(80000),
  'accrued_late_fee': money(fee),
  'total_due': money(80000 + fee),
  'credit': money(0),
};

Map<String, Object?> paymentJson({
  String id = '0192a3f0-1000-7000-8000-0000000000b1',
  String status = 'pending_declared',
  int amount = 50000,
  String method = 'bank_transfer',
  String? receipt,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'payer_person_id': personId,
  'payer_display_name': 'Ayse Yilmaz',
  'unit_id': unit12,
  'debtor_kind': 'owner',
  'method': method,
  'gross': money(amount),
  'fee': money(0),
  'net': money(amount),
  'received_on': '2026-11-08',
  'recorded_by': null,
  'asset_account_id': '0192a3f0-1000-7000-8000-0000000000b9',
  'reference': 'GUL-12-OWNER',
  'note': null,
  'status': status,
  'receipt_no': receipt,
  'provider_txn_id': null,
  'journal_entry_id': null,
  'allocated': money(0),
  'unallocated': money(amount),
  'allocations': <Object?>[],
  'bank_transaction_id': null,
  'created_at': '2026-11-08T10:00:00Z',
  'updated_at': '2026-11-08T10:00:00Z',
};

Map<String, Object?> pageOf(List<Object?> items) => {
  'items': items,
  'next_cursor': null,
};

Map<String, Object?> ticketJson({
  String id = '0192a3f0-1000-7000-8000-0000000000d1',
  String title = 'Elevator stuck',
  String status = 'Open',
  String semantic = 'open_like',
  String visibility = 'common',
  int votes = 4,
  bool voted = false,
  String reporter = personId,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'unit_id': null,
  'unit_door_number': null,
  'reporter_person_id': reporter,
  'reporter_display_name': 'Ayse Yilmaz',
  'category_id': '0192a3f0-1000-7000-8000-0000000000d9',
  'title': title,
  'description': 'The lift is stuck on floor 3.',
  'status_id': '0192a3f0-1000-7000-8000-0000000000d8',
  'status_name': status,
  'status_semantic': semantic,
  'visibility': visibility,
  'assignee': null,
  'vote_count': votes,
  'voted_by_me': voted,
  'merged_into_id': null,
  'comment_count': 1,
  'attachments': <Object?>[],
  'closed_at': null,
  'created_at': '2026-11-07T09:00:00Z',
  'updated_at': '2026-11-07T09:00:00Z',
  'version': 1,
};

Map<String, Object?> categoryJson() => {
  'id': '0192a3f0-1000-7000-8000-0000000000d9',
  'org_id': orgId,
  'site_id': siteId,
  'name': 'Elevator',
  'default_visibility': 'common',
  'default_assignee_role': null,
  'position': 1,
  'archived': false,
  'created_at': '2026-01-01T00:00:00Z',
  'updated_at': '2026-01-01T00:00:00Z',
  'version': 1,
};

Map<String, Object?> announcementJson({
  String id = '0192a3f0-1000-7000-8000-0000000000a9',
  String title = 'Water cut on Saturday',
  bool read = false,
  bool pinned = false,
}) => {
  'id': id,
  'org_id': orgId,
  'site_id': siteId,
  'title': title,
  'body_md': 'Water will be **off** from 9 to 12.',
  'status': 'published',
  'audience': {'kind': 'site'},
  'publish_at': null,
  'expires_at': null,
  'pinned': pinned,
  'channels': ['in_app'],
  'recipient_count': null,
  'sms_count': null,
  'read_count': 0,
  'read_at': read ? '2026-11-08T10:00:00Z' : null,
  'attachments': [
    {
      'id': '0192a3f0-1000-7000-8000-0000000000aa',
      'name': 'schedule.pdf',
      'mime': 'application/pdf',
      'size': 48211,
    },
  ],
  'published_at': '2026-11-08T08:00:00Z',
  'created_by': null,
  'created_at': '2026-11-08T08:00:00Z',
  'updated_at': '2026-11-08T08:00:00Z',
  'version': 1,
};

/// Decoded models for tests that do not go through HTTP.
Me residentMe({List<Map<String, Object?>>? occupancies}) =>
    Me.fromJson(residentMeJson(occupancies: occupancies));

MeDashboard dashboard({List<Map<String, Object?>>? sides}) =>
    MeDashboard.fromJson(dashboardJson(sides: sides));
