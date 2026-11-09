import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/features/announcements/application/announcements_providers.dart';
import 'package:openbekci_mobile/features/documents/presentation/documents_screens.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// One-way announcements: pinned first, unread marked, no comments (O4).
class AnnouncementsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.announcementsTitle)),
      body: CachedView<List<Announcement>>(
        provider: announcementsProvider,
        isEmpty: (list) => sortAnnouncements(list).isEmpty,
        emptyIcon: Icons.campaign_outlined,
        emptyMessage: l.announcementsEmpty,
        builder: (context, list) => [
          for (final a in sortAnnouncements(list))
            Card(
              key: Key('announcement_${a.id}'),
              child: ListTile(
                leading: a.readAt == null
                    ? Semantics(
                        label: l.announcementUnread,
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : const Icon(Icons.circle_outlined, size: 12),
                title: Text(
                  a.title,
                  style: a.readAt == null
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : null,
                ),
                subtitle: Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (a.pinned) Pill(l.announcementPinned),
                    if (a.publishedAt != null)
                      SiteDate(
                        instant: a.publishedAt,
                        timezone: ctx?.timezone ?? 'UTC',
                      ),
                  ],
                ),
                onTap: () => context.push('/more/announcements/${a.id}'),
              ),
            ),
        ],
      ),
    );
  }
}

/// Announcement with Markdown body and attachments; the read receipt is sent
/// when it is opened.
class AnnouncementDetailScreen extends ConsumerStatefulWidget {
  const new({required this.announcementId, super.key});

  final String announcementId;

  @override
  ConsumerState<AnnouncementDetailScreen> createState() => _DetailState();
}

class _DetailState extends ConsumerState<AnnouncementDetailScreen> {
  bool _receiptSent = false;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final provider = announcementDetailProvider(widget.announcementId);
    // Opening is what counts: send the receipt once the announcement is on
    // screen, whether it came from the cache or the server.
    ref.listen(provider, (_, next) {
      final a = next.value?.data;
      if (a != null && !_receiptSent && ctx != null) {
        _receiptSent = true;
        unawaited(sendReadReceipt(ref, a, orgId: ctx.orgId));
      }
    });
    final current = ref.watch(provider).value?.data;
    if (current != null && !_receiptSent && ctx != null) {
      _receiptSent = true;
      unawaited(
        Future.microtask(() => sendReadReceipt(ref, current, orgId: ctx.orgId)),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(l.announcementTitle)),
      body: ctx == null
          ? const SkeletonList()
          : CachedView<Announcement>(
              provider: provider,
              builder: (context, a) => [
                Text(
                  a.title,
                  key: const Key('announcementTitle'),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                if (a.publishedAt != null)
                  SiteDate(
                    instant: a.publishedAt,
                    timezone: ctx.timezone,
                    withTime: true,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                const SizedBox(height: 12),
                MarkdownBody(
                  key: const Key('announcementBody'),
                  data: a.bodyMd,
                  selectable: true,
                  onTapLink: (text, href, title) async {
                    final uri = href == null ? null : Uri.tryParse(href);
                    if (uri != null &&
                        (uri.scheme == 'https' || uri.scheme == 'http')) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                ),
                if (a.attachments.isNotEmpty) ...[
                  SectionTitle(l.announcementAttachments),
                  for (final att in a.attachments)
                    Card(
                      child: ListTile(
                        key: Key('attachment_${att.id}'),
                        leading: const Icon(Icons.attach_file),
                        title: Text(att.name),
                        subtitle: Text(_size(att.size)),
                        onTap: () => openFileById(
                          context,
                          ref,
                          fileId: att.id,
                          name: att.name,
                          mime: att.mime,
                        ),
                      ),
                    ),
                ],
              ],
            ),
    );
  }

  String _size(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(0)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
