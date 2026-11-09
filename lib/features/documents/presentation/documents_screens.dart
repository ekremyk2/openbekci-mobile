import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/files/files.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/documents/application/documents_providers.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';
import 'package:pdfrx/pdfrx.dart';

/// Renders PDF bytes inline. A seam so widget tests do not need the native
/// PDF engine.
typedef PdfViewBuilder = Widget Function(Uint8List bytes, String name);

final pdfViewBuilderProvider = Provider<PdfViewBuilder>(
  (ref) =>
      (bytes, name) => PdfViewer.data(bytes, sourceName: name),
);

/// What the PDF screen shows (passed as the route's `extra`).
class PdfArgs {
  const new({required this.bytes, required this.name});

  final Uint8List bytes;
  final String name;
}

/// Downloads a file and opens it: a PDF inline, anything else through the
/// share sheet.
Future<void> openFileById(
  BuildContext context,
  WidgetRef ref, {
  required String fileId,
  required String name,
  required String mime,
}) async {
  final l = AppLocalizations.of(context);
  final messenger = ScaffoldMessenger.of(context);
  final router = GoRouter.of(context);
  final repo = ref.read(filesRepositoryProvider);
  final ctx = ref.read(orgContextProvider);
  if (repo == null || ctx == null) return;
  messenger.showSnackBar(SnackBar(content: Text(l.documentOpening)));
  try {
    final bytes = await repo.content(orgId: ctx.orgId, fileId: fileId);
    messenger.hideCurrentSnackBar();
    if (isPdf(mime, name)) {
      await router.push<void>(
        '/more/pdf',
        extra: PdfArgs(bytes: bytes, name: name),
      );
    } else {
      await ref
          .read(shareServiceProvider)
          .shareFile(bytes: bytes, filename: name, mime: mime);
    }
  } on Object catch (e) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
  }
}

/// Documents: the site's folders as served, the unit's private folder, and
/// generated documents where the server filed them (O8).
class DocumentsScreen extends ConsumerWidget {
  const new({this.folderId, super.key});

  final String? folderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final foldersAsync = ref.watch(foldersProvider);
    final folders = foldersAsync.value?.data ?? const <Folder>[];
    final level = folderLevel(folders, folderId);
    final title = level.folder?.name ?? l.documentsTitle;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: foldersAsync.value?.data == null
          ? (foldersAsync.value?.error != null
                ? ErrorState(
                    error: foldersAsync.value!.error!,
                    onRetry: () => ref.invalidate(foldersProvider),
                  )
                : const SkeletonList())
          : _Contents(folderId: folderId, level: level),
    );
  }
}

class _Contents extends ConsumerWidget {
  const new({required this.folderId, required this.level});

  final String? folderId;
  final FolderLevel level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    // The top level of a caller without folders (a former resident) lists the
    // documents addressed to them.
    final listDocs = folderId != null || level.children.isEmpty;
    final docs = documentsProvider(folderId);
    Widget folderTile(Folder f) => Card(
      key: Key('folder_${f.id}'),
      child: ListTile(
        leading: Icon(
          f.kind == FolderKindEnum.unit
              ? Icons.folder_special_outlined
              : Icons.folder_outlined,
        ),
        title: Text(f.name),
        subtitle: f.kind == FolderKindEnum.unit
            ? Text(folderKindLabel(l, f.kind))
            : null,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/more/documents/folder/${f.id}'),
      ),
    );
    if (!listDocs) {
      return ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [for (final f in level.children) folderTile(f)],
      );
    }
    return CachedView<List<Document>>(
      provider: docs,
      isEmpty: (list) => list.isEmpty && level.children.isEmpty,
      emptyIcon: Icons.folder_open_outlined,
      emptyMessage: l.documentsEmpty,
      builder: (context, list) => [
        for (final f in level.children) folderTile(f),
        for (final d in list)
          Card(
            key: Key('document_${d.id}'),
            child: ListTile(
              leading: Icon(
                isPdf(d.mime, d.title)
                    ? Icons.picture_as_pdf_outlined
                    : Icons.insert_drive_file_outlined,
              ),
              title: Text(d.title),
              subtitle: Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SiteDate(
                    instant: d.createdAt,
                    timezone: ctx?.timezone ?? 'UTC',
                  ),
                  if (d.source_ == DocumentSource_Enum.generated)
                    Pill(l.documentGenerated),
                ],
              ),
              trailing: IconButton(
                tooltip: l.documentShare,
                icon: const Icon(Icons.share_outlined),
                onPressed: () => _share(context, ref, d),
              ),
              onTap: () => openFileById(
                context,
                ref,
                fileId: d.fileId,
                name: d.title,
                mime: d.mime,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _share(BuildContext context, WidgetRef ref, Document d) async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final repo = ref.read(filesRepositoryProvider);
    final ctx = ref.read(orgContextProvider);
    if (repo == null || ctx == null) return;
    try {
      final bytes = await repo.content(orgId: ctx.orgId, fileId: d.fileId);
      final name = d.title.contains('.') ? d.title : '${d.title}.pdf';
      await ref
          .read(shareServiceProvider)
          .shareFile(bytes: bytes, filename: name, mime: d.mime);
    } on Object catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
    }
  }
}

/// A PDF shown inline, with a share button.
class PdfScreen extends ConsumerWidget {
  const new({required this.args, super.key});

  final PdfArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        actions: [
          IconButton(
            key: const Key('sharePdfFile'),
            tooltip: l.documentShare,
            icon: const Icon(Icons.share_outlined),
            onPressed: () => ref
                .read(shareServiceProvider)
                .shareFile(
                  bytes: args.bytes,
                  filename: args.name.toLowerCase().endsWith('.pdf')
                      ? args.name
                      : '${args.name}.pdf',
                  mime: 'application/pdf',
                ),
          ),
        ],
      ),
      body: ref.watch(pdfViewBuilderProvider)(args.bytes, args.name),
    );
  }
}
