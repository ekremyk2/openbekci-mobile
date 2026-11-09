import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/services/services.dart';

import '../support/fake_api.dart';
import '../support/fixtures.dart';
import '../support/resident_harness.dart';

void main() {
  group('home', () {
    testWidgets('owner: both sides, late fee, counters, assembly', (
      tester,
    ) async {
      final r = ResidentApp(
        dashboard: dashboardJson(
          sides: [
            sideJson(),
            sideJson(kind: 'tenant', total: 90000, fee: 0),
          ],
        ),
      );
      await pumpResident(tester, r);
      expect(find.text('Gul Yonetim'), findsOneWidget);
      expect(find.byKey(const Key('side_${unit12}_owner')), findsOneWidget);
      expect(find.byKey(const Key('side_${unit12}_tenant')), findsOneWidget);
      // Balance includes the fee accrued so far.
      expect(find.textContaining('1,500.00'), findsOneWidget);
      expect(find.text('includes late fee'), findsOneWidget);
      expect(find.byKey(const Key('tileAnnouncements')), findsOneWidget);
      await tester.scrollUntilVisible(
        find.byKey(const Key('nextAssembly')),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Annual assembly'), findsOneWidget);
      // The Money tab exists for people who see a side.
      expect(find.byKey(const Key('navMoney')), findsOneWidget);
    });

    testWidgets('household without money: no sides, no Money tab', (
      tester,
    ) async {
      final r = ResidentApp(
        me: residentMeJson(
          occupancies: [
            occupancyJson(kind: 'household', side: null, maySeeMoney: false),
          ],
        ),
        dashboard: dashboardJson(sides: []),
      );
      await pumpResident(tester, r);
      expect(find.byKey(const Key('noMoneyNote')), findsOneWidget);
      expect(find.byKey(const Key('navMoney')), findsNothing);
      expect(find.byKey(const Key('navTickets')), findsOneWidget);
    });

    testWidgets('serves the cached dashboard offline with a hint', (
      tester,
    ) async {
      final r = ResidentApp();
      await pumpResident(tester, r);
      expect(find.byKey(const Key('side_${unit12}_owner')), findsOneWidget);
      // Second launch, network gone: same database, dashboard fails.
      r.adapter.on('GET /v1/orgs/$orgId/me/dashboard', (_) {
        throw StateError('offline');
      });
      await tester.tap(find.byKey(const Key('navTickets')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('navHome')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('side_${unit12}_owner')), findsOneWidget);
    });
  });

  group('statement and pay', () {
    testWidgets('shows lines, the accrued fee and the period request', (
      tester,
    ) async {
      final r = ResidentApp();
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navMoney')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('totalDue')), findsOneWidget);
      expect(find.byKey(const Key('accruedLine')), findsOneWidget);
      expect(find.text('November dues'), findsOneWidget);
      expect(find.text('Cash payment'), findsOneWidget);
      // Declared transfer waits for confirmation.
      expect(find.text('Declared, awaiting confirmation'), findsWidgets);

      final first = r.seen(
        'GET /v1/orgs/$orgId/units/$unit12/statements/owner',
      );
      expect(first.last.queryParameters['from'], matches(r'^\d{4}-01-01$'));
      expect(first.last.queryParameters['to'], matches(r'^\d{4}-\d{2}-\d{2}$'));

      await tapKey(tester, 'period_all');
      final all = r.seen('GET /v1/orgs/$orgId/units/$unit12/statements/owner');
      expect(all.last.queryParameters['from'], '2000-01-01');
    });

    testWidgets('a server that refuses residents on the statement is served '
        'from charges and payments', (tester) async {
      final r = ResidentApp();
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/units/$unit12/statements/owner',
          FakeResponse.problem(403, 'insufficient_permission'),
        )
        ..answer(
          'GET /v1/orgs/$orgId/charges',
          FakeResponse.ok(
            pageOf([
              {
                'id': 'c1',
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
                'amount': money(100000),
                'paid': money(0),
                'balance': money(100000),
                'due_date': '2026-10-01',
                'description': 'October dues',
                'allocation_basis': null,
                'journal_entry_id': '0192a3f0-1000-7000-8000-0000000000ff',
                'status': 'open',
                'cancelled_reason': null,
                'created_at': '2026-01-01T00:00:00Z',
                'updated_at': '2026-01-01T00:00:00Z',
                'effective_debtor': {
                  'debtor_kind': 'owner',
                  'display_name': 'Ayse',
                  'person_id': personId,
                  'source': 'charge',
                },
              },
            ]),
          ),
        );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navMoney')));
      await tester.pumpAndSettle();
      expect(find.text('October dues'), findsOneWidget);
      expect(find.byKey(const Key('totalDue')), findsOneWidget);
      expect(find.byKey(const Key('accruedLine')), findsOneWidget);
    });

    testWidgets('PDF goes to the share sheet', (tester) async {
      final r = ResidentApp();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/units/$unit12/statements/owner',
        FakeResponse.ok(statementJson()),
      );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navMoney')));
      await tester.pumpAndSettle();
      // The same path with format=pdf answers bytes.
      r.adapter.on('GET /v1/orgs/$orgId/units/$unit12/statements/owner', (o) {
        if (o.queryParameters['format'] == 'pdf') {
          return const FakeResponse(200);
        }
        return FakeResponse.ok(statementJson());
      });
      await tapKey(tester, 'sharePdf');
      final pdf = r
          .seen('GET /v1/orgs/$orgId/units/$unit12/statements/owner')
          .where((o) => o.queryParameters['format'] == 'pdf');
      expect(pdf, isNotEmpty);
    });

    testWidgets('former resident: fixed period, no pay button', (tester) async {
      final r = ResidentApp(
        me: residentMeJson(
          occupancies: [
            occupancyJson(
              kind: 'former_occupant',
              from: '2025-03-01',
              to: '2026-02-28',
            ),
          ],
        ),
        dashboard: dashboardJson(sides: []),
      );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navMoney')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('formerNote')), findsOneWidget);
      expect(find.byKey(const Key('payByTransfer')), findsNothing);
      final req = r
          .seen('GET /v1/orgs/$orgId/units/$unit12/statements/owner')
          .last;
      expect(req.queryParameters['from'], '2025-03-01');
      expect(req.queryParameters['to'], '2026-02-28');
    });

    testWidgets('card button stays hidden by default', (tester) async {
      final r = ResidentApp();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/sites/$siteId/settings',
        FakeResponse.ok(siteSettingsJson(card: false)),
      );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navMoney')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('payByCard')), findsNothing);
    });

    testWidgets('card checkout: pick a charge, Custom Tab, poll to paid', (
      tester,
    ) async {
      final opener = FakeUrlOpener();
      final r = ResidentApp(
        extra: [urlOpenerProvider.overrideWithValue(opener)],
      );
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/sites/$siteId/settings',
          FakeResponse.ok(siteSettingsJson()),
        )
        ..answer(
          'GET /v1/orgs/$orgId/charges',
          FakeResponse.ok(pageOf([chargeJson()])),
        )
        ..answer(
          'POST /v1/orgs/$orgId/checkouts',
          FakeResponse(201, checkoutJson()),
        )
        ..answer(
          'GET /v1/orgs/$orgId/checkouts/$checkoutId',
          FakeResponse.ok(checkoutJson()),
        );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navMoney')));
      await tester.pumpAndSettle();
      await tapKey(tester, 'payByCard');
      await tapKey(tester, 'charge_$chargeId');
      await tapKey(tester, 'checkoutContinue');

      final post = r.seen('POST /v1/orgs/$orgId/checkouts').single;
      expect(post.headers['Idempotency-Key'], isNotEmpty);
      expect(bodyOf(post), {
        'unit_id': unit12,
        'debtor_kind': 'owner',
        'charge_ids': [chargeId],
        'client': 'mobile',
      });
      expect(opener.opened.single.host, 'pay.example.test');
      expect(find.byKey(const Key('checkout_pending')), findsOneWidget);

      // The provider confirmed less than asked: paid, flagged.
      r.adapter.answer(
        'GET /v1/orgs/$orgId/checkouts/$checkoutId',
        FakeResponse.ok(
          checkoutJson(
            status: 'paid',
            extra: {'amount_mismatch': true, 'confirmed_amount': money(100000)},
          ),
        ),
      );
      await tapKey(tester, 'checkoutRefresh');
      expect(find.byKey(const Key('checkout_paid')), findsOneWidget);
      expect(find.byKey(const Key('checkoutMismatch')), findsOneWidget);
    });

    testWidgets('declares a transfer once, with one Idempotency-Key', (
      tester,
    ) async {
      final r = ResidentApp();
      var calls = 0;
      r.adapter.on('POST /v1/orgs/$orgId/payments:declare', (_) {
        calls++;
        if (calls == 1) return FakeResponse.problem(409, 'conflict');
        return FakeResponse(201, paymentJson());
      });
      await pumpResident(tester, r);
      await open(tester, '/money/pay?side=$unit12:owner');
      expect(find.byKey(const Key('bankDetails')), findsOneWidget);
      expect(find.text('TR330006100519786457841326'), findsOneWidget);

      String? clip;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            clip = (call.arguments as Map)['text'] as String?;
          }
          return null;
        },
      );
      await tapKey(tester, 'copyIban');
      expect(clip, 'TR330006100519786457841326');

      await typeInto(tester, 'declareAmount', '500,00');
      await typeInto(tester, 'declareReference', 'GUL-12');
      await tapKey(tester, 'declareSubmit');
      await tapKey(tester, 'declareSubmit');
      expect(find.byKey(const Key('declareDone')), findsOneWidget);

      final posts = r.seen('POST /v1/orgs/$orgId/payments:declare');
      expect(posts.length, greaterThanOrEqualTo(2));
      final keys = {for (final p in posts) p.headers['Idempotency-Key']};
      expect(keys, hasLength(1));
      final body = bodyOf(posts.last)! as Map;
      expect(body['amount'], {'amount': 50000, 'currency': 'TRY'});
      expect(body['debtor'], {
        'mode': 'unit_side',
        'unit_id': unit12,
        'debtor_kind': 'owner',
      });
      expect(body['paid_on'], matches(r'^\d{4}-\d{2}-\d{2}$'));
      expect(body['reference'], 'GUL-12');
      expect(body['site_id'], siteId);
    });

    testWidgets('a retry with an edited amount is a new declaration with a '
        'new Idempotency-Key', (tester) async {
      final r = ResidentApp();
      var calls = 0;
      r.adapter.on('POST /v1/orgs/$orgId/payments:declare', (_) {
        calls++;
        if (calls <= 2) return FakeResponse.problem(409, 'conflict');
        return FakeResponse(201, paymentJson());
      });
      await pumpResident(tester, r);
      await open(tester, '/money/pay?side=$unit12:owner');
      await typeInto(tester, 'declareAmount', '500,00');
      await tapKey(tester, 'declareSubmit');
      await tapKey(tester, 'declareSubmit');
      await typeInto(tester, 'declareAmount', '450,00');
      await tapKey(tester, 'declareSubmit');
      expect(find.byKey(const Key('declareDone')), findsOneWidget);

      final posts = r.seen('POST /v1/orgs/$orgId/payments:declare');
      expect(posts, hasLength(3));
      final keys = [for (final p in posts) p.headers['Idempotency-Key']];
      expect(keys[0], keys[1]);
      expect(keys[2], isNot(keys[0]));
      expect((bodyOf(posts.last)! as Map)['amount'], {
        'amount': 45000,
        'currency': 'TRY',
      });
    });
  });

  group('tickets', () {
    testWidgets('list groups open and closed; detail votes and comments', (
      tester,
    ) async {
      final r = ResidentApp();
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/tickets',
          FakeResponse.ok(
            pageOf([
              ticketJson(),
              ticketJson(
                id: '0192a3f0-1000-7000-8000-0000000000d2',
                title: 'Broken gate',
                status: 'Resolved',
                semantic: 'closed_like',
              ),
            ]),
          ),
        )
        ..answer(
          'GET /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1',
          FakeResponse.ok(ticketJson()),
        )
        ..answer(
          'GET /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1/comments',
          FakeResponse.ok(pageOf(<Object?>[])),
        )
        ..answer(
          'GET /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1/history',
          FakeResponse.ok(pageOf(<Object?>[])),
        )
        ..answer(
          'PUT /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1/vote',
          const FakeResponse.ok({
            'ticket_id': '0192a3f0-1000-7000-8000-0000000000d1',
            'vote_count': 5,
            'voted': true,
          }),
        )
        ..answer(
          'POST /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1/comments',
          const FakeResponse(201, {
            'id': 'c1',
            'org_id': orgId,
            'ticket_id': 't',
            'author_person_id': personId,
            'author_display_name': 'Ayse',
            'body': 'Thanks',
            'visibility': 'public',
            'attachments': <Object?>[],
            'created_at': '2026-11-09T09:00:00Z',
            'updated_at': '2026-11-09T09:00:00Z',
          }),
        );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navTickets')));
      await tester.pumpAndSettle();
      expect(find.text('Open'), findsWidgets);
      expect(find.text('Closed'), findsWidgets);
      // The status name is the site's own word.
      expect(find.text('Resolved'), findsOneWidget);

      await tester.tap(
        find.byKey(const Key('ticket_0192a3f0-1000-7000-8000-0000000000d1')),
      );
      await tester.pumpAndSettle();
      expect(find.text('The lift is stuck on floor 3.'), findsOneWidget);
      await tapKey(tester, 'voteButton');
      expect(
        r.seen(
          'PUT /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1/vote',
        ),
        hasLength(1),
      );
      await typeInto(tester, 'commentField', 'Thanks');
      await tapKey(tester, 'commentSend');
      final post = r.seen(
        'POST /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d1/comments',
      );
      expect((bodyOf(post.single)! as Map)['body'], 'Thanks');
      expect((bodyOf(post.single)! as Map)['visibility'], 'public');
    });

    testWidgets('creates a ticket with a compressed photo upload', (
      tester,
    ) async {
      final r = ResidentApp(
        picker: FakePhotoPicker([
          PickedPhoto(name: 'leak.png', bytes: tinyPng),
        ]),
      );
      r.adapter
        ..on(
          'POST /v1/orgs/$orgId/files',
          (_) => FakeResponse(201, _fileJson()),
        )
        ..on(
          'POST /v1/orgs/$orgId/tickets',
          (_) => FakeResponse(
            201,
            ticketJson(id: '0192a3f0-1000-7000-8000-0000000000d5'),
          ),
        )
        ..answer(
          'GET /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d5',
          FakeResponse.ok(
            ticketJson(id: '0192a3f0-1000-7000-8000-0000000000d5'),
          ),
        )
        ..answer(
          'GET /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d5/comments',
          FakeResponse.ok(pageOf(<Object?>[])),
        )
        ..answer(
          'GET /v1/orgs/$orgId/tickets/0192a3f0-1000-7000-8000-0000000000d5/history',
          FakeResponse.ok(pageOf(<Object?>[])),
        );
      await pumpResident(tester, r);
      await open(tester, '/tickets/new');
      // Submitting empty shows field errors and sends nothing.
      await tapKey(tester, 'ticketSubmit');
      expect(find.text('This field is required.'), findsWidgets);
      expect(r.seen('POST /v1/orgs/$orgId/tickets'), isEmpty);

      await tester.tap(find.byKey(const Key('ticketCategory')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Elevator').last);
      await tester.pumpAndSettle();
      await typeInto(tester, 'ticketTitleField', 'Leak');
      await typeInto(tester, 'ticketDescriptionField', 'Water on the stairs');
      await tapKey(tester, 'addPhotoGallery');
      // Compression runs in an isolate: give it real time.
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 500)),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('photo_0')), findsOneWidget);
      await tapKey(tester, 'ticketSubmit');

      final upload = r.seen('POST /v1/orgs/$orgId/files').single;
      expect(upload.headers['Idempotency-Key'], isNotNull);
      final post = r.seen('POST /v1/orgs/$orgId/tickets').single;
      final body = bodyOf(post)! as Map;
      expect(body['attachment_file_ids'], [
        '0192a3f0-1000-7000-8000-0000000000f9',
      ]);
      expect(body['category_id'], '0192a3f0-1000-7000-8000-0000000000d9');
      expect(body['site_id'], siteId);
      expect(post.headers['Idempotency-Key'], isNotNull);
      expect(find.text('Elevator stuck'), findsWidgets);
    });
  });

  group('announcements', () {
    testWidgets('opening an unread announcement sends the read receipt', (
      tester,
    ) async {
      const id = '0192a3f0-1000-7000-8000-0000000000a9';
      final r = ResidentApp();
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/announcements/$id',
          FakeResponse.ok(announcementJson()),
        )
        ..answer(
          'PUT /v1/orgs/$orgId/announcements/$id/read',
          const FakeResponse(204),
        );
      await pumpResident(tester, r);
      await open(tester, '/more/announcements');
      expect(find.text('Water cut on Saturday'), findsOneWidget);
      await tester.tap(find.byKey(const Key('announcement_$id')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('announcementBody')), findsOneWidget);
      expect(find.text('schedule.pdf'), findsOneWidget);
      expect(
        r.seen('PUT /v1/orgs/$orgId/announcements/$id/read'),
        hasLength(1),
      );
    });

    testWidgets('an already read announcement sends no second receipt', (
      tester,
    ) async {
      const id = '0192a3f0-1000-7000-8000-0000000000a9';
      final r = ResidentApp();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/announcements/$id',
        FakeResponse.ok(announcementJson(read: true)),
      );
      await pumpResident(tester, r);
      await open(tester, '/more/announcements/$id');
      expect(r.seen('PUT /v1/orgs/$orgId/announcements/$id/read'), isEmpty);
    });
  });

  group('documents', () {
    testWidgets('folders, unit folder and a PDF opened inline', (tester) async {
      Map<String, Object?> folder(String id, String name, String kind) => {
        'id': id,
        'org_id': orgId,
        'site_id': siteId,
        'parent_id': null,
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
      };
      final r = ResidentApp();
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/folders',
          FakeResponse.ok(
            pageOf([
              folder('f1', 'Minutes', 'site'),
              folder('f2', 'A Blok D:12', 'unit'),
            ]),
          ),
        )
        ..answer(
          'GET /v1/orgs/$orgId/documents',
          FakeResponse.ok(
            pageOf([
              {
                'id': 'd1',
                'org_id': orgId,
                'site_id': siteId,
                'folder_id': 'f2',
                'title': 'Statement.pdf',
                'file_id': 'file1',
                'mime': 'application/pdf',
                'size': 10,
                'visibility': null,
                'source': 'generated',
                'generated_from': null,
                'uploaded_by': null,
                'created_at': '2026-11-01T00:00:00Z',
                'updated_at': '2026-11-01T00:00:00Z',
                'version': 1,
              },
            ]),
          ),
        )
        ..on('GET /v1/orgs/$orgId/files/file1', (_) => const FakeResponse(200));
      await pumpResident(tester, r);
      await open(tester, '/more/documents');
      expect(find.text('Minutes'), findsOneWidget);
      expect(find.text('A Blok D:12'), findsOneWidget);
      await tester.tap(find.byKey(const Key('folder_f2')));
      await tester.pumpAndSettle();
      expect(find.text('Generated'), findsOneWidget);
      await tester.tap(find.byKey(const Key('document_d1')));
      await tester.pumpAndSettle();
      expect(find.textContaining('PDF '), findsOneWidget);
    });
  });

  group('notifications', () {
    testWidgets('mark read navigates; mutes cannot touch essential types', (
      tester,
    ) async {
      final r = ResidentApp();
      r.adapter
        ..answer(
          'GET /v1/orgs/$orgId/me/notifications',
          FakeResponse.ok(
            pageOf([
              {
                'id': 'n1',
                'site_id': null,
                'type': 'payment.confirmed',
                'payload': <String, Object?>{},
                'read_at': null,
                'link': null,
                'created_at': '2026-11-08T10:00:00Z',
              },
              {
                'id': 'n2',
                'site_id': null,
                'type': 'something.new',
                'payload': <String, Object?>{},
                'read_at': '2026-11-08T10:00:00Z',
                'link': null,
                'created_at': '2026-11-07T10:00:00Z',
              },
            ]),
          ),
        )
        ..answer(
          'POST /v1/orgs/$orgId/me/notifications/n1:read',
          const FakeResponse.ok({
            'id': 'n1',
            'site_id': null,
            'type': 'payment.confirmed',
            'payload': <String, Object?>{},
            'read_at': '2026-11-09T10:00:00Z',
            'link': null,
            'created_at': '2026-11-08T10:00:00Z',
          }),
        )
        ..answer(
          'GET /v1/orgs/$orgId/me/notification-mutes',
          const FakeResponse.ok({
            'muted_types': ['ticket.updated'],
            'unmutable_types': ['auth.otp'],
            'available_types': [
              'ticket.updated',
              'auth.otp',
              'payment.receipt',
            ],
          }),
        )
        ..answer(
          'PUT /v1/orgs/$orgId/me/notification-mutes',
          const FakeResponse.ok({
            'muted_types': ['payment.receipt', 'ticket.updated'],
            'unmutable_types': ['auth.otp'],
            'available_types': [
              'ticket.updated',
              'auth.otp',
              'payment.receipt',
            ],
          }),
        );
      await pumpResident(tester, r);
      await open(tester, '/more/notifications');
      expect(find.text('Payment confirmed'), findsOneWidget);
      // An unknown type shows its raw type string.
      expect(find.text('something.new'), findsOneWidget);
      await tester.tap(find.byKey(const Key('notification_n1')));
      await tester.pumpAndSettle();
      expect(
        r.seen('POST /v1/orgs/$orgId/me/notifications/n1:read'),
        hasLength(1),
      );
      expect(currentLocation(tester), '/money');

      await open(tester, '/more/notifications/settings');
      final locked = tester.widget<SwitchListTile>(
        find.byKey(const Key('mute_auth.otp')),
      );
      expect(locked.onChanged, isNull);
      await tester.tap(find.byKey(const Key('mute_payment.receipt')));
      await tester.pumpAndSettle();
      final put = r.seen('PUT /v1/orgs/$orgId/me/notification-mutes').single;
      expect((bodyOf(put)! as Map)['muted_types'], [
        'payment.receipt',
        'ticket.updated',
      ]);
    });
  });

  group('profile', () {
    testWidgets('sessions: revoke another device', (tester) async {
      final r = ResidentApp();
      Map<String, Object?> session(String id, {bool current = false}) => {
        'id': id,
        'client': 'mobile',
        'device_name': current ? 'My phone' : 'Old tablet',
        'ip': null,
        'user_agent': null,
        'created_at': '2026-11-01T00:00:00Z',
        'last_used_at': null,
        'expires_at': '2027-01-01T00:00:00Z',
        'current': current,
      };
      r.adapter
        ..answer(
          'GET /v1/me/sessions',
          FakeResponse.ok({
            'items': [session('s1', current: true), session('s2')],
            'next_cursor': null,
          }),
        )
        ..answer('DELETE /v1/me/sessions/s2', const FakeResponse(204));
      await pumpResident(tester, r);
      await open(tester, '/profile/sessions');
      expect(find.text('This device'), findsOneWidget);
      expect(find.byKey(const Key('revoke_s1')), findsNothing);
      await tapKey(tester, 'revoke_s2');
      await tapKey(tester, 'confirmRevoke');
      expect(r.seen('DELETE /v1/me/sessions/s2'), hasLength(1));
    });

    testWidgets('directory opt-in and gate phone with If-Match', (
      tester,
    ) async {
      final person = {
        'id': personId,
        'org_id': orgId,
        'user_id': '0192a3f0-1000-7000-8000-0000000000aa',
        'display_name': 'Ayse Yilmaz',
        'contact': {'phone': '+905321234567', 'email': null},
        'national_id_masked': null,
        'national_id_country': null,
        'gate_contact_phone': null,
        'notes': null,
        'join_status': 'joined',
        'directory_consent': [
          {'site_id': siteId, 'consent': false, 'show_phone': false},
        ],
        'created_at': '2026-01-01T00:00:00Z',
        'updated_at': '2026-01-01T00:00:00Z',
        'version': 7,
      };
      final r = ResidentApp();
      r.adapter
        ..answer('GET /v1/orgs/$orgId/me/person', FakeResponse.ok(person))
        ..answer(
          'PUT /v1/orgs/$orgId/me/directory-consent',
          const FakeResponse.ok({
            'site_id': siteId,
            'consent': true,
            'show_phone': false,
          }),
        )
        ..answer('PATCH /v1/orgs/$orgId/me/person', FakeResponse.ok(person));
      await pumpResident(tester, r);
      await open(tester, '/profile/directory');
      await tester.tap(find.byKey(const Key('directory_$siteId')));
      await tester.pumpAndSettle();
      final put = r.seen('PUT /v1/orgs/$orgId/me/directory-consent').single;
      expect(bodyOf(put), {
        'site_id': siteId,
        'consent': true,
        'show_phone': false,
      });

      await open(tester, '/profile/me');
      await typeInto(tester, 'gatePhone', '+905551112233');
      await tapKey(tester, 'meSave');
      final patch = r.seen('PATCH /v1/orgs/$orgId/me/person').single;
      expect(patch.headers['If-Match'], '"7"');
      expect((bodyOf(patch)! as Map)['gate_contact_phone'], '+905551112233');
    });

    testWidgets('app lock toggles through the authenticator', (tester) async {
      final r = ResidentApp();
      await pumpResident(tester, r);
      await open(tester, '/profile/lock');
      await tapKey(tester, 'lockSwitch');
      expect(r.lock.prompts, 1);
      expect(
        tester
            .widget<SwitchListTile>(find.byKey(const Key('lockSwitch')))
            .value,
        isTrue,
      );
    });

    testWidgets('app lock says so when the device has no screen lock', (
      tester,
    ) async {
      final r2 = ResidentApp(lock: FakeLock(available: false));
      await pumpResident(tester, r2);
      await open(tester, '/profile/lock');
      await tapKey(tester, 'lockSwitch');
      expect(find.byKey(const Key('lockMessage')), findsOneWidget);
    });

    testWidgets('organization switch, units with sides, consents, about', (
      tester,
    ) async {
      final r = ResidentApp();
      await pumpResident(tester, r);
      await open(tester, '/profile');
      expect(
        find.byKey(const Key('occupancy_0192a3f0-1000-7000-8000-0000000000a1')),
        findsOneWidget,
      );
      expect(find.textContaining('Owner side'), findsOneWidget);
      expect(find.byKey(const Key('org_$orgId')), findsOneWidget);
      await open(tester, '/profile/consents');
      expect(find.byKey(const Key('consentsNote')), findsOneWidget);
      await open(tester, '/profile/about');
      expect(find.text('Version 1.0.0 (1)'), findsOneWidget);
    });
  });

  group('errors', () {
    testWidgets('a failed ticket list shows the shared error with retry', (
      tester,
    ) async {
      final r = ResidentApp();
      r.adapter.answer(
        'GET /v1/orgs/$orgId/tickets',
        FakeResponse.problem(403, 'insufficient_permission'),
      );
      await pumpResident(tester, r);
      await tester.tap(find.byKey(const Key('navTickets')));
      await tester.pumpAndSettle();
      expect(
        find.text('You do not have permission to do this.'),
        findsOneWidget,
      );
      expect(find.text('Try again'), findsOneWidget);
    });
  });

  test('fixtures are valid JSON', () {
    expect(() => json.encode(dashboardJson()), returnsNormally);
  });
}

Map<String, Object?> _fileJson() => {
  'id': '0192a3f0-1000-7000-8000-0000000000f9',
  'org_id': orgId,
  'site_id': siteId,
  'name': 'leak.jpg',
  'size': 10,
  'mime': 'image/jpeg',
  'sha256': 'abc',
  'status': 'ready',
  'source': 'uploaded',
  'uploaded_by': null,
  'scope': null,
  'has_variants': false,
  'retention_until': null,
  'variants': <String, Object?>{},
  'links': {
    'original': null,
    'variants': <String, Object?>{},
    'expires_at': '2026-11-09T12:00:00Z',
  },
  'created_at': '2026-11-09T09:00:00Z',
  'updated_at': '2026-11-09T09:00:00Z',
};
