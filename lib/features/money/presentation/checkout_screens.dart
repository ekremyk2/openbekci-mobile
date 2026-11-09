import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/api/interceptors.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/money/application/money_providers.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Pay by card (mobile plan 7.1 Pay): pick charges or an amount for one side,
/// start the checkout and open the provider's page in a Custom Tab.
class CheckoutScreen extends ConsumerStatefulWidget {
  const new({required this.sideId, super.key});

  /// `unit:kind`.
  final String sideId;

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen>
    with SubmitState {
  final _amount = TextEditingController();
  final _picked = <String>{};
  String _key = HeadersInterceptor.newId(Random.secure());
  String? _keyFor;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  Future<void> _start(StatementTarget target, OrgContext ctx) async {
    final repo = ref.read(moneyRepositoryProvider);
    if (repo == null) return;
    final typed = _amount.text.trim().isNotEmpty;
    final minor = typed ? parseMoneyInput(_amount.text, ctx.currency) : null;
    if (typed && minor == null) {
      setState(
        () => error = const AppError(
          code: 'validation_failed',
          fieldErrors: [FieldError(field: 'amount', code: 'invalid')],
        ),
      );
      return;
    }
    final ids = _picked.toList()..sort();
    // A retry of the same request reuses the key; an edited one is new.
    final fingerprint = '${target.id}|${ids.join(',')}|$minor';
    if (_keyFor != null && _keyFor != fingerprint) {
      _key = HeadersInterceptor.newId(Random.secure());
    }
    _keyFor = fingerprint;
    await submit(() async {
      final c = await repo.createCheckout(
        orgId: ctx.orgId,
        unitId: target.unitId,
        kind: target.kind,
        idempotencyKey: _key,
        chargeIds: ids,
        amount: minor == null
            ? null
            : Money(amount: minor, currency: ctx.currency),
      );
      final url = c.checkoutUrl;
      if (url != null) {
        await ref.read(urlOpenerProvider).open(Uri.parse(url), inApp: true);
      }
      if (mounted) {
        context.pushReplacement('/money/checkout/${c.id}?org=${ctx.orgId}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final target = ref
        .watch(statementTargetsProvider)
        .where((t) => t.id == widget.sideId)
        .firstOrNull;
    if (ctx == null || target == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.payByCard)),
        body: const SkeletonList(),
      );
    }
    final charges = ref.watch(openChargesProvider(target)).value ?? const [];
    return Scaffold(
      appBar: AppBar(title: Text(l.payByCard)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            Text(
              l.sideChip(target.unitLabel, sideLabel(l, target.kind)),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (charges.isNotEmpty) ...[
              SectionTitle(l.checkoutChargesTitle),
              Text(l.checkoutChargesHint),
              for (final c in charges)
                CheckboxListTile(
                  key: Key('charge_${c.id}'),
                  value: _picked.contains(c.id),
                  onChanged: (v) => setState(
                    () =>
                        (v ?? false) ? _picked.add(c.id) : _picked.remove(c.id),
                  ),
                  title: Text(c.description ?? c.period ?? c.id),
                  secondary: MoneyText(
                    amountMinor: c.balance.amount,
                    currency: c.balance.currency,
                  ),
                ),
            ],
            const SizedBox(height: 12),
            TextField(
              key: const Key('checkoutAmount'),
              controller: _amount,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              decoration: InputDecoration(
                labelText: l.checkoutAmount(ctx.currency),
                errorText: fieldMessage(context, error, 'amount'),
                border: const OutlineInputBorder(),
              ),
            ),
            if (error != null) ...[
              const SizedBox(height: 12),
              ErrorBanner(error: error!),
            ],
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('checkoutContinue'),
              onPressed: busy ? null : () => _start(target, ctx),
              child: busy
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l.checkoutContinue),
            ),
          ],
        ),
      ),
    );
  }
}

String _statusLabel(AppLocalizations l, CheckoutStatusEnum s) => switch (s) {
  CheckoutStatusEnum.paid => l.checkoutPaid,
  CheckoutStatusEnum.failed => l.checkoutFailed,
  CheckoutStatusEnum.expired => l.checkoutExpired,
  CheckoutStatusEnum.refunded => l.checkoutRefunded,
  _ => l.checkoutPending,
};

/// Where the provider returns the payer: polls the checkout until it is
/// final and shows the outcome, including `amount_mismatch`.
class CheckoutStatusScreen extends ConsumerWidget {
  const new({required this.checkoutId, this.orgId, super.key});

