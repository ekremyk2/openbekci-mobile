import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
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

/// Placeholder home for phase A: who is signed in, the linked units and any
/// unit claim still waiting for approval. Phase B replaces it with the
/// dashboard.
class HomeScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final me = ref.watch(meProvider);
    final claims = ref.watch(_pendingClaimsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.homeTitle),
        actions: [
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
          final pending = [
            for (final c in claims.value ?? const <UnitClaim>[])
              if (!data.occupancies.any((o) => o.unitId == c.unitId)) c,
          ];
          return Column(
            children: [
              if (state.isOffline) const OfflineBanner(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsetsDirectional.all(16),
                  children: [
                    Text(
                      l.homeWelcome(data.user.displayName),
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
                    if (data.occupancies.isEmpty && pending.isEmpty)
                      Text(l.homeNoUnits),
                    for (final o in data.occupancies)
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.home_outlined),
                          title: Text(o.unitLabel),
                          subtitle: Text(occupancyLabel(l, o.kind)),
                        ),
                      ),
                    const SizedBox(height: 24),
                    Text(
                      l.homePhaseNote,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

final _pendingClaimsProvider = FutureProvider<List<UnitClaim>>((ref) async {
  final claims = ref.watch(localClaimsProvider);
  // Re-read when a new claim was just made.
  ref.watch(lastClaimProvider);
  return claims == null ? const [] : await claims.read();
});
