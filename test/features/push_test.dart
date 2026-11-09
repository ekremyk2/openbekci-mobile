import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/notifications/application/notifications_providers.dart';
import 'package:openbekci_mobile/features/push/application/local_notifier.dart';
import 'package:openbekci_mobile/features/push/application/push_service.dart';
import 'package:openbekci_mobile/features/push/domain/push_domain.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

import '../support/community_fixtures.dart';
import '../support/fake_api.dart';
import '../support/fixtures.dart';
import '../support/push_harness.dart';
import '../support/resident_harness.dart';

/// 12:00:30, thirty seconds into a two-minute approval window.
final clockNow = DateTime.utc(2026, 11, 9, 12, 0, 30);

Map<String, Object?> pushData({
  String? instance,
  String org = orgId,
  String notification = notificationId,
  String type = 'visitor.approval_requested',
  String collapse = 'visitor.approval_requested:$requestId',
  Object badge = '7',
}) => {
  'instance_id': instance ?? instanceId,
  'org_id': org,
  'notification_id': notification,
  'type': type,
  'collapse_key': collapse,
  'badge': badge,
};

Map<String, Object?> deviceJson(String id) => {
  'id': id,
  'push_kind': 'fcm',
  'relay_id': 'official',
  'app_version': '1.0.0',
  'locale': 'en',
  'enabled': true,
  'created_at': '2026-11-09T12:00:00Z',
  'updated_at': '2026-11-09T12:00:00Z',
};

const deviceA = '0192a3f0-1000-7000-8000-0000000000e2';
const deviceB = '0192a3f0-1000-7000-8000-0000000000e3';

