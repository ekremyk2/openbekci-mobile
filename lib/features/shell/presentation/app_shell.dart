import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/features/profile/application/profile_providers.dart';
import 'package:openbekci_mobile/features/push/application/push_service.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Branch order of the shell: Home, Money, Tickets, More.
abstract final class Branches {
  static const home = 0;
  static const money = 1;
  static const tickets = 2;
  static const more = 3;
}

/// The branches the user sees. **Money is hidden entirely for people without
/// money rights** (mobile plan section 11).
List<int> visibleBranches({required bool showMoney}) => [
  Branches.home,
  if (showMoney) Branches.money,
  Branches.tickets,
  Branches.more,
];

/// Bottom navigation: Home, Money, Tickets, More.
class AppShell extends ConsumerWidget {
  const new({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final showMoney = showMoneyTab(ref.watch(statementTargetsProvider));
    // Money is hidden while the dashboard is still unknown only if the user
    // is not on it; never strand someone on a hidden branch.
    final moneyDecided = ref.watch(
      dashboardProvider.select((a) => a.value?.data != null),
    );
    final visible = visibleBranches(
      showMoney: showMoney || (!moneyDecided && shell.currentIndex == 1),
    );
    final unread = ref.watch(displayUnreadProvider);
    final selected = visible.indexOf(shell.currentIndex);
    if (selected < 0) {
      scheduleMicrotask(() => shell.goBranch(Branches.home));
    }
    NavigationDestination dest(int branch) => switch (branch) {
      Branches.home => NavigationDestination(
        key: const Key('navHome'),
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: l.navHome,
      ),
      Branches.money => NavigationDestination(
        key: const Key('navMoney'),
        icon: const Icon(Icons.account_balance_wallet_outlined),
        selectedIcon: const Icon(Icons.account_balance_wallet),
        label: l.navMoney,
      ),
      Branches.tickets => NavigationDestination(
        key: const Key('navTickets'),
        icon: const Icon(Icons.build_outlined),
        selectedIcon: const Icon(Icons.build),
        label: l.navTickets,
      ),
      _ => NavigationDestination(
        key: const Key('navMore'),
        icon: Badge(
          isLabelVisible: unread > 0,
          label: Text('$unread'),
          child: const Icon(Icons.menu),
        ),
        label: l.navMore,
      ),
    };
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected < 0 ? 0 : selected,
        onDestinationSelected: (i) => shell.goBranch(
          visible[i],
          initialLocation: visible[i] == shell.currentIndex,
        ),
        destinations: [for (final b in visible) dest(b)],
      ),
    );
  }
}

/// The More tab: everything that is not a main tab.
class MoreScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final unread = ref.watch(displayUnreadProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.navMore)),
      body: ListView(
        children: [
          ListTile(
            key: const Key('moreAnnouncements'),
            leading: const Icon(Icons.campaign_outlined),
            title: Text(l.announcementsTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/announcements'),
          ),
          ListTile(
            key: const Key('moreDocuments'),
            leading: const Icon(Icons.folder_outlined),
            title: Text(l.documentsTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/documents'),
          ),
          ListTile(
            key: const Key('moreNotifications'),
            leading: Badge(
              isLabelVisible: unread > 0,
              label: Text('$unread'),
              child: const Icon(Icons.notifications_outlined),
            ),
            title: Text(l.notificationsTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/notifications'),
          ),
          const Divider(),
          ListTile(
            key: const Key('moreBookings'),
            leading: const Icon(Icons.event_available_outlined),
            title: Text(l.homeBookings),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/bookings'),
          ),
          ListTile(
            key: const Key('moreVisitors'),
            leading: const Icon(Icons.badge_outlined),
            title: Text(l.homeVisitors),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/visitors'),
          ),
          ListTile(
            key: const Key('moreParcels'),
            leading: const Icon(Icons.inventory_2_outlined),
            title: Text(l.parcelsTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/parcels'),
          ),
          ListTile(
            key: const Key('moreAssembly'),
            leading: const Icon(Icons.groups_outlined),
            title: Text(l.assemblyTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/more/assembly'),
          ),
          const Divider(),
          ListTile(
            key: const Key('moreProfile'),
            leading: const Icon(Icons.account_circle_outlined),
            title: Text(l.navProfile),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/profile'),
          ),
        ],
      ),
    );
  }
}

/// Covers the app with a lock screen while the app lock is engaged.
class AppLockGate extends ConsumerStatefulWidget {
  const new({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate>
    with WidgetsBindingObserver {
  bool _prompting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    ref.read(appLockProvider.notifier).lifecycle(state);
  }

  Future<void> _unlock() async {
    if (_prompting) return;
    _prompting = true;
    try {
      final l = AppLocalizations.of(context);
      await ref.read(appLockProvider.notifier).unlock(l.lockReason);
    } finally {
      _prompting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lock = ref.watch(appLockProvider);
    final signedIn = ref.watch(accountProvider).value != null;
    final show = signedIn && lock.enabled && lock.locked;
    if (show) scheduleMicrotask(_unlock);
    return Stack(
      children: [
        widget.child,
        if (show)
          Positioned.fill(
            child: Builder(
              builder: (context) {
                final l = AppLocalizations.of(context);
                return Scaffold(
                  key: const Key('lockScreen'),
                  body: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.lock_outline, size: 56),
                        const SizedBox(height: 12),
                        Text(
                          l.lockedTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          key: const Key('unlockButton'),
                          onPressed: _unlock,
                          child: Text(l.lockUnlock),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
