import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/money/application/money_providers.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// The side shown in the Money tab (`unit:kind`); null = the first one.
class SelectedSideController extends Notifier<String?> {
  @override
  String? build() => null;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void select(String? id) => state = id;
}

final selectedSideProvider = NotifierProvider<SelectedSideController, String?>(
  SelectedSideController.new,
);

/// The side in effect: the chosen one when it is still allowed, else the
/// first target.
StatementTarget? effectiveTarget(List<StatementTarget> targets, String? id) {
  if (targets.isEmpty) return null;
  for (final t in targets) {
    if (t.id == id) return t;
  }
  return targets.first;
}

class PeriodController extends Notifier<StatementPeriod> {
  @override
  StatementPeriod build() => StatementPeriod.thisYear;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void select(StatementPeriod p) => state = p;
}

final periodProvider = NotifierProvider<PeriodController, StatementPeriod>(
  PeriodController.new,
);

/// Money tab: the statement of one debtor side (mobile plan 7.1 Statement).
class MoneyScreen extends ConsumerStatefulWidget {
  const new({this.initialSide, super.key});

  /// `unit:kind` from a deep link or a home card.
  final String? initialSide;

  @override
  ConsumerState<MoneyScreen> createState() => _MoneyScreenState();
}

class _MoneyScreenState extends ConsumerState<MoneyScreen> {
  @override
  void initState() {
    super.initState();
    _apply();
  }

  @override
  void didUpdateWidget(MoneyScreen old) {
    super.didUpdateWidget(old);
    if (old.initialSide != widget.initialSide) _apply();
  }

  // Providers must not change while the tree builds.
  void _apply() {
    final side = widget.initialSide;
    if (side == null) return;
    unawaited(
      Future<void>(() {
        if (mounted) ref.read(selectedSideProvider.notifier).select(side);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final targets = ref.watch(statementTargetsProvider);
    final dashboard = ref.watch(dashboardProvider);
    final chosen = ref.watch(selectedSideProvider);
    final target = effectiveTarget(targets, chosen);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.moneyTitle),
        actions: [
          if (ref.watch(cardAvailableProvider).value ?? false)
            IconButton(
              key: const Key('openCheckouts'),
              tooltip: l.myCheckoutsTitle,
              icon: const Icon(Icons.credit_card_outlined),
              onPressed: () => context.push('/money/checkouts'),
            ),
          if (target != null)
            IconButton(
              key: const Key('openPayments'),
              tooltip: l.paymentHistoryTitle,
              icon: const Icon(Icons.receipt_long_outlined),
              onPressed: () =>
                  context.push('/money/payments?side=${target.id}'),
            ),
        ],
      ),
      body: target == null
          ? (dashboard.value?.data == null
                ? const SkeletonList()
                : EmptyState(
                    icon: Icons.lock_outline,
                    message: l.homeNoMoneyAccess,
                  ))
          : StatementView(targets: targets, target: target),
    );
  }
}

/// Side picker, period filter and the statement of [target].
class StatementView extends ConsumerWidget {
  const new({required this.targets, required this.target, super.key});

  final List<StatementTarget> targets;
  final StatementTarget target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final period = ref.watch(periodProvider);
    final range = target.former
        ? (from: target.from, to: target.to)
        : periodRange(period, siteToday(ctx?.timezone ?? 'UTC'));
    final query = (
      unitId: target.unitId,
      kind: target.kind,
      from: range.from,
      to: range.to,
    );
    final provider = statementProvider(query);
    return CachedView<Statement>(
      provider: provider,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
      header: _Filters(targets: targets, target: target, period: period),
      builder: (context, statement) => [
        _Summary(statement: statement, target: target),
        _DeclaredSection(target: target),
        SectionTitle(
          l.statementLines,
          trailing: TextButton.icon(
            key: const Key('sharePdf'),
            icon: const Icon(Icons.picture_as_pdf_outlined),
            label: Text(l.statementPdf),
            onPressed: () => _sharePdf(context, ref, target, range),
          ),
        ),
        _Lines(statement: statement, ctx: ctx),
      ],
    );
  }

  Future<void> _sharePdf(
    BuildContext context,
    WidgetRef ref,
    StatementTarget target,
    ({String? from, String? to}) range,
  ) async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final repo = ref.read(moneyRepositoryProvider);
    final scope = ref.read(orgContextProvider);
    if (repo == null || scope == null) return;
    try {
      final bytes = await repo.statementPdf(
        orgId: scope.orgId,
        unitId: target.unitId,
        kind: target.kind,
        from: range.from,
        to: range.to,
      );
      await ref
          .read(shareServiceProvider)
          .shareFile(
            bytes: bytes,
            filename: 'statement-${target.unitLabel}-${target.kind}.pdf',
            mime: 'application/pdf',
          );
    } on Object catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
    }
  }
}