void main() {
  group('payload', () {
    test('exactly the six content-free keys, FCM strings or JSON numbers', () {
      final p = PushPayload.tryParse(pushData())!;
      expect(p.instanceId, instanceId);
      expect(p.orgId, orgId);
      expect(p.notificationId, notificationId);
      expect(p.type, 'visitor.approval_requested');
      expect(p.badge, 7);
      expect(p.toData().keys.toSet(), {
        'instance_id',
        'org_id',
        'notification_id',
        'type',
        'collapse_key',
        'badge',
      });
      expect(PushPayload.tryParse(pushData(badge: 7))!.badge, 7);
      // Extra keys (an old or hostile server) never make it into the model.
      final extra = PushPayload.tryParse({...pushData(), 'title': 'Secret'})!;
      expect(extra.toData().containsKey('title'), isFalse);
    });

    test('a malformed payload is ignored', () {
      expect(PushPayload.tryParse({}), isNull);
      expect(PushPayload.tryParse(pushData(org: '../x')), isNull);
      expect(PushPayload.tryParse(pushData(notification: 'a/b')), isNull);
      expect(PushPayload.tryParse(pushData(type: '')), isNull);
      expect(PushPayload.tryParse(pushData(badge: 'many')), isNull);
      expect(PushPayload.tryParse(pushData(badge: -1)), isNull);
      expect(PushPayload.tryParse({...pushData(), 'instance_id': 5}), isNull);
    });

    test('it survives the trip through a local notification', () {
      final p = PushPayload.tryParse(pushData())!;
      expect(PushPayload.fromTapPayload(p.tapPayload), p);
      expect(PushPayload.fromTapPayload('periodic'), isNull);
      expect(PushPayload.fromTapPayload(null), isNull);
    });
  });

  group('push received without the app running', () {
    Account account() => const Account(
      serverOrigin: 'https://example.test',
      instanceId: instanceId,
      instanceName: 'Gul Sitesi',
      userId: 'u1',
    );

    test('shows the generic notice for this accounts instance only', () async {
      final shown = FakeLocalNotifier();
      final store = MemoryAccountStore()..account = account();
      await showBackgroundPush(pushData(), store: store, notifier: shown);
      expect(shown.shown, hasLength(1));
      expect(shown.shown.single.body, isNull, reason: 'content-free');
      await showBackgroundPush(
        pushData(instance: 'other-instance'),
        store: store,
        notifier: shown,
      );
      await showBackgroundPush(
        {...pushData(), 'title': 'x', 'org_id': '../x'},
        store: store,
        notifier: shown,
      );
      expect(
        shown.shown,
        hasLength(1),
        reason: 'foreign or malformed: ignored',
      );
    });

    test('is dropped when signed out', () async {
      final shown = FakeLocalNotifier();
      await showBackgroundPush(
        pushData(),
        store: MemoryAccountStore(),
        notifier: shown,
      );
      expect(shown.shown, isEmpty);
    });
  });

  group('types: titles, channels and routes for the whole vocabulary', () {
    final en = lookupAppLocalizations(const Locale('en'));
    final tr = lookupAppLocalizations(const Locale('tr'));

    test('every type has a generic title in en and tr, never the fallback', () {
      for (final type in notificationVocabulary) {
        expect(pushTitle(en, type), isNot(en.notifGeneric), reason: type);
        expect(pushTitle(en, type), isNotEmpty);
        expect(pushTitle(tr, type), isNot(tr.notifGeneric), reason: type);
        expect(pushTitle(tr, type), isNotEmpty);
      }
    });

    test('unknown types read "New notification"', () {
      expect(pushTitle(en, 'something.new'), 'New notification');
      expect(pushTitle(en, ''), 'New notification');
      expect(pushTitle(tr, 'something.new'), 'Yeni bildirim');
    });

    test('every type belongs to a channel area, unknown ones to system', () {
      final areas = {for (final t in notificationVocabulary) t: areaOfType(t)};
      expect(areas['announcement.published'], NotificationArea.announcements);
      expect(areas['charge.overdue'], NotificationArea.money);
      expect(areas['payment.receipt'], NotificationArea.money);
      expect(areas['ticket.commented'], NotificationArea.tickets);
      expect(areas['visitor.approval_requested'], NotificationArea.community);
      expect(areas['delivery.received'], NotificationArea.community);
      expect(areas['booking.confirmed'], NotificationArea.community);
      expect(areas['meeting.called'], NotificationArea.assembly);
      expect(areas['term.expiring'], NotificationArea.assembly);
      expect(areas['claim.decided'], NotificationArea.account);
      expect(areas['access.agent_silent'], NotificationArea.system);
      expect(areaOfType('x.y'), NotificationArea.system);
      // One Android channel id per area, all distinct.
      expect(
        {for (final a in NotificationArea.values) a.channelId}.length,
        NotificationArea.values.length,
      );
    });

    test('every area has a localized channel name', () {
      for (final l in [en, tr]) {
        for (final name in [
          l.channelAnnouncements,
          l.channelMoney,
          l.channelTickets,
          l.channelCommunity,
          l.channelAssembly,
          l.channelAccount,
          l.channelSystem,
        ]) {
          expect(name, isNotEmpty);
        }
      }
    });

    AppNotification note(String type, [Map<String, Object?>? payload]) =>
        AppNotification.fromJson(
          notificationJson(type: type, payload: payload),
        );

    test('a malformed id from a payload or link falls back to the list', () {
      for (final bad in ['../x', '%2F', 'a b', 'a?b=1']) {
        expect(
          routeForNotification(
            note('meeting.called', {'meeting_id': bad}),
            orgId: orgId,
          ),
          '/more/assembly',
          reason: bad,
        );
        expect(
          routeForNotification(
            note('ticket.updated', {'ticket_id': bad}),
            orgId: orgId,
          ),
          '/tickets',
          reason: bad,
        );
        expect(
          AppLink.parse(
            'openbekci://pay/return?org_id=o1&checkout_id=${Uri.encodeQueryComponent(bad)}',
          ),
          isNull,
          reason: bad,
        );
      }
    });

    test('a tap leads to the screen of its type', () {
      String? route(String type, [Map<String, Object?>? payload]) =>
          routeForNotification(note(type, payload), orgId: orgId);
      expect(
        route('visitor.approval_requested', {'request_id': requestId}),
        '/more/visitors/requests/$requestId',
      );
      expect(route('visitor.approval_requested', {}), '/more/visitors');
      expect(route('visitor.arrived', {}), '/more/visitors');
      expect(
        route('delivery.received', {'delivery_id': deliveryId}),
        '/more/parcels',
      );
      expect(route('booking.confirmed', {}), '/more/bookings');
      expect(
        route('meeting.called', {'meeting_id': meetingId}),
        '/more/assembly/$meetingId',
      );
      expect(route('meeting.decisions', {}), '/more/assembly');
      expect(route('term.expiring', {}), '/more/assembly');
      expect(
        route('announcement.published', {'announcement_id': 'abc'}),
        '/more/announcements/abc',
      );
      expect(route('ticket.updated', {'ticket_id': 'abc'}), '/tickets/abc');
      expect(route('payment.receipt', {}), '/money');
      expect(route('something.new', {}), isNull);
      // An id that is not a plain id never reaches a path.
      expect(
        route('visitor.approval_requested', {'request_id': '../../profile'}),
        '/more/visitors',
      );
    });

    test(
      'without the notification row a tap leads to the list of its type',
      () {
        expect(
          fallbackRouteForType('visitor.approval_requested'),
          '/more/visitors',
        );
        expect(fallbackRouteForType('delivery.received'), '/more/parcels');
        expect(fallbackRouteForType('booking.cancelled'), '/more/bookings');
        expect(fallbackRouteForType('meeting.called'), '/more/assembly');
        expect(fallbackRouteForType('payment.confirmed'), '/money');
        expect(fallbackRouteForType('ticket.updated'), '/tickets');
        expect(
          fallbackRouteForType('announcement.published'),
          '/more/announcements',
        );
        expect(fallbackRouteForType('unknown'), '/more/notifications');
      },
    );

    test('the body of a fetched notification is its first readable text', () {
      expect(notificationBodyOf({'visitor_name': ' Ali Veli '}), 'Ali Veli');
      expect(
        notificationBodyOf({'body': 'Hall, 15:00', 'title': 'x'}),
        'Hall, 15:00',
      );
      expect(notificationBodyOf({'request_id': 'abc'}), isNull);
      expect(notificationBodyOf({'body': 'x' * 300})!.length, 200);
    });

    test(
      'a visitor at the gate gets Approve and Deny buttons, nothing else does',
      () {
        final approval = genericNotice(PushPayload.tryParse(pushData())!, en);
        expect([for (final a in approval.actions) a.id], ['approve', 'deny']);
        expect(approval.title, 'Visitor waiting for approval');
        expect(approval.tag, 'visitor.approval_requested:$requestId');
        expect(approval.area, NotificationArea.community);
        final parcel = genericNotice(
          PushPayload.tryParse(
            pushData(type: 'delivery.received', collapse: ''),
          )!,
          en,
        );
        expect(parcel.actions, isEmpty);
        expect(
          parcel.tag,
          notificationId,
          reason: 'no collapse key: its own id',
        );
      },
    );
  });

  group('periodic fetch decision', () {
    final t0 = DateTime.utc(2026, 11, 9, 8);

    test('registered and recently heard from: push is trusted', () {
      final h = PushHealth(
        registered: true,
        registrationFailed: false,
        registeredAt: t0,
        lastPushAt: t0.add(const Duration(hours: 1)),
      );
      expect(
        shouldFetchPeriodically(h, t0.add(const Duration(hours: 5))),
        isFalse,
      );
      expect(showDelayedHint(h, t0.add(const Duration(hours: 5))), isFalse);
    });

    test('a failed registration falls back at once', () {
      const h = PushHealth(registered: false, registrationFailed: true);
      expect(shouldFetchPeriodically(h, t0), isTrue);
      expect(showDelayedHint(h, t0), isTrue);
    });

    test('no push for the configured period falls back', () {
      final h = PushHealth(
        registered: true,
        registrationFailed: false,
        registeredAt: t0,
      );
      expect(
        shouldFetchPeriodically(
          h,
          t0.add(const Duration(hours: 5, minutes: 59)),
        ),
        isFalse,
      );
      expect(
        shouldFetchPeriodically(h, t0.add(const Duration(hours: 6))),
        isTrue,
      );
      final heard = PushHealth(
        registered: true,
        registrationFailed: false,
        registeredAt: t0,
        lastPushAt: t0.add(const Duration(hours: 5)),
      );
      expect(
        shouldFetchPeriodically(heard, t0.add(const Duration(hours: 10))),
        isFalse,
      );
      expect(
        shouldFetchPeriodically(heard, t0.add(const Duration(hours: 11))),
        isTrue,
      );
    });

    test('not yet tried: nothing to fall back from', () {
      expect(shouldFetchPeriodically(PushHealth.unknown, t0), isFalse);
    });

    test('a rise of the unread count is news', () {
      expect(unreadRose(previous: 2, current: 3), isTrue);
      expect(unreadRose(previous: 3, current: 3), isFalse);
      expect(unreadRose(previous: 3, current: 0), isFalse);
    });
  });

  group('push end to end with a fake transport', () {
    late FakePushTransport transport;
    late FakeLocalNotifier notifier;

    ResidentApp build({
      FakePushTransport? wire,
      Map<String, Object?>? discovery,
      PushConfig config = const PushConfig(),
    }) {
      transport = wire ?? FakePushTransport();
      notifier = FakeLocalNotifier();
      final r = ResidentApp(
        pushEnabled: true,
        extra: [
          pushTransportProvider.overrideWithValue(transport),
          localNotifierProvider.overrideWithValue(notifier),
          pushClockProvider.overrideWithValue(() => clockNow),
          nowProvider.overrideWithValue(() => clockNow),
          pushConfigProvider.overrideWithValue(config),
        ],
      );
      r.adapter
        ..answer('POST /v1/me/devices', FakeResponse.ok(deviceJson(deviceA)))
        ..answer('DELETE /v1/me/devices/$deviceA', const FakeResponse(204))
        ..answer('DELETE /v1/me/devices/$deviceB', const FakeResponse(204))
        ..answer(
          'GET /v1/orgs/$orgId/me/notifications/$notificationId',
          FakeResponse.ok(notificationJson()),
        );
      r.adapter.answer(
        'GET /.well-known/openbekci.json',
        FakeResponse.ok(
          discovery ??
              {
                ...discoveryJson(),
                'policies': {'app_lock_required': false},
              },
        ),
      );
      return r;
    }

    Future<void> teardown(WidgetTester tester) async {
      await tester.pumpWidget(const SizedBox());
    }

    testWidgets(
      'registers after sign-in with the relay id, version and locale',
      (tester) async {
        final r = build();
        await pumpResident(tester, r);
        final posts = r.seen('POST /v1/me/devices');
        expect(posts, hasLength(1));
        final body = bodyOf(posts.single)! as Map<String, dynamic>;
        expect(body['push_kind'], 'fcm');
        expect(body['token'], 'fcm-token-1');
        expect(body['relay_id'], 'official');
        expect(body['app_version'], '1.0.0');
        expect(body['locale'], 'en');
        expect(transport.starts, 1);
        expect(notifier.inits, 1);
        expect(notifier.permissionRequests, 1);
        final container = ProviderScope.containerOf(
          tester.element(find.byType(OpenBekciApp)),
        );
        final status = container.read(pushControllerProvider);
        expect(status.health.registered, isTrue);
        expect(status.delayed, isFalse);
        await teardown(tester);
      },
    );

    testWidgets('a UnifiedPush endpoint is registered as the token, no relay', (
      tester,
    ) async {
      final r = build(
        wire: FakePushTransport(
          kind: 'unifiedpush',
          token: 'http://127.0.0.1:9999/push',
        ),
        discovery: {
          ...discoveryJson(),
          'policies': {'app_lock_required': false},
          'push': {'relay_ids': <String>[], 'unified_push': true},
        },
      );
      await pumpResident(tester, r);
      final body =
          bodyOf(r.seen('POST /v1/me/devices').single)! as Map<String, dynamic>;
      expect(body['push_kind'], 'unifiedpush');
      expect(body['token'], 'http://127.0.0.1:9999/push');
      expect(body.containsKey('relay_id'), isFalse);
      await teardown(tester);
    });

    testWidgets('a rotated token registers again and drops the old device', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      r.adapter.answer(
        'POST /v1/me/devices',
        FakeResponse.ok(deviceJson(deviceB)),
      );
      transport.rotate('fcm-token-2');
      await tester.pumpAndSettle();
      final posts = r.seen('POST /v1/me/devices');
      expect(posts, hasLength(2));
      expect((bodyOf(posts.last)! as Map)['token'], 'fcm-token-2');
      expect(r.seen('DELETE /v1/me/devices/$deviceA'), hasLength(1));
      expect(r.seen('DELETE /v1/me/devices/$deviceB'), isEmpty);
      await teardown(tester);
    });

    testWidgets('a push shows its generic title, then the server text', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      transport.deliver(pushData());
      await tester.pumpAndSettle();
      final shown = notifier.withTag('visitor.approval_requested:$requestId');
      expect(shown, hasLength(2), reason: 'generic first, then replaced');
      expect(shown.first.title, 'Visitor waiting for approval');
      expect(shown.first.body, isNull);
      expect([for (final a in shown.first.actions) a.id], ['approve', 'deny']);
      expect(shown.last.body, 'Ali Veli');
      expect(shown.last.payload, shown.first.payload);
      expect(
        r.seen('GET /v1/orgs/$orgId/me/notifications/$notificationId'),
        hasLength(1),
      );
      await teardown(tester);
    });

    testWidgets('offline, the generic title stays', (tester) async {
      final r = build();
      await pumpResident(tester, r);
      r.adapter.answer(
        'GET /v1/orgs/$orgId/me/notifications/$notificationId',
        FakeResponse.problem(404, 'not_found'),
      );
      transport.deliver(pushData(type: 'delivery.received', collapse: 'p1'));
      await tester.pumpAndSettle();
      final shown = notifier.withTag('p1');
      expect(shown, hasLength(1));
      expect(shown.single.title, 'Parcel received');
      await teardown(tester);
    });

    testWidgets('the badge of the push shows until the real count is in', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      transport.deliver(pushData());
      await tester.pump();
      await tester.pump();
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OpenBekciApp)),
      );
      expect(container.read(pushBadgeProvider), 7);
      expect(container.read(displayUnreadProvider), 7);
      // Once the real count is in, it takes over.
      await tester.pumpAndSettle();
      expect(container.read(pushBadgeProvider), isNull);
      expect(container.read(displayUnreadProvider), 3);
      await teardown(tester);
    });

    testWidgets('a message of another instance or a malformed one is ignored', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      transport
        ..deliver(pushData(instance: '0192a3f0-1000-7000-8000-00000000ffff'))
        ..deliver({'type': 'delivery.received'})
        ..deliver({...pushData(), 'org_id': '../x'});
      await tester.pumpAndSettle();
      expect(notifier.shown, isEmpty);
      expect(
        r.seen('GET /v1/orgs/$orgId/me/notifications/$notificationId'),
        isEmpty,
      );
      await teardown(tester);
    });

    testWidgets('a tap opens the screen of the notification, marking it read', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/me/notifications/$notificationId:read',
        const FakeResponse(204),
      );
      await pumpResident(tester, r);
      final payload = PushPayload.tryParse(
        pushData(type: 'delivery.received'),
      )!;
      r.adapter.answer(
        'GET /v1/orgs/$orgId/me/notifications/$notificationId',
        FakeResponse.ok(
          notificationJson(
            type: 'delivery.received',
            payload: {'delivery_id': deliveryId},
          ),
        ),
      );
      notifier.tap(LocalTap(payload: payload.tapPayload));
      await tester.pumpAndSettle();
      expect(topLocation(tester), '/more/parcels');
      expect(find.byKey(const Key('parcel_$deliveryId')), findsOneWidget);
      expect(
        r.seen('POST /v1/orgs/$orgId/me/notifications/$notificationId:read'),
        hasLength(1),
      );
      await teardown(tester);
    });

    testWidgets('offline, a tap still leads to the list of its type', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      r.adapter.answer(
        'GET /v1/orgs/$orgId/me/notifications/$notificationId',
        FakeResponse.problem(404, 'not_found'),
      );
      final payload = PushPayload.tryParse(
        pushData(type: 'booking.confirmed'),
      )!;
      notifier.tap(LocalTap(payload: payload.tapPayload));
      await tester.pumpAndSettle();
      expect(topLocation(tester), '/more/bookings');
      await teardown(tester);
    });

    testWidgets('the app started by a tap routes to it', (tester) async {
      final wire = FakePushTransport();
      final r = build(wire: wire);
      notifier.launch = LocalTap(
        payload: PushPayload.tryParse(pushData())!.tapPayload,
      );
      await pumpResident(tester, r);
      expect(topLocation(tester), '/more/visitors/requests/$requestId');
      await teardown(tester);
    });

    testWidgets('visitor approval answered from the notification button', (
      tester,
    ) async {
      final r = build();
      r.adapter.answer(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
        FakeResponse.ok(approvalRequestJson(status: 'approved')),
      );
      await pumpResident(tester, r);
      // The push arrives; the person taps "Approve" under the notification.
      transport.deliver(pushData());
      await tester.pumpAndSettle();
      final payload = PushPayload.tryParse(pushData())!;
      notifier.tap(LocalTap(payload: payload.tapPayload, actionId: 'approve'));
      await tester.pumpAndSettle();
      expect(topLocation(tester), '/more/visitors/requests/$requestId');
      final decides = r.seen(
        'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
      );
      expect(decides, hasLength(1));
      expect((bodyOf(decides.single)! as Map)['decision'], 'approve');
      expect(decides.single.headers['Idempotency-Key'], isNotEmpty);
      expect(find.byKey(const Key('resultApproved')), findsOneWidget);
      await teardown(tester);
    });

    testWidgets(
      'a plain tap on the approval notification asks, never answers',
      (tester) async {
        final r = build();
        await pumpResident(tester, r);
        transport.deliver(pushData());
        await tester.pumpAndSettle();
        final payload = PushPayload.tryParse(pushData())!;
        notifier.tap(LocalTap(payload: payload.tapPayload));
        await tester.pumpAndSettle();
        expect(topLocation(tester), '/more/visitors/requests/$requestId');
        expect(
          r.seen(
            'POST /v1/orgs/$orgId/visitor-approval-requests/$requestId:decide',
          ),
          isEmpty,
        );
        expect(find.byKey(const Key('approve')), findsOneWidget);
        await teardown(tester);
      },
    );

    testWidgets('a failed registration shows the delayed hint and polls', (
      tester,
    ) async {
      final r = build(
        wire: FakePushTransport(token: null),
        config: const PushConfig(
          fetchInterval: Duration(minutes: 5),
          tickInterval: Duration(seconds: 30),
        ),
      );
      await pumpResident(tester, r);
      expect(r.seen('POST /v1/me/devices'), isEmpty);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OpenBekciApp)),
      );
      expect(container.read(pushControllerProvider).delayed, isTrue);
      // The unread count is polled on the next tick; a rise is announced.
      r.adapter.answer(
        'GET /v1/orgs/$orgId/me/notifications/unread-count',
        const FakeResponse.ok({'unread': 9, 'visitor_approvals_pending': 0}),
      );
      await tester.pump(const Duration(seconds: 31));
      await tester.pump();
      expect(
        r.seen('GET /v1/orgs/$orgId/me/notifications/unread-count'),
        isNotEmpty,
      );
      container.read(routerProvider).go('/more/notifications');
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('delayedHint')), findsOneWidget);
      expect(find.text('Notifications may be delayed'), findsOneWidget);
      await teardown(tester);
    });

    testWidgets('an instance without a relay degrades the same way', (
      tester,
    ) async {
      final r = build(
        discovery: {
          ...discoveryJson(),
          'policies': {'app_lock_required': false},
          'push': {'relay_ids': <String>[], 'unified_push': false},
        },
      );
      await pumpResident(tester, r);
      expect(r.seen('POST /v1/me/devices'), isEmpty);
      expect(transport.starts, 0, reason: 'no point asking for a token');
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OpenBekciApp)),
      );
      expect(container.read(pushControllerProvider).delayed, isTrue);
      await teardown(tester);
    });

    testWidgets('sign-out deletes the device, the token and what is shown', (
      tester,
    ) async {
      final r = build();
      await pumpResident(tester, r);
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OpenBekciApp)),
      );
      await tester.runAsync(() => container.read(sessionProvider).signOut());
      await tester.pumpAndSettle();
      final deletes = r.seen('DELETE /v1/me/devices/$deviceA');
      expect(deletes, hasLength(1));
      expect(transport.stops, 1);
      expect(notifier.cancelled, 1);
      // The device goes before the session does.
      final order = [
        for (final q in r.adapter.requests) '${q.method} ${q.path}',
      ];
      expect(
        order.indexOf('DELETE /v1/me/devices/$deviceA'),
        lessThan(order.indexOf('DELETE /v1/me/sessions/current')),
      );
      await teardown(tester);
    });
  });

  test('device registration body decodes the way the server wants it', () {
    final body = DeviceRegister(
      pushKind: 'unifiedpush',
      token: 'https://push.example.org/abc',
      appVersion: '1.0.0',
      locale: 'tr',
    ).toJson();
    expect(json.encode(body), isNot(contains('relay_id')));
    expect(body['push_kind'], 'unifiedpush');
  });
}
