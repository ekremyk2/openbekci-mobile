import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/push/application/push_service.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Localized label of an occupancy kind; unknown values (an additive server
/// release) fall back to a neutral "Resident", never a crash.
String occupancyLabel(AppLocalizations l, MeOccupancyKindEnum kind) =>
    switch (kind) {
      MeOccupancyKindEnum.owner => l.occupancyOwner,
      MeOccupancyKindEnum.tenant => l.occupancyTenant,
      MeOccupancyKindEnum.household => l.occupancyHousehold,
      MeOccupancyKindEnum.formerOccupant => l.occupancyFormer,
      MeOccupancyKindEnum.unknownDefaultOpenApi => l.occupancyUnknown,
    };

/// Home of one organization (mobile plan 7.1): balance and next due date per
/// side the user may see, unread announcements, open tickets, the
/// placeholders of phase C and the next assembly.
class HomeScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final me = ref.watch(meProvider);
    final ctx = ref.watch(orgContextProvider);
    final unread = ref.watch(displayUnreadProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsetsDirectional.all(14),
          child: BrandLogo(height: 28),
        ),
        title: ctx == null
            ? Text(l.homeTitle)
            : OrgSwitcher(orgContext: ctx, key: const Key('orgSwitcher')),
        actions: [
          IconButton(
            key: const Key('openNotifications'),
            tooltip: l.navNotifications,
            icon: Badge(
              isLabelVisible: unread > 0,
              label: Text('$unread'),
              child: const Icon(Icons.notifications_outlined),
            ),
            onPressed: () => context.push('/more/notifications'),
          ),
          IconButton(
            key: const Key('openProfile'),
            tooltip: l.navProfile,
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => context.push('/profile'),
          ),
        ],
      ),
      body: me.when(
        loading: () => const SkeletonList(),
        error: (e, _) => const SkeletonList(),
        data: (state) {
          final data = state.data;
          if (data == null) {
            final error = state.error;
            return error == null
                ? const SkeletonList()
                : ErrorState(
                    error: error,
                    onRetry: () => ref.invalidate(meProvider),
                  );
          }
          final dash = ref.watch(dashboardProvider).value;
          // No dashboard to show (the user is in no organization yet, or the
          // server has no summary for them): the units and claims of phase A
          // stay visible, with the reason underneath.
          if (ctx == null || (dash?.data == null && dash?.error != null)) {
            return _NoOrganization(
              me: data,
              offline: state.isOffline,
              error: dash?.error,
              onRetry: () => ref.invalidate(dashboardProvider),
            );
          }
          return CachedView<MeDashboard>(
            provider: dashboardProvider,
            header: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
              child: Text(
                l.homeWelcome(data.user.displayName),
                key: const Key('homeWelcome'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            builder: (context, dash) => _dashboardRows(context, ref, ctx, dash),
          );
        },
      ),
    );
  }
}

List<Widget> _dashboardRows(
  BuildContext context,
  WidgetRef ref,
  OrgContext ctx,
  MeDashboard dash,
) {
  final l = AppLocalizations.of(context);
  final claims = ref.watch(pendingClaimsProvider).value ?? const <UnitClaim>[];
  final pending = [
    for (final c in claims)
      if (!ctx.me.occupancies.any((o) => o.unitId == c.unitId)) c,
  ];
  final nextMeeting = dash.upcomingMeetings.isEmpty
      ? null
      : dash.upcomingMeetings.first;
  return [
    for (final c in pending)
      Card(
        key: Key('pendingClaim_${c.id}'),
        child: ListTile(
          leading: const Icon(Icons.hourglass_top),
          title: Text(l.homePendingClaim(c.unitDoorNumber)),
        ),
      ),
    if (ctx.occupancies.isEmpty && pending.isEmpty)
      Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 12),
        child: Text(l.homeNoUnits),
      ),
    for (final s in dash.sides) _SideCard(side: s, ctx: ctx),
    if (dash.sides.isEmpty && ctx.occupancies.isNotEmpty)
      Card(
        child: ListTile(
          key: const Key('noMoneyNote'),
          leading: const Icon(Icons.lock_outline),
          title: Text(l.homeNoMoneyAccess),
        ),
      ),
    SectionTitle(l.homeSectionNews),
    _CountTile(
      key: const Key('tileAnnouncements'),
      icon: Icons.campaign_outlined,
      label: l.homeUnreadAnnouncements,
      count: dash.unreadAnnouncements,
      onTap: () => context.push('/more/announcements'),
    ),
    _CountTile(
      key: const Key('tileTickets'),
      icon: Icons.build_outlined,
      label: l.homeOpenTickets,
      count: dash.myOpenTickets,
      onTap: () => context.go('/tickets'),
    ),
    SectionTitle(l.homeSectionCommunity),
    _CountTile(
      key: const Key('tileBookings'),
      icon: Icons.event_available_outlined,
      label: l.homeBookings,
      onTap: () => context.push('/more/bookings'),
    ),
    _CountTile(
      key: const Key('tileVisitors'),
      icon: Icons.badge_outlined,
      label: l.homeVisitors,
      count: dash.pendingVisitorApprovals,
      onTap: () => context.push('/more/visitors'),
    ),
    _CountTile(
      key: const Key('tileParcels'),
      icon: Icons.inventory_2_outlined,
      label: l.homeParcels,
      count: dash.waitingDeliveries,
      onTap: () => context.push('/more/parcels'),
    ),
    SectionTitle(l.homeNextAssembly),
    if (nextMeeting == null)
      Text(l.homeNoAssembly, key: const Key('noAssembly'))
    else
      Card(
        key: const Key('nextAssembly'),
        child: ListTile(
          leading: const Icon(Icons.groups_outlined),
          title: Text(nextMeeting.title ?? l.homeAssemblyUntitled),
          subtitle: SiteDate(
            instant: nextMeeting.scheduledAt,
            timezone: ctx.timezone,
            withTime: true,
          ),
          onTap: () => context.push('/more/assembly/${nextMeeting.id}'),
        ),
      ),
  ];
}

