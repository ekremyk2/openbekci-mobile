import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';

/// Published announcements first-page(s), pinned first, unread marked.
final announcementsProvider = StreamProvider<CacheState<List<Announcement>>>((
  ref,
) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Announcement>>(
    ref,
    key: 'org/${scope.orgId}/announcements',
    fetch: (api) async => [
      for (final a in await fetchPages<Announcement>((cursor) async {
        final page = await unwrap(
          () => api.operations.operationsListAnnouncements(
            orgId: scope.orgId,
            siteId: siteId,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        a.toJson(),
    ],
    decode: (j) => decodeList(j, Announcement.fromJson),
  );
});

/// Pinned first, then newest published first; archived and drafts never
/// reach residents but are dropped defensively.
List<Announcement> sortAnnouncements(Iterable<Announcement> items) {
  final list = [
    for (final a in items)
      if (a.status == AnnouncementStatusEnum.published ||
          a.status == AnnouncementStatusEnum.unknownDefaultOpenApi)
        a,
  ];
  int when(Announcement a) =>
      (a.publishedAt ?? a.createdAt).millisecondsSinceEpoch;
  list.sort((a, b) {
    if (a.pinned != b.pinned) return a.pinned ? -1 : 1;
    return when(b).compareTo(when(a));
  });
  return list;
}

final announcementDetailProvider =
    StreamProvider.family<CacheState<Announcement>, String>((ref, id) {
      final scope = ref.watch(scopeProvider);
      if (scope == null) return const Stream.empty();
      return watchCached<Announcement>(
        ref,
        key: 'org/${scope.orgId}/announcement/$id',
        fetch: (api) async => (await unwrap(
          () => api.operations.operationsGetAnnouncement(
            orgId: scope.orgId,
            announcementId: id,
          ),
        )).toJson(),
        decode: (j) =>
            Announcement.fromJson((j! as Map).cast<String, dynamic>()),
      );
    });

/// Sends the read receipt (O4) when an unread announcement is opened, and
/// refreshes the lists and the home counters.
Future<void> sendReadReceipt(
  WidgetRef ref,
  Announcement announcement, {
  required String orgId,
}) async {
  if (announcement.readAt != null) return;
  final api = ref.read(apiProvider);
  if (api == null) return;
  try {
    await unwrapVoid(
      () => api.operations.operationsMarkAnnouncementRead(
        orgId: orgId,
        announcementId: announcement.id,
      ),
    );
    ref
      ..invalidate(announcementsProvider)
      ..invalidate(announcementDetailProvider(announcement.id));
  } on Object {
    // Offline: the receipt is sent the next time it is opened.
  }
}