class _Filters extends ConsumerWidget {
  const new({
    required this.targets,
    required this.target,
    required this.period,
  });

  final List<StatementTarget> targets;
  final StatementTarget target;
  final StatementPeriod period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final labels = {
      StatementPeriod.last3Months: l.periodLast3Months,
      StatementPeriod.thisYear: l.periodThisYear,
      StatementPeriod.lastYear: l.periodLastYear,
      StatementPeriod.all: l.periodAll,
    };
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (targets.length > 1)
            Wrap(
              spacing: 8,
              children: [
                for (final t in targets)
                  ChoiceChip(
                    key: Key('side_${t.id}'),
                    label: Text(l.sideChip(t.unitLabel, sideLabel(l, t.kind))),
                    selected: t.id == target.id,
                    onSelected: (_) =>
                        ref.read(selectedSideProvider.notifier).select(t.id),
                  ),
              ],
            )
          else
            Text(
              l.sideChip(target.unitLabel, sideLabel(l, target.kind)),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          const SizedBox(height: 8),
          if (target.former)
            Text(l.formerPeriodNote, key: const Key('formerNote'))
          else
            Wrap(
              spacing: 8,
              children: [
                for (final p in StatementPeriod.values)
                  ChoiceChip(
                    key: Key('period_${p.name}'),
                    label: Text(labels[p]!),
                    selected: p == period,
                    onSelected: (_) =>
                        ref.read(periodProvider.notifier).select(p),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _Summary extends ConsumerWidget {
  const new({required this.statement, required this.target});

  final Statement statement;
  final StatementTarget target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cardAvailable = ref.watch(cardAvailableProvider).value ?? false;
    final fee = statement.accruedLateFee;
    final canPay = !target.former;
    return Card(
      margin: const EdgeInsetsDirectional.only(top: 16),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.totalDueToday, style: theme.textTheme.bodySmall),
            MoneyText(
              key: const Key('totalDue'),
              amountMinor: statement.totalDue.amount,
              currency: statement.totalDue.currency,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            _kv(
              context,
              l.accruedLateFeeToday,
              MoneyText(
                key: const Key('accruedLateFee'),
                amountMinor: fee.amount,
                currency: fee.currency,
              ),
            ),
            if (statement.credit.amount > 0)
              _kv(
                context,
                l.creditLabel,
                MoneyText(
                  amountMinor: statement.credit.amount,
                  currency: statement.credit.currency,
                ),
              ),
            if (canPay) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.icon(
                    key: const Key('payByTransfer'),
                    icon: const Icon(Icons.account_balance_outlined),
                    label: Text(l.payByTransfer),
                    onPressed: () =>
                        context.push('/money/pay?side=${target.id}'),
                  ),
                  if (cardAvailable)
                    OutlinedButton.icon(
                      key: const Key('payByCard'),
                      icon: const Icon(Icons.credit_card),
                      label: Text(l.payByCard),
                      onPressed: () =>
                          context.push('/money/card?side=${target.id}'),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _kv(BuildContext context, String label, Widget value) => Padding(
    padding: const EdgeInsetsDirectional.only(top: 2),
    child: Row(
      children: [
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
        value,
      ],
    ),
  );
}

/// Declared transfers a manager has not confirmed yet.
class _DeclaredSection extends ConsumerWidget {
  const new({required this.target});

  final StatementTarget target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final payments = ref.watch(paymentsProvider(target)).value?.data;
    final declared = declaredPayments(payments ?? const []);
    if (declared.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(l.declaredSection),
        for (final p in declared)
          Card(
            key: Key('declared_${p.id}'),
            child: ListTile(
              leading: const Icon(Icons.hourglass_top),
              title: MoneyText(
                amountMinor: p.gross.amount,
                currency: p.gross.currency,
              ),
              subtitle: Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SiteDate(
                    isoDate: _iso(p.receivedOn),
                    timezone: ctx?.timezone ?? 'UTC',
                  ),
                  Pill(paymentStatusLabel(l, p.status), tone: PillTone.warn),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

String _iso(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

class _Lines extends StatelessWidget {
  const new({required this.statement, required this.ctx});

  final Statement statement;
  final OrgContext? ctx;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tz = ctx?.timezone ?? 'UTC';
    final fee = statement.accruedLateFee;
    Widget row({
      required String title,
      required String subtitle,
      required Widget amount,
      required Widget balance,
      Key? key,
      Widget? date,
    }) => Padding(
      key: key,
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ?date,
                Text(title, style: theme.textTheme.bodyLarge),
                if (subtitle.isNotEmpty)
                  Text(subtitle, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              amount,
              DefaultTextStyle.merge(
                style: theme.textTheme.bodySmall,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text('${l.runningBalance} '), balance],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Column(
      children: [
        row(
          key: const Key('openingLine'),
          title: l.openingBalance,
          subtitle: '',
          amount: const SizedBox.shrink(),
          balance: MoneyText(
            amountMinor: statement.openingBalance.amount,
            currency: statement.openingBalance.currency,
          ),
          date: SiteDate(
            isoDate: _iso(statement.from),
            timezone: tz,
            style: theme.textTheme.bodySmall,
          ),
        ),
        const Divider(height: 1),
        for (final (i, line) in statement.lines.indexed) ...[
          row(
            key: Key('line_$i'),
            title: line.description.isEmpty
                ? statementKindLabel(l, line.kind)
                : line.description,
            subtitle: statementKindLabel(l, line.kind),
            date: SiteDate(
              isoDate: _iso(line.date),
              timezone: tz,
              style: theme.textTheme.bodySmall,
            ),
            amount: line.credit.amount > 0
                ? MoneyText(
                    amountMinor: -line.credit.amount,
                    currency: line.credit.currency,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  )
                : MoneyText(
                    amountMinor: line.debit.amount,
                    currency: line.debit.currency,
                    style: theme.textTheme.bodyLarge,
                  ),
            balance: MoneyText(
              amountMinor: line.balance.amount,
              currency: line.balance.currency,
            ),
          ),
          const Divider(height: 1),
        ],
        // The late fee accrued to today is not booked yet: shown as its own
        // line so the figure is continuous (M4).
        if (fee.amount > 0) ...[
          row(
            key: const Key('accruedLine'),
            title: l.accruedLateFeeToday,
            subtitle: l.notBookedYet,
            date: SiteDate(
              isoDate: _iso(statement.to),
              timezone: tz,
              style: theme.textTheme.bodySmall,
            ),
            amount: MoneyText(
              amountMinor: fee.amount,
              currency: fee.currency,
              style: theme.textTheme.bodyLarge,
            ),
            balance: MoneyText(
              amountMinor: statement.totalDue.amount,
              currency: statement.totalDue.currency,
            ),
          ),
          const Divider(height: 1),
        ],
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l.closingBalance,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              MoneyText(
                amountMinor: statement.closingBalance.amount,
                currency: statement.closingBalance.currency,
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
        ),
        if (statement.lines.isEmpty)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 16),
            child: Text(l.statementNoLines, key: const Key('noLines')),
          ),
      ],
    );
  }
}

/// Convenience for tests and links: parse `unit:kind`.
String? sideParam(GoRouterState state) => state.uri.queryParameters['side'];