class _SideCard extends StatelessWidget {
  const new({required this.side, required this.ctx});

  final MySide side;
  final OrgContext ctx;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final due = side.nextDueDate;
    final hasFee = side.accruedLateFee.amount > 0;
    return Card(
      key: Key('side_${side.unitId}_${side.debtorKind.value}'),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () =>
            context.go('/money?side=${side.unitId}:${side.debtorKind.value}'),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.sideCardTitle(side.unitDoorNumber),
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Pill(sideLabel(l, side.debtorKind.value)),
                ],
              ),
              const SizedBox(height: 8),
              Text(l.balanceToday, style: theme.textTheme.bodySmall),
              MoneyText(
                amountMinor: side.total.amount,
                currency: side.total.currency,
                style: theme.textTheme.headlineMedium,
              ),
              if (hasFee)
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Text(l.includesLateFee, style: theme.textTheme.bodySmall),
                    MoneyText(
                      amountMinor: side.accruedLateFee.amount,
                      currency: side.accruedLateFee.currency,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              if (side.credit.amount > 0)
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Text(l.creditLabel, style: theme.textTheme.bodySmall),
                    MoneyText(
                      amountMinor: side.credit.amount,
                      currency: side.credit.currency,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              if (due == null)
                Text(l.nextDueNone, style: theme.textTheme.bodyMedium)
              else
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Text(l.nextDue, style: theme.textTheme.bodyMedium),
                    SiteDate(
                      isoDate: _iso(due),
                      timezone: ctx.timezone,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String _iso(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

class _CountTile extends StatelessWidget {
  const new({
    required this.icon,
    required this.label,
    this.count,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final int? count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        trailing: count == null ? null : CountBadge(count!),
        onTap: onTap,
      ),
    );
  }
}

/// Organization name in the app bar; a menu to switch when there are several.
class OrgSwitcher extends ConsumerWidget {
  const new({required this.orgContext, super.key});

  final OrgContext orgContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final orgs = orgContext.me.organizations;
    final title = Text(orgContext.org.name, overflow: TextOverflow.ellipsis);
    if (orgs.length < 2) return title;
    return PopupMenuButton<String>(
      tooltip: l.switchOrganization,
      onSelected: (id) => ref.read(selectedOrgProvider.notifier).select(id),
      itemBuilder: (_) => [
        for (final o in orgs)
          CheckedPopupMenuItem<String>(
            value: o.id,
            checked: o.id == orgContext.orgId,
            child: Text(o.name),
          ),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: title),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

/// A signed-in user who belongs to no organization yet: the units and the
/// pending claims of phase A.
class _NoOrganization extends ConsumerWidget {
  const new({
    required this.me,
    required this.offline,
    this.error,
    this.onRetry,
  });

  final Me me;
  final bool offline;
  final AppError? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final claims =
        ref.watch(pendingClaimsProvider).value ?? const <UnitClaim>[];
    final pending = [
      for (final c in claims)
        if (!me.occupancies.any((o) => o.unitId == c.unitId)) c,
    ];
    return Column(
      children: [
        if (offline) const OfflineBanner(),
        Expanded(
          child: ListView(
            padding: const EdgeInsetsDirectional.all(16),
            children: [
              Text(
                l.homeWelcome(me.user.displayName),
                key: const Key('homeWelcome'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              for (final c in pending)
                Card(
                  key: Key('pendingClaim_${c.id}'),
                  child: ListTile(
                    leading: const Icon(Icons.hourglass_top),
                    title: Text(l.homePendingClaim(c.unitDoorNumber)),
                  ),
                ),
              if (me.occupancies.isEmpty && pending.isEmpty)
                Text(l.homeNoUnits),
              for (final o in me.occupancies)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: Text(o.unitLabel),
                    subtitle: Text(occupancyLabel(l, o.kind)),
                  ),
                ),
              if (error != null && !offline)
                SizedBox(
                  height: 320,
                  child: ErrorState(error: error!, onRetry: onRetry),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
