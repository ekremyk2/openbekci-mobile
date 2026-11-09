import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
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
        fetch: (api) async {
          final ctx = ref.read(orgContextProvider);
          final siteId = scope.siteId;
          final timezone = ctx?.timezone ?? 'UTC';
          final id = '${q.unitId}:${q.kind}';
          final former = ref
              .read(statementTargetsProvider)
              .any((t) => t.id == id && t.former);
          final statement = siteId == null
              ? await MoneyRepository(api).statement(
                  orgId: scope.orgId,
                  unitId: q.unitId,
                  kind: q.kind,
                  from: q.from,
                  to: q.to,
                )
              : await MoneyRepository(api).statementOrLedger(
                  orgId: scope.orgId,
                  siteId: siteId,
                  currency: ctx?.currency ?? 'TRY',
                  today: _isoDate(siteToday(timezone)),
                  target: StatementTarget(
                    unitId: q.unitId,
                    unitLabel: '',
                    kind: q.kind,
                    former: former,
                  ),
                  from: q.from,
                  to: q.to,
                );
          return statement.toJson();
        },
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

/// Whether "Pay by card" exists for the site (`payments.card.available` of
/// the site settings); any failure hides the button.
final cardAvailableProvider = FutureProvider<bool>((ref) async {
  final api = ref.watch(apiProvider);
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (api == null || siteId == null) return false;
  try {
    final s = await unwrap(
      () => api.tenancy.tenancyGetSiteSettings(
        orgId: scope!.orgId,
        siteId: siteId,
      ),
    );
    return s.payments?.card.available ?? false;
  } on Object {
    return false;
  }
});

/// Open charges of one side, for the checkout picker.
final openChargesProvider = FutureProvider.autoDispose
    .family<List<Charge>, StatementTarget>((ref, target) async {
      final repo = ref.watch(moneyRepositoryProvider);
      final ctx = ref.watch(orgContextProvider);
      if (repo == null || ctx?.siteId == null) return const [];
      final all = await repo.charges(
        orgId: ctx!.orgId,
        siteId: ctx.siteId!,
        unitId: target.unitId,
        kind: target.kind,
      );
      return [
        for (final c in all)
          if (c.status == ChargeStatusEnum.open ||
              c.status == ChargeStatusEnum.partiallyPaid)
            c,
      ];
    });

/// A checkout polled with backoff until it leaves `pending`.
final checkoutPollProvider = StreamProvider.autoDispose
    .family<Checkout, ({String orgId, String id})>((ref, q) async* {
      final repo = ref.watch(moneyRepositoryProvider);
      if (repo == null) return;
      for (var attempt = 0; attempt < checkoutPollAttempts; attempt++) {
        final c = await repo.checkout(orgId: q.orgId, id: q.id);
        yield c;
        if (c.status != CheckoutStatusEnum.pending) return;
        // A timer, not Future.delayed: disposing the provider cancels it.
        final wait = Completer<void>();
        final timer = Timer(checkoutPollDelay(attempt), wait.complete);
        ref.onDispose(timer.cancel);
        await wait.future;
      }
    });

final myCheckoutsProvider = FutureProvider.autoDispose<List<Checkout>>((
  ref,
) async {
  final repo = ref.watch(moneyRepositoryProvider);
  final orgId = ref.watch(scopeProvider)?.orgId;
  if (repo == null || orgId == null) return const [];
  return (await repo.myCheckouts(orgId)).reversed.toList();
});

String _isoDate(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';
