import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/money/data/money_repository.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';

final moneyRepositoryProvider = Provider<MoneyRepository?>((ref) {
  final api = ref.watch(apiProvider);
  return api == null ? null : MoneyRepository(api);
});

/// Arguments of one statement read.
typedef StatementQuery = ({
  String unitId,
  String kind,
  String? from,
  String? to,
});

/// Statement of one debtor side and period, cached per query.
final statementProvider =
    StreamProvider.family<CacheState<Statement>, StatementQuery>((ref, q) {
      final scope = ref.watch(scopeProvider);
      if (scope == null) return const Stream.empty();
      return watchCached<Statement>(
        ref,
        key:
            'org/${scope.orgId}/statement/${q.unitId}/${q.kind}/'
            '${q.from ?? '-'}/${q.to ?? '-'}',
        fetch: (api) async => (await MoneyRepository(api).statement(
          orgId: scope.orgId,
          unitId: q.unitId,
          kind: q.kind,
          from: q.from,
          to: q.to,
        )).toJson(),
        decode: (j) => Statement.fromJson((j! as Map).cast<String, dynamic>()),
      );
    });

/// Payments of one side (all statuses): history and the declared ones.
final paymentsProvider =
    StreamProvider.family<CacheState<List<Payment>>, StatementTarget>((
      ref,
      target,
    ) {
      final scope = ref.watch(scopeProvider);
      final siteId = scope?.siteId;
      if (scope == null || siteId == null) return const Stream.empty();
      return watchCached<List<Payment>>(
        ref,
        key: 'org/${scope.orgId}/payments/${target.id}',
        fetch: (api) async => [
          for (final p in await MoneyRepository(api).payments(
            orgId: scope.orgId,
            siteId: siteId,
            unitId: target.unitId,
            kind: target.kind,
          ))
            p.toJson(),
        ],
        decode: (j) => decodeList(j, Payment.fromJson),
      );
    });

/// What the server offers for paying (plan 7.1 Pay: "two paths, chosen by
/// what the server offers"). Card checkout arrives in phase D; its entry
/// point stays hidden until the instance advertises it.
class PaymentCapabilities {
  const new({required this.checkout});

  factory fromPacks(Iterable<String> packs) =>
      PaymentCapabilities(checkout: packs.contains(checkoutPack));

  /// The pack id under which an instance advertises provider checkout
  /// (`packs` of discovery and `GET /v1/instance`).
  static const checkoutPack = 'payments.checkout';

  static const none = PaymentCapabilities(checkout: false);

  final bool checkout;
}

final instanceDocProvider = FutureProvider<Instance?>((ref) async {
  final api = ref.watch(apiProvider);
  if (api == null) return null;
  try {
    return await unwrap(api.instance.instanceGetInstance);
  } on Object {
    return null;
  }
});

final paymentCapabilitiesProvider = Provider<PaymentCapabilities>((ref) {
  final doc = ref.watch(instanceDocProvider).value;
  return doc == null
      ? PaymentCapabilities.none
      : PaymentCapabilities.fromPacks(doc.packs);
});
