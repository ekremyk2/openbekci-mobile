import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/api/interceptors.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';
import 'package:openbekci_mobile/features/money/application/money_providers.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Pay by bank transfer: the site's bank details with copy buttons and the
/// "I've paid by transfer" declaration (mobile plan 7.1 Pay, M5).
class PayScreen extends ConsumerStatefulWidget {
  const new({required this.sideId, super.key});

  /// `unit:kind`.
  final String sideId;

  @override
  ConsumerState<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends ConsumerState<PayScreen> with SubmitState {
  final _amount = TextEditingController();
  final _reference = TextEditingController();
  final _note = TextEditingController();
  late DateTime _paidOn;
  bool _paidOnReady = false;
  bool _prefilled = false;

  /// Generated once per form: a retry after a timeout reuses it, so the
  /// transfer cannot be declared twice.
  late final String _key = HeadersInterceptor.newId(Random.secure());
  Payment? _done;

  @override
  void dispose() {
    _amount.dispose();
    _reference.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickDate(String timezone) async {
    final today = siteToday(timezone);
    final picked = await showDatePicker(
      context: context,
      initialDate: _paidOn,
      firstDate: DateTime(today.year - 1),
      lastDate: today,
    );
    if (picked != null) setState(() => _paidOn = picked);
  }

  Future<void> _declare(StatementTarget target, OrgContext ctx) async {
    final l = AppLocalizations.of(context);
    final minor = parseMoneyInput(_amount.text, ctx.currency);
    if (minor == null) {
      setState(
        () => error = const AppError(
          code: 'validation_failed',
          fieldErrors: [FieldError(field: 'amount', code: 'required')],
        ),
      );
      return;
    }
    final repo = ref.read(moneyRepositoryProvider);
    if (repo == null || ctx.siteId == null) return;
    await submit(() async {
      final payment = await repo.declare(
        orgId: ctx.orgId,
        siteId: ctx.siteId!,
        unitId: target.unitId,
        kind: target.kind,
        amountMinor: minor,
        currency: ctx.currency,
        paidOn: _isoDate(_paidOn),
        reference: _reference.text.trim(),
        note: _note.text.trim(),
        idempotencyKey: _key,
      );
      ref
        ..invalidate(paymentsProvider(target))
        ..invalidate(dashboardProvider);
      if (mounted) setState(() => _done = payment);
    });
    if (mounted && _done == null && error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.errorGeneric)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final targets = ref.watch(statementTargetsProvider);
    final target = targets.where((t) => t.id == widget.sideId).firstOrNull;
    if (ctx == null || target == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.payTitle)),
        body: const SkeletonList(),
      );
    }
    if (!_paidOnReady) {
      _paidOn = siteToday(ctx.timezone);
      _paidOnReady = true;
    }
    final dash = ref.watch(dashboardProvider).value?.data;
    final side = dash?.sides
        .where(
          (s) => s.unitId == target.unitId && s.debtorKind.value == target.kind,
        )
        .firstOrNull;
    if (!_prefilled && side != null && side.total.amount > 0) {
      _amount.text = minorToInput(side.total.amount, ctx.currency);
      _prefilled = true;
    }
    final done = _done;
    return Scaffold(
      appBar: AppBar(title: Text(l.payTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            Text(
              l.sideChip(target.unitLabel, sideLabel(l, target.kind)),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SectionTitle(l.bankDetailsTitle),
            _BankDetails(target: target, ctx: ctx),
            SectionTitle(l.declareTitle),
            if (done != null)
              Card(
                key: const Key('declareDone'),
                child: ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(l.declareSent),
                  subtitle: Text(l.declareSentBody),
                ),
              )
            else ...[
              Text(l.declareBody),
              const SizedBox(height: 12),
              TextField(
                key: const Key('declareAmount'),
                controller: _amount,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                ],
                decoration: InputDecoration(
                  labelText: l.declareAmount(ctx.currency),
                  errorText: fieldMessage(context, error, 'amount'),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                key: const Key('declareDate'),
                onTap: () => _pickDate(ctx.timezone),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: l.declareDate,
                    errorText: fieldMessage(context, error, 'paid_on'),
                    border: const OutlineInputBorder(),
                    suffixIcon: const Icon(Icons.calendar_today_outlined),
                  ),
                  child: SiteDate(
                    isoDate: _isoDate(_paidOn),
                    timezone: ctx.timezone,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                key: const Key('declareReference'),
                controller: _reference,
                decoration: InputDecoration(
                  labelText: l.declareReference,
                  errorText: fieldMessage(context, error, 'reference'),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                key: const Key('declareNote'),
                controller: _note,
                decoration: InputDecoration(
                  labelText: l.declareNote,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              if (error != null && error!.fieldErrors.isEmpty) ...[
                ErrorBanner(error: error!),
                const SizedBox(height: 12),
              ],
              FilledButton(
                key: const Key('declareSubmit'),
                onPressed: busy ? null : () => _declare(target, ctx),
                child: busy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l.declareSubmit),
              ),
              const SizedBox(height: 8),
              Text(
                l.declareNeedsConnection,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String _isoDate(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

/// IBAN, holder, bank and the suggested reference, each with a copy button.
/// From the dashboard when it carries them, else `GET .../bank-details`.
class _BankDetails extends ConsumerWidget {
  const new({required this.target, required this.ctx});

  final StatementTarget target;
  final OrgContext ctx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final fromDashboard = target.bankDetails;
    final async = fromDashboard != null
        ? AsyncData<BankDetails?>(fromDashboard)
        : ref.watch(_bankDetailsProvider(target));
    return async.when(
      loading: () => const SkeletonList(rows: 2),
      error: (e, _) => ErrorBanner(error: AppError.from(e)),
      data: (bank) {
        if (bank == null) {
          return Text(l.bankDetailsMissing, key: const Key('bankMissing'));
        }
        return Card(
          key: const Key('bankDetails'),
          child: Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CopyRow(
                  copyKey: const Key('copyIban'),
                  label: l.bankIban,
                  value: bank.iban,
                ),
                CopyRow(
                  copyKey: const Key('copyHolder'),
                  label: l.bankHolder,
                  value: bank.holder,
                ),
                if (bank.bankName != null)
                  CopyRow(label: l.bankName, value: bank.bankName!),
                if (bank.suggestedReference != null)
                  CopyRow(
                    copyKey: const Key('copyReference'),
                    label: l.bankReference,
                    value: bank.suggestedReference!,
                  ),
                if (bank.referenceHint != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: Text(
                      bank.referenceHint!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final _bankDetailsProvider =
    FutureProvider.family<BankDetails?, StatementTarget>((ref, target) async {
      final repo = ref.watch(moneyRepositoryProvider);
      final ctx = ref.watch(orgContextProvider);
      if (repo == null || ctx?.siteId == null) return null;
      try {
        return await repo.bankDetails(
          orgId: ctx!.orgId,
          siteId: ctx.siteId!,
          unitId: target.unitId,
          kind: target.kind,
        );
      } on AppError catch (e) {
        if (e.status == 403 || e.status == 404) return null;
        rethrow;
      }
    });

/// Payment history of one side: declared, confirmed and the rest, with the
/// receipt of a confirmed payment through the share sheet.
class PaymentsScreen extends ConsumerWidget {
  const new({required this.sideId, super.key});

  final String sideId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final target = ref
        .watch(statementTargetsProvider)
        .where((t) => t.id == sideId)
        .firstOrNull;
    return Scaffold(
      appBar: AppBar(title: Text(l.paymentHistoryTitle)),
      body: target == null || ctx == null
          ? const SkeletonList()
          : CachedView<List<Payment>>(
              provider: paymentsProvider(target),
              isEmpty: (list) => list.isEmpty,
              emptyMessage: l.paymentsEmpty,
              builder: (context, list) => [
                for (final p in list)
                  Card(
                    key: Key('payment_${p.id}'),
                    child: ListTile(
                      title: MoneyText(
                        amountMinor: p.gross.amount,
                        currency: p.gross.currency,
                      ),
                      subtitle: Wrap(
                        spacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SiteDate(
                            isoDate: _isoDate(p.receivedOn),
                            timezone: ctx.timezone,
                          ),
                          Text(paymentMethodLabel(l, p.method)),
                          Pill(
                            paymentStatusLabel(l, p.status),
                            tone: switch (p.status) {
                              PaymentStatusEnum.pendingDeclared =>
                                PillTone.warn,
                              PaymentStatusEnum.confirmed => PillTone.good,
                              _ => PillTone.neutral,
                            },
                          ),
                          if (p.receiptNo != null)
                            Text(l.receiptNo(p.receiptNo!)),
                        ],
                      ),
                      trailing: p.status == PaymentStatusEnum.confirmed
                          ? IconButton(
                              tooltip: l.shareReceipt,
                              icon: const Icon(Icons.share_outlined),
                              onPressed: () => _shareReceipt(context, ref, p),
                            )
                          : null,
                    ),
                  ),
              ],
            ),
    );
  }

  Future<void> _shareReceipt(
    BuildContext context,
    WidgetRef ref,
    Payment p,
  ) async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final repo = ref.read(moneyRepositoryProvider);
    final scope = ref.read(orgContextProvider);
    if (repo == null || scope == null) return;
    try {
      final bytes = await repo.receipt(orgId: scope.orgId, paymentId: p.id);
      await ref
          .read(shareServiceProvider)
          .shareFile(
            bytes: bytes,
            filename: 'receipt-${p.receiptNo ?? p.id}.pdf',
            mime: 'application/pdf',
          );
    } on Object catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
    }
  }
}
