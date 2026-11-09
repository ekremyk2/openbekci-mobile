import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/onboarding/data/join_repository.dart';

/// Version gate result for the pending server (null while none is pending).
final gateProvider = Provider<VersionGate?>((ref) {
  final server = ref.watch(pendingServerProvider);
  if (server == null) return null;
  return checkVersionGate(
    server.document,
    appVersion: ref.watch(appInfoProvider).version,
  );
});

/// Join repository for the current server; signed-in claims use the bearer
/// client.
final joinRepositoryProvider = Provider<JoinRepository>((ref) {
  final origin = ref.watch(currentOriginProvider);
  if (origin == null) {
    throw StateError('joinRepositoryProvider needs a server');
  }
  return ApiJoinRepository(
    anonymous: ref.watch(anonymousApiProvider(origin)),
    authenticated: ref.watch(apiProvider),
  );
});

/// The most recent unit claim of this session (for the waiting screen).
class LastClaimController extends Notifier<UnitClaim?> {
  @override
  UnitClaim? build() => null;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void set(UnitClaim? claim) => state = claim;
}

final lastClaimProvider = NotifierProvider<LastClaimController, UnitClaim?>(
  LastClaimController.new,
);
