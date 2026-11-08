import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/home/home_screen.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Minimal profile (phase A): who I am, which server, my units, sign out.
class ProfileScreen extends ConsumerWidget {
  const new({super.key});

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final l = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(l.profileSignOutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l.actionCancel),
          ),
          FilledButton(
            key: const Key('confirmSignOut'),
            onPressed: () => Navigator.pop(context, true),
            child: Text(l.actionSignOut),
          ),
        ],
      ),
    );
    if (ok ?? false) {
      await ref.read(sessionProvider).signOut();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final account = ref.watch(accountProvider).value;
    final me = ref.watch(meProvider).value;
    final data = me?.data;
    return Scaffold(
      appBar: AppBar(title: Text(l.profileTitle)),
      body: ListView(
        children: [
          if (me?.isOffline ?? false) const OfflineBanner(),
          if (data == null)
            const SkeletonList(rows: 3)
          else ...[
            ListTile(
              title: Text(l.profileName),
              subtitle: Text(data.user.displayName),
            ),
            if (data.user.phone != null)
              ListTile(
                title: Text(l.profilePhone),
                subtitle: Text(data.user.phone!),
              ),
            if (data.user.email != null)
              ListTile(
                title: Text(l.profileEmail),
                subtitle: Text(data.user.email!),
              ),
          ],
          ListTile(
            title: Text(l.profileServer),
            subtitle: Text(
              '${account?.instanceName ?? ''}\n${account?.serverOrigin ?? ''}',
            ),
            isThreeLine: true,
          ),
          if (data != null && data.organizations.isNotEmpty) ...[
            const Divider(),
            ListTile(title: Text(l.profileOrganizations)),
            for (final o in data.organizations) ListTile(title: Text(o.name)),
          ],
          if (data != null && data.occupancies.isNotEmpty) ...[
            const Divider(),
            ListTile(title: Text(l.profileUnits)),
            for (final o in data.occupancies)
              ListTile(
                title: Text(o.unitLabel),
                subtitle: Text(occupancyLabel(l, o.kind)),
              ),
          ],
          const Divider(),
          Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: OutlinedButton.icon(
              key: const Key('signOut'),
              icon: const Icon(Icons.logout),
              label: Text(l.actionSignOut),
              onPressed: () => _confirmSignOut(context, ref),
            ),
          ),
        ],
      ),
    );
  }
}
