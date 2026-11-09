import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';

/// `GET /v1/orgs/{org}/me/dashboard` with stale-while-revalidate.
final dashboardProvider = StreamProvider<CacheState<MeDashboard>>((ref) {
  final scope = ref.watch(scopeProvider);
  if (scope == null) return const Stream.empty();
  return watchCached<MeDashboard>(
    ref,
    key: 'org/${scope.orgId}/dashboard',
    fetch: (api) async => (await unwrap(
      () => api.dashboards.dashboardsGetMyDashboard(
        orgId: scope.orgId,
        siteId: scope.siteId,
      ),
    )).toJson(),
    decode: (j) => MeDashboard.fromJson((j! as Map).cast<String, dynamic>()),
  );
});

/// The statements the user may open (see [statementTargets]).
final statementTargetsProvider = Provider<List<StatementTarget>>((ref) {
  final dash = ref.watch(dashboardProvider).value?.data;
  final ctx = ref.watch(orgContextProvider);
  return statementTargets(
    sides: dash?.sides ?? const [],
    occupancies: ctx?.occupancies ?? const [],
  );
});

/// The user's unit claims that are still waiting for approval (GET
/// /v1/me/unit-claims); empty when the call fails.
final pendingClaimsProvider = FutureProvider<List<UnitClaim>>((ref) async {
  // Re-read when a new claim was just made.
  ref.watch(lastClaimProvider);
  try {
    return await ref.watch(joinRepositoryProvider).myClaims();
  } on Object {
    return const [];
  }
});