  final String checkoutId;
  final String? orgId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final org = orgId ?? ref.watch(orgContextProvider)?.orgId;
    if (org == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.checkoutStatusTitle)),
        body: const SkeletonList(),
      );
    }
    final poll = checkoutPollProvider((orgId: org, id: checkoutId));
    final state = ref.watch(poll);
    ref.listen(poll, (_, next) {
      if (next.value?.status == CheckoutStatusEnum.paid) {
        ref
          ..invalidate(statementProvider)
          ..invalidate(paymentsProvider)
          ..invalidate(dashboardProvider);
      }
    });
    final c = state.value;
    return Scaffold(
      appBar: AppBar(title: Text(l.checkoutStatusTitle)),
      body: c != null
          ? _Outcome(checkout: c, onRefresh: () => ref.invalidate(poll))
          : state.hasError
          ? ErrorState(
              error: AppError.from(state.error!),
              onRetry: () => ref.invalidate(poll),
            )
          : const SkeletonList(),
    );
  }
}

class _Outcome extends ConsumerWidget {
  const new({required this.checkout, required this.onRefresh});

  final Checkout checkout;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final s = checkout.status;
    final pending = s == CheckoutStatusEnum.pending;
    final confirmed = checkout.confirmedAmount;
    final url = checkout.checkoutUrl;
    return ListView(
      padding: const EdgeInsetsDirectional.all(16),
      children: [
        Card(
          key: Key('checkout_${s.value}'),
          child: ListTile(
            leading: Icon(switch (s) {
              CheckoutStatusEnum.paid => Icons.check_circle_outline,
              CheckoutStatusEnum.failed => Icons.error_outline,
              CheckoutStatusEnum.expired => Icons.timer_off_outlined,
              CheckoutStatusEnum.refunded => Icons.undo,
              _ => Icons.hourglass_empty,
            }),
            title: Text(_statusLabel(l, s)),
            subtitle: pending ? Text(l.checkoutPendingBody) : null,
            trailing: MoneyText(
              amountMinor: checkout.amount.amount,
              currency: checkout.amount.currency,
            ),
          ),
        ),
        if ((checkout.amountMismatch ?? false) && confirmed != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12),
            child: Card(
              key: const Key('checkoutMismatch'),
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Text(
                  l.checkoutMismatch(
                    formatMoney(
                      confirmed.amount,
                      confirmed.currency,
                      locale: locale,
                    ),
                    formatMoney(
                      checkout.amount.amount,
                      checkout.amount.currency,
                      locale: locale,
                    ),
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(height: 12),
        if (pending && url != null)
          OutlinedButton(
            key: const Key('checkoutReopen'),
            onPressed: () =>
                ref.read(urlOpenerProvider).open(Uri.parse(url), inApp: true),
            child: Text(l.checkoutReopen),
          ),
        if (pending)
          TextButton(
            key: const Key('checkoutRefresh'),
            onPressed: onRefresh,
            child: Text(l.checkoutRefresh),
          ),
      ],
    );
  }
}

/// The card checkouts the user started, newest first.
class MyCheckoutsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final list = ref.watch(myCheckoutsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.myCheckoutsTitle)),
      body: list.when(
        loading: () => const SkeletonList(),
        error: (e, _) => ErrorState(
          error: AppError.from(e),
          onRetry: () => ref.invalidate(myCheckoutsProvider),
        ),
        data: (items) => items.isEmpty
            ? EmptyState(
                icon: Icons.credit_card_outlined,
                message: l.myCheckoutsEmpty,
              )
            : ListView(
                children: [
                  for (final c in items)
                    ListTile(
                      key: Key('myCheckout_${c.id}'),
                      title: MoneyText(
                        amountMinor: c.amount.amount,
                        currency: c.amount.currency,
                      ),
                      subtitle: SiteDate(
                        instant: c.createdAt,
                        timezone: ctx?.timezone ?? 'UTC',
                      ),
                      trailing: Pill(
                        _statusLabel(l, c.status),
                        tone: switch (c.status) {
                          CheckoutStatusEnum.paid => PillTone.good,
                          CheckoutStatusEnum.failed => PillTone.bad,
                          _ => PillTone.neutral,
                        },
                      ),
                      onTap: () => context.push(
                        '/money/checkout/${c.id}?org=${c.orgId}',
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
