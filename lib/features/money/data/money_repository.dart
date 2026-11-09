import 'dart:typed_data';

import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/features/money/domain/money_logic.dart';

/// Statement, payments and the transfer declaration (mobile plan 7.1 Pay).
class MoneyRepository {
  const new(this.api);

  final ApiClient api;

  Future<Statement> statement({
    required String orgId,
    required String unitId,
    required String kind,
    String? from,
    String? to,
  }) => unwrap(
    () => api.money.moneyGetUnitStatement(
      orgId: orgId,
      unitId: unitId,
      debtorKind: kind,
      from: from,
      to: to,
    ),
  );

  Future<List<Charge>> charges({
    required String orgId,
    required String siteId,
    required String unitId,
    required String kind,
  }) => fetchPages<Charge>((cursor) async {
    final page = await unwrap(
      () => api.money.moneyListCharges(
        orgId: orgId,
        siteId: siteId,
        unitId: unitId,
        debtorKind: kind,
        cursor: cursor,
      ),
    );
    return (items: page.items, next: page.nextCursor);
  }, maxPages: 6);

  /// The statement of [target]. The statement endpoint is the contract's
  /// answer; a server that refuses residents on it (403: the handler checks
  /// `units.read`) is served from the charge and payment lists a resident
  /// may read, see [statementFromLedger].
  Future<Statement> statementOrLedger({
    required String orgId,
    required String siteId,
    required String currency,
    required String today,
    required StatementTarget target,
    String? from,
    String? to,
    MySide? side,
  }) async {
    try {
      return await statement(
        orgId: orgId,
        unitId: target.unitId,
        kind: target.kind,
        from: from,
        to: to,
      );
    } on AppError catch (e) {
      if (e.status != 403) rethrow;
      final results = await Future.wait<Object>([
        charges(
          orgId: orgId,
          siteId: siteId,
          unitId: target.unitId,
          kind: target.kind,
        ),
        payments(
          orgId: orgId,
          siteId: siteId,
          unitId: target.unitId,
          kind: target.kind,
        ),
      ]);
      return statementFromLedger(
        target: target,
        charges: results[0] as List<Charge>,
        payments: results[1] as List<Payment>,
        currency: currency,
        today: today,
        from: from,
        to: to,
        side: side,
      );
    }
  }

  /// The printable statement (`format=pdf`).
  Future<Uint8List> statementPdf({
    required String orgId,
    required String unitId,
    required String kind,
    String? from,
    String? to,
  }) => api.getBytes(
    '/v1/orgs/$orgId/units/$unitId/statements/$kind',
    query: {'format': 'pdf', 'from': ?from, 'to': ?to},
  );

  Future<List<Payment>> payments({
    required String orgId,
    required String siteId,
    String? unitId,
    String? kind,
  }) => fetchPages<Payment>((cursor) async {
    final page = await unwrap(
      () => api.money.moneyListPayments(
        orgId: orgId,
        siteId: siteId,
        unitId: unitId,
        debtorKind: kind,
        cursor: cursor,
      ),
    );
    return (items: page.items, next: page.nextCursor);
  }, maxPages: 3);

  Future<BankDetails> bankDetails({
    required String orgId,
    required String siteId,
    required String unitId,
    required String kind,
  }) => unwrap(
    () => api.tenancy.tenancyGetBankDetails(
      orgId: orgId,
      siteId: siteId,
      unitId: unitId,
      debtorKind: kind,
    ),
  );

  /// "I've paid by transfer": creates a `pending_declared` payment. The
  /// [idempotencyKey] is generated once per form so a retry cannot declare
  /// twice.
  Future<Payment> declare({
    required String orgId,
    required String siteId,
    required String unitId,
    required String kind,
    required int amountMinor,
    required String currency,
    required String paidOn,
    required String idempotencyKey,
    String? reference,
    String? note,
  }) => unwrap(
    () => api.money.moneyDeclarePayment(
      orgId: orgId,
      idempotencyKey: idempotencyKey,
      paymentDeclare: PaymentDeclare(
        siteId: siteId,
        amount: Money(amount: amountMinor, currency: currency),
        paidOn: paidOn,
        debtor: DebtorRef(
          mode: DebtorRefModeEnum.unitSide,
          unitId: unitId,
          debtorKind: kind == 'owner'
              ? DebtorRefDebtorKindEnum.owner
              : DebtorRefDebtorKindEnum.tenant,
        ),
        reference: reference == null || reference.isEmpty ? null : reference,
        note: note == null || note.isEmpty ? null : note,
      ),
    ),
  );

  Future<Uint8List> receipt({
    required String orgId,
    required String paymentId,
  }) => api.getBytes('/v1/orgs/$orgId/payments/$paymentId/receipt');
}
