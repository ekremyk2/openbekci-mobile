import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:openbekci_api/openbekci_api.dart' hide File, Notification;
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/features/announcements/application/announcements_providers.dart';
import 'package:openbekci_mobile/features/documents/application/documents_providers.dart';
import 'package:openbekci_mobile/features/money/application/money_providers.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/features/notifications/application/notifications_providers.dart';
import 'package:openbekci_mobile/features/shell/presentation/app_shell.dart';
import 'package:openbekci_mobile/features/tickets/domain/tickets_logic.dart';

import '../support/fixtures.dart';

List<MeOccupancy> occs(List<Map<String, Object?>> l) => [
  for (final o in l) MeOccupancy.fromJson(o),
];

void main() {
  group('statement targets (side visibility, M1 S3 S7)', () {
    test('an owner sees the owner and the tenant side of the unit', () {
      final targets = statementTargets(
        sides: [
          MySide.fromJson(sideJson()),
          MySide.fromJson(sideJson(kind: 'tenant', total: 90000)),
        ],
        occupancies: occs([occupancyJson()]),
      );
      expect(targets.map((t) => t.id), ['$unit12:owner', '$unit12:tenant']);
      expect(showMoneyTab(targets), isTrue);
    });

    test('a tenant sees only the tenant side', () {
      final targets = statementTargets(
        sides: [MySide.fromJson(sideJson(kind: 'tenant'))],
        occupancies: occs([occupancyJson(kind: 'tenant', side: 'tenant')]),
      );
      expect(targets.map((t) => t.kind), ['tenant']);
    });

    test('a household member without money sees nothing: no Money tab', () {
      final targets = statementTargets(
        sides: const [],
        occupancies: occs([
          occupancyJson(kind: 'household', side: null, maySeeMoney: false),
        ]),
      );
      expect(targets, isEmpty);
      expect(showMoneyTab(targets), isFalse);
      expect(
        visibleBranches(showMoney: false),
        isNot(contains(Branches.money)),
      );
    });

    test(
      'a household member with may_see_money gets what the server lists',
      () {
        final targets = statementTargets(
          sides: [MySide.fromJson(sideJson())],
          occupancies: occs([occupancyJson(kind: 'household', side: null)]),
        );
        expect(targets, hasLength(1));
      },
    );

    test('a former resident sees their own side and period only', () {
      final targets = statementTargets(
        sides: const [],
        occupancies: occs([
          occupancyJson(
            kind: 'former_occupant',
            side: 'tenant',
            from: '2025-03-01',
            to: '2026-02-28',
          ),
        ]),
      );
      expect(targets.single.former, isTrue);
      expect(targets.single.from, '2025-03-01');
      expect(targets.single.to, '2026-02-28');
    });

    test('an unknown side value is ignored, never shown', () {
      final targets = statementTargets(
        sides: [MySide.fromJson(sideJson(kind: 'landlord'))],
        occupancies: const [],
      );
      expect(targets, isEmpty);
    });
  });

  group('money input and periods', () {
    test('parses Turkish and English amounts into minor units', () {
      expect(parseMoneyInput('1.234,50', 'TRY'), 123450);
      expect(parseMoneyInput('1,234.50', 'TRY'), 123450);
      expect(parseMoneyInput('1234', 'TRY'), 123400);
      expect(parseMoneyInput('1234,5', 'TRY'), 123450);
      expect(parseMoneyInput('1.234', 'TRY'), 123400);
      expect(parseMoneyInput('0,99', 'TRY'), 99);
      expect(parseMoneyInput('1234', 'JPY'), 1234);
    });

    test('rejects empty, zero, negative and text', () {
      for (final s in ['', ' ', '0', '0,00', '-5', 'abc', '1,2,3x']) {
        expect(parseMoneyInput(s, 'TRY'), isNull, reason: s);
      }
    });

    test('minorToInput round-trips', () {
      expect(minorToInput(123450, 'TRY'), '1234.50');
      expect(minorToInput(5, 'TRY'), '0.05');
      expect(parseMoneyInput(minorToInput(123450, 'TRY'), 'TRY'), 123450);
    });

    test('period ranges are plain dates in the site calendar', () {
      final today = DateTime(2026, 11, 9);
      expect(periodRange(StatementPeriod.thisYear, today), (
        from: '2026-01-01',
        to: '2026-11-09',
      ));
      expect(periodRange(StatementPeriod.lastYear, today), (
        from: '2025-01-01',
        to: '2025-12-31',
      ));
      expect(
        periodRange(StatementPeriod.last3Months, today).from,
        '2026-08-09',
      );
    });

    test('declared payments are the pending_declared ones', () {
      final list = [
        Payment.fromJson(paymentJson()),
        Payment.fromJson(paymentJson(id: 'x', status: 'confirmed')),
        Payment.fromJson(paymentJson(id: 'y', status: 'from_the_future')),
      ];
      expect(declaredPayments(list).map((p) => p.id), [
        '0192a3f0-1000-7000-8000-0000000000b1',
      ]);
    });

    test('card checkout is advertised through packs only', () {
      expect(PaymentCapabilities.fromPacks(const []).checkout, isFalse);
      expect(
        PaymentCapabilities.fromPacks(const ['payments.checkout']).checkout,
        isTrue,
      );
    });
  });

  group('statement from the ledger lists (servers that refuse residents)', () {
    Charge charge(
      String id,
      int amount,
      String due, {
      String status = 'open',
    }) => Charge.fromJson({
      'id': id,
      'org_id': orgId,
      'site_id': siteId,
      'plan_id': null,
      'unit_id': unit12,
      'unit_door_number': '12',
      'debtor_kind': 'owner',
      'debtor_person_id': personId,
      'debtor_display_name': 'Ayse',
      'charge_type': 'dues',
      'period': null,
      'amount': money(amount),
      'paid': money(0),
      'balance': money(amount),
      'due_date': due,
      'description': 'Dues $due',
      'allocation_basis': null,
      'journal_entry_id': '0192a3f0-1000-7000-8000-0000000000ff',
      'status': status,
      'cancelled_reason': null,
      'created_at': '2026-01-01T00:00:00Z',
      'updated_at': '2026-01-01T00:00:00Z',
      'effective_debtor': {
        'debtor_kind': 'owner',
        'display_name': 'Ayse',
        'person_id': personId,
        'source': 'charge',
      },
    });
    const target = StatementTarget(
      unitId: unit12,
      unitLabel: '12',
      kind: 'owner',
    );
    final payments = [
      Payment.fromJson(
        paymentJson(id: 'p1', status: 'confirmed', amount: 20000),
      ),
      Payment.fromJson(paymentJson(id: 'p2', amount: 30000)),
    ];

    test('running balance, declared and cancelled entries left out', () {
      final st = statementFromLedger(
        target: target,
        charges: [
          charge('c1', 100000, '2026-10-01'),
          charge('c2', 50000, '2026-09-01', status: 'cancelled'),
        ],
        payments: payments,
        currency: 'TRY',
        today: '2026-11-09',
        side: MySide.fromJson(sideJson(total: 85000)),
      );
      expect(st.lines.map((l) => l.kind), [
        StatementLineKindEnum.charge,
        StatementLineKindEnum.payment,
      ]);
      expect(st.lines.map((l) => l.balance.amount), [100000, 80000]);
      expect(st.closingBalance.amount, 80000);
      expect(st.accruedLateFee.amount, 5000);
      expect(st.totalDue.amount, 85000);
    });

    test(
      'the period only cuts lines; what came before is the opening balance',
      () {
        final st = statementFromLedger(
          target: target,
          charges: [
            charge('c0', 70000, '2026-01-01'),
            charge('c1', 100000, '2026-10-01'),
          ],
          payments: const [],
          currency: 'TRY',
          today: '2026-11-09',
          from: '2026-06-01',
          to: '2026-11-09',
        );
        expect(st.openingBalance.amount, 70000);
        expect(st.lines.single.balance.amount, 170000);
        expect(st.totalDue.amount, 170000);
      },
    );
  });

  group('tickets', () {
    final open = Ticket.fromJson(ticketJson(id: 'a'));
    final closed = Ticket.fromJson(
      ticketJson(id: 'b', status: 'Done', semantic: 'closed_like'),
    );
    final weird = Ticket.fromJson(
      ticketJson(id: 'c', status: 'Parked', semantic: 'paused_like'),
    );

    test('group by semantic; an unknown semantic counts as open', () {
      final g = groupTickets([open, closed, weird]);
      expect(g.open.map((t) => t.id), containsAll(['a', 'c']));
      expect(g.closed.map((t) => t.id), ['b']);
      // The status name is shown as served.
      expect(weird.statusName, 'Parked');
    });

    test('filters mine and common', () {
      final other = Ticket.fromJson(
        ticketJson(id: 'd', visibility: 'private', reporter: 'someone'),
      );
      final mine = filterTickets(
        [open, other],
        TicketScope.mine,
        myPersonId: personId,
      );
      expect(mine.map((t) => t.id), ['a']);
      final common = filterTickets(
        [open, other],
        TicketScope.common,
        myPersonId: personId,
      );
      expect(common.map((t) => t.id), ['a']);
    });

    test('the +1 only exists on open common tickets', () {
      expect(canVote(open), isTrue);
      expect(canVote(closed), isFalse);
      expect(
        canVote(Ticket.fromJson(ticketJson(visibility: 'private'))),
        isFalse,
      );
    });

    test('the thread merges history and public comments, never internal', () {
      TicketComment c(String id, String vis, String at) =>
          TicketComment.fromJson({
            'id': id,
            'org_id': orgId,
            'ticket_id': 't',
            'author_person_id': personId,
            'author_display_name': 'Ali',
            'body': id,
            'visibility': vis,
            'attachments': <Object?>[],
            'created_at': at,
            'updated_at': at,
          });
      final change = TicketStatusChange.fromJson({
        'id': 'h1',
        'org_id': orgId,
        'ticket_id': 't',
        'from_status_id': null,
        'from_status_name': null,
        'to_status_id': 's',
        'to_status_name': 'Open',
        'changed_by': null,
        'comment': null,
        'at': '2026-11-07T09:00:00Z',
        'created_at': '2026-11-07T09:00:00Z',
        'updated_at': '2026-11-07T09:00:00Z',
      });
      final t = buildTimeline(
        [change],
        [
          c('late', 'public', '2026-11-08T09:00:00Z'),
          c('note', 'internal', '2026-11-07T10:00:00Z'),
          c('mystery', 'whisper', '2026-11-07T11:00:00Z'),
        ],
      );
      expect(t.length, 3);
      expect(t.first.change, isNotNull);
      expect(t.skip(1).map((e) => e.comment!.id), ['mystery', 'late']);
    });

    test('photos are scaled down and re-encoded as JPEG (EXIF dropped)', () {
      final big = img.Image(width: 3000, height: 1500);
      final bytes = compressPhotoSync(img.encodePng(big), maxEdge: 1000);
      final out = img.decodeImage(bytes)!;
      expect(out.width, 1000);
      expect(out.height, 500);
      expect(bytes.sublist(0, 2), [0xff, 0xd8]);
      // Not an image: returned unchanged.
      final junk = img.encodePng(img.Image(width: 1, height: 1)).sublist(0, 4);
      expect(compressPhotoSync(junk), junk);
    });
  });

  group('announcements, documents, notifications', () {
    test('pinned first, then newest; drafts dropped', () {
      Announcement a(
        String id, {
        bool pinned = false,
        String at = '2026-11-01T00:00:00Z',
        String status = 'published',
      }) => Announcement.fromJson({
        ...announcementJson(id: id, pinned: pinned),
        'status': status,
        'published_at': at,
      });
      final sorted = sortAnnouncements([
        a('old'),
        a('new', at: '2026-11-05T00:00:00Z'),
        a('pin', pinned: true, at: '2026-10-01T00:00:00Z'),
        a('draft', status: 'draft'),
      ]);
      expect(sorted.map((x) => x.id), ['pin', 'new', 'old']);
    });

    test('folder levels: site folders before the unit folder', () {
      Folder f(String id, String name, String kind, String? parent) =>
          Folder.fromJson({
            'id': id,
            'org_id': orgId,
            'site_id': siteId,
            'parent_id': parent,
            'name': name,
            'kind': kind,
            'unit_id': kind == 'unit' ? unit12 : null,
            'visibility': {'level': 'everyone'},
            'breadcrumb': [
              {'id': id, 'name': name},
            ],
            'is_system': false,
            'created_at': '2026-01-01T00:00:00Z',
            'updated_at': '2026-01-01T00:00:00Z',
            'version': 1,
          });
      final all = [
        f('u', 'Your unit', 'unit', null),
        f('b', 'Rules', 'site', null),
        f('a', 'Minutes', 'site', null),
        f('c', 'Old', 'site', 'a'),
      ];
      expect(folderLevel(all, null).children.map((x) => x.id), ['a', 'b', 'u']);
      expect(folderLevel(all, 'a').children.map((x) => x.id), ['c']);
      expect(folderLevel(all, 'a').folder!.name, 'Minutes');
      expect(isPdf('application/pdf', 'x'), isTrue);
      expect(isPdf('application/octet-stream', 'Statement.PDF'), isTrue);
      expect(isPdf('image/png', 'a.png'), isFalse);
    });

    AppNotification n(
      String type, [
      Map<String, Object?> payload = const {},
      String? link,
    ]) => AppNotification.fromJson({
      'id': 'n1',
      'site_id': null,
      'type': type,
      'payload': payload,
      'read_at': null,
      'link': link,
      'created_at': '2026-11-08T10:00:00Z',
    });

    test('notifications route into the app; unknown ones do not navigate', () {
      expect(
        routeForNotification(
          n('announcement.published', {'announcement_id': 'x'}),
        ),
        '/more/announcements/x',
      );
      expect(
        routeForNotification(
          n('ticket.commented', const {}, '/orgs/o/tickets/t9'),
        ),
        '/tickets/t9',
      );
      expect(routeForNotification(n('payment.confirmed')), '/money');
      expect(routeForNotification(n('visitor.arrived')), isNull);
      expect(routeForNotification(n('brand.new_type')), isNull);
    });
  });

  group('org context', () {
    test('picks the selected org, else the first, and the unit site', () {
      final me = residentMe();
      expect(buildOrgContext(me, 'unknown')!.orgId, orgId);
      final ctx = buildOrgContext(me, orgId)!;
      expect(ctx.siteId, siteId);
      expect(ctx.currency, 'TRY');
      expect(ctx.timezone, 'Europe/Istanbul');
      expect(ctx.occupancies, hasLength(1));
      expect(
        buildOrgContext(Me.fromJson(residentMeJson(organizations: [])), null),
        isNull,
      );
    });
  });
}
