import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/notifications/application/notifications_providers.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// In-app notification center with read state (O5).
class NotificationsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final unread = ref.watch(unreadCountProvider).value?.data ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.notificationsTitle),
        actions: [
          IconButton(
            key: const Key('markAllRead'),
            tooltip: l.notificationsMarkAll,
            icon: const Icon(Icons.done_all),
            onPressed: unread == 0
                ? null
                : () async {
                    final messenger = ScaffoldMessenger.of(context);
                    try {
                      await markAllNotificationsRead(ref);
                    } on Object catch (e) {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text(errorMessage(l, AppError.from(e))),
                        ),
                      );
                    }
                  },
          ),
          IconButton(
            key: const Key('openMutes'),
            tooltip: l.notificationsSettings,
            icon: const Icon(Icons.tune),
            onPressed: () => context.push('/more/notifications/settings'),
          ),
        ],
      ),
      body: CachedView<List<AppNotification>>(
        provider: notificationsProvider,
        isEmpty: (list) => list.isEmpty,
        emptyIcon: Icons.notifications_none,
        emptyMessage: l.notificationsEmpty,
        padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
        builder: (context, list) => [
          for (final n in list)
            ListTile(
              key: Key('notification_${n.id}'),
              leading: n.readAt == null
                  ? Icon(
                      Icons.circle,
                      size: 12,
                      semanticLabel: l.announcementUnread,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : const Icon(Icons.circle_outlined, size: 12),
              title: Text(
                notificationTypeLabel(l, n.type),
                style: n.readAt == null
                    ? const TextStyle(fontWeight: FontWeight.bold)
                    : null,
              ),
              subtitle: SiteDate(
                instant: n.createdAt,
                timezone: ctx?.timezone ?? 'UTC',
                withTime: true,
              ),
              onTap: () async {
                final org = ref.read(scopeProvider)?.orgId;
                final route = org == null
                    ? null
                    : routeForNotification(n, orgId: org);
                if (n.readAt == null) await markNotificationRead(ref, n.id);
                if (route != null && context.mounted) {
                  if (route.split('/').length > 2) {
                    unawaited(context.push(route));
                  } else {
                    context.go(route);
                  }
                }
              },
            ),
        ],
      ),
    );
  }
}

/// Mutes per non-essential type; sign-in codes and invitations cannot be
/// muted.
class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() => _MutesState();
}

class _MutesState extends ConsumerState<NotificationSettingsScreen> {
  AppError? _error;
  bool _busy = false;

  Future<void> _toggle(NotificationMutes mutes, String type, bool muted) async {
    final next = {...mutes.mutedTypes};
    if (muted) {
      next.add(type);
    } else {
      next.remove(type);
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await setNotificationMutes(ref, next.toList()..sort());
    } on Object catch (e) {
      if (mounted) setState(() => _error = AppError.from(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final async = ref.watch(notificationMutesProvider);
    final mutes = async.value?.data;
    return Scaffold(
      appBar: AppBar(title: Text(l.notificationsSettings)),
      body: mutes == null
          ? (async.value?.error != null
                ? ErrorState(
                    error: async.value!.error!,
                    onRetry: () => ref.invalidate(notificationMutesProvider),
                  )
                : const SkeletonList())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.all(16),
                  child: Text(l.notificationsMutesBody),
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      errorMessage(l, _error!),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                for (final type in mutes.availableTypes) _row(l, mutes, type),
              ],
            ),
    );
  }

  Widget _row(AppLocalizations l, NotificationMutes mutes, String type) {
    final unmutable = mutes.unmutableTypes.contains(type);
    final muted = mutes.mutedTypes.contains(type);
    return SwitchListTile(
      key: Key('mute_$type'),
      title: Text(notificationTypeLabel(l, type)),
      subtitle: unmutable ? Text(l.notificationsCannotMute) : null,
      // On = I get these.
      value: unmutable || !muted,
      onChanged: unmutable || _busy ? null : (on) => _toggle(mutes, type, !on),
    );
  }
}
