import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/scope.dart';

/// Every folder the server shows the caller (visibility already applied),
/// site folders and the unit's private folder. A caller without folder access
/// (a former resident sees only documents addressed to them) gets none.
final foldersProvider = StreamProvider<CacheState<List<Folder>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Folder>>(
    ref,
    key: 'org/${scope.orgId}/folders',
    fetch: (api) async {
      try {
        final folders = await fetchPages<Folder>((cursor) async {
          final page = await unwrap(
            () => api.operations.operationsListFolders(
              orgId: scope.orgId,
              siteId: siteId,
              cursor: cursor,
            ),
          );
          return (items: page.items, next: page.nextCursor);
        });
        return [for (final f in folders) f.toJson()];
      } on AppError catch (e) {
        if (e.status == 403) return const <Object?>[];
        rethrow;
      }
    },
    decode: (j) => decodeList(j, Folder.fromJson),
  );
});

/// Documents of one folder; `null` lists the documents addressed to the
/// caller regardless of folder (former residents).
final documentsProvider =
    StreamProvider.family<CacheState<List<Document>>, String?>((ref, folderId) {
      final scope = ref.watch(scopeProvider);
      final siteId = scope?.siteId;
      if (scope == null || siteId == null) return const Stream.empty();
      return watchCached<List<Document>>(
        ref,
        key: 'org/${scope.orgId}/documents/${folderId ?? '-'}',
        fetch: (api) async => [
          for (final d in await fetchPages<Document>((cursor) async {
            final page = await unwrap(
              () => api.operations.operationsListDocuments(
                orgId: scope.orgId,
                siteId: siteId,
                folderId: folderId,
                cursor: cursor,
              ),
            );
            return (items: page.items, next: page.nextCursor);
          }))
            d.toJson(),
        ],
        decode: (j) => decodeList(j, Document.fromJson),
      );
    });

/// The folder tree seen from one level.
@immutable
class FolderLevel {
  const new({
    required this.folder,
    required this.children,
    required this.trail,
  });

  final Folder? folder;
  final List<Folder> children;
  final List<FolderCrumb> trail;
}

/// Children of [parentId] (`null` = top level) among [all], site folders
/// before unit folders, then by name.
FolderLevel folderLevel(List<Folder> all, String? parentId) {
  Folder? current;
  for (final f in all) {
    if (f.id == parentId) current = f;
  }
  final children =
      [
        for (final f in all)
          if (f.parentId == parentId) f,
      ]..sort((a, b) {
        final ka = a.kind == FolderKindEnum.unit ? 1 : 0;
        final kb = b.kind == FolderKindEnum.unit ? 1 : 0;
        if (ka != kb) return ka.compareTo(kb);
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
  return FolderLevel(
    folder: current,
    children: children,
    trail: current?.breadcrumb ?? const [],
  );
}

/// A PDF opens inline; anything else goes to the share sheet.
bool isPdf(String mime, String name) =>
    mime.toLowerCase() == 'application/pdf' ||
    name.toLowerCase().endsWith('.pdf');
