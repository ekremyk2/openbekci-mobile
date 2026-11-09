import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart'
    as api_models
    show Notification;
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';

typedef AppNotification = api_models.Notification;

/// The in-app notification center (first pages).
final notificationsProvider = StreamProvider<CacheState<List<AppNotification>>>(
  (ref) {
    final scope = ref.watch(scopeProvider);
    if (scope == null) return const Stream.empty();
    return watchCached<List<AppNotification>>(
      ref,
      key: 'org/${scope.orgId}/notifications',
      fetch: (api) async => [
        for (final n in await fetchPages<AppNotification>((cursor) async {
          final page = await unwrap(
            () => api.operations.operationsListNotifications(
              orgId: scope.orgId,
              cursor: cursor,
            ),
          );
          return (items: page.items, next: page.nextCursor);
        }, maxPages: 3))
          n.toJson(),
      ],
      decode: (j) => decodeList(j, AppNotification.fromJson),
    );
  },
);

/// Unread count for the tab badge; refreshed with the dashboard and by
/// `invalidate` after marking.
final unreadCountProvider = StreamProvider<CacheState<int>>((ref) {
  final scope = ref.watch(scopeProvider);
  if (scope == null) return const Stream.empty();
  return watchCached<int>(
    ref,
    key: 'org/${scope.orgId}/unread-count',
    fetch: (api) async => (await unwrap(
      () => api.operations.operationsGetUnreadCount(orgId: scope.orgId),
    )).unread,
    decode: (j) => (j as num?)?.toInt() ?? 0,
  );
});

/// Marks one notification read (and refreshes the counters).
Future<void> markNotificationRead(WidgetRef ref, String id) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) return;
  try {
    await unwrap(
      () => api.operations.operationsMarkNotificationRead(
        orgId: scope.orgId,
        notificationId: id,
      ),
    );
  } on Object {
    return;
  }
  ref
    ..invalidate(notificationsProvider)
    ..invalidate(unreadCountProvider);
}

Future<void> markAllNotificationsRead(WidgetRef ref) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) return;
  await unwrapVoid(
    () => api.operations.operationsMarkAllNotificationsRead(orgId: scope.orgId),
  );
  ref
    ..invalidate(notificationsProvider)
    ..invalidate(unreadCountProvider);
}

/// Mutes per non-essential type (`unmutable_types` cannot be muted: sign-in
/// codes and invitations).
final notificationMutesProvider = StreamProvider<CacheState<NotificationMutes>>(
  (ref) {
    final scope = ref.watch(scopeProvider);
    if (scope == null) return const Stream.empty();
    return watchCached<NotificationMutes>(
      ref,
      key: 'org/${scope.orgId}/notification-mutes',
      fetch: (api) async => (await unwrap(
        () => api.operations.operationsGetNotificationMutes(orgId: scope.orgId),
      )).toJson(),
      decode: (j) =>
          NotificationMutes.fromJson((j! as Map).cast<String, dynamic>()),
    );
  },
);

Future<void> setNotificationMutes(WidgetRef ref, List<String> muted) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) return;
  await unwrap(
    () => api.operations.operationsSetNotificationMutes(
      orgId: scope.orgId,
      notificationMutesSet: NotificationMutesSet(mutedTypes: muted),
    ),
  );
  ref.invalidate(notificationMutesProvider);
}

/// Where a notification leads inside the app, or `null` when there is no
/// screen for it (the center then just marks it read). Understands the
/// payload ids of the notification types residents get and the server's
/// `link` (`/orgs/{org}/tickets/{id}`); unknown types never navigate.
String? routeForNotification(AppNotification n, {required String orgId}) {
  // A link that names another organization is not ours to open.
  final linkOrg = _linkId(n.link, 'orgs');
  if (linkOrg != null && linkOrg != orgId) return null;
  final payload = n.payload;
  String? id(String key) => _safeId(payload[key]);

  final type = n.type;
  if (type.startsWith('announcement.')) {
    final a =
        id('announcement_id') ?? _safeId(_linkId(n.link, 'announcements'));
    return a == null ? '/more/announcements' : '/more/announcements/$a';
  }
  if (type.startsWith('ticket.')) {
    final t = id('ticket_id') ?? _safeId(_linkId(n.link, 'tickets'));
    return t == null ? '/tickets' : '/tickets/$t';
  }
  if (type.startsWith('payment.') ||
      type.startsWith('charge.') ||
      type.startsWith('statement.') ||
      type.startsWith('dunning.')) {
    return '/money';
  }
  return null;
}

/// An id that is safe to put in a route path (no separators, no query).
String? _safeId(Object? v) =>
    v is String && RegExp(r'^[A-Za-z0-9_-]{1,64}$').hasMatch(v) ? v : null;

String? _linkId(String? link, String segment) {
  if (link == null) return null;
  final parts = Uri.tryParse(link)?.pathSegments ?? const <String>[];
  final i = parts.indexOf(segment);
  if (i >= 0 && i + 1 < parts.length) return parts[i + 1];
  return null;
}
