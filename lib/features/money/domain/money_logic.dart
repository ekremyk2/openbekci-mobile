import 'package:flutter/foundation.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/l10n/format.dart';

/// One debtor side the user can look at: a statement per target.
///
/// Visibility is decided by the server (the dashboard lists only the sides
/// the caller may see: owner both sides of the unit, tenant the tenant side,
/// a household member only with `may_see_money`); former residents add their
/// own side and period from `/v1/me` (S7).
@immutable
class StatementTarget {
  const new({
    required this.unitId,
    required this.unitLabel,
    required this.kind,
    this.from,
    this.to,
    this.bankDetails,
    this.former = false,
  });

  final String unitId;
  final String unitLabel;

  /// `owner` or `tenant` (the path segment of the statement endpoint).
  final String kind;

  /// The fixed period of a former resident (inclusive, `YYYY-MM-DD`).
  final String? from;
  final String? to;
  final BankDetails? bankDetails;
  final bool former;

  String get id => '$unitId:$kind';

  @override
  bool operator ==(Object other) =>
      other is StatementTarget && other.id == id && other.former == former;

  @override
  int get hashCode => Object.hash(id, former);
}

String _isoDate(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// Statement targets for the signed-in user in one organization.
List<StatementTarget> statementTargets({
  required List<MySide> sides,
  required List<MeOccupancy> occupancies,
}) {
  final out = <StatementTarget>[];
  final seen = <String>{};
  for (final s in sides) {
    final kind = s.debtorKind.value;
    if (s.debtorKind == MySideDebtorKindEnum.unknownDefaultOpenApi) continue;
    final t = StatementTarget(
      unitId: s.unitId,
      unitLabel: s.unitDoorNumber,
      kind: kind,
      bankDetails: s.bankDetails,
    );
    if (seen.add(t.id)) out.add(t);
  }
  for (final o in occupancies) {
    if (o.kind != MeOccupancyKindEnum.formerOccupant) continue;
    final side = o.side;
    if (side == null || side == MeOccupancySideEnum.unknownDefaultOpenApi) {
      continue;
    }
    final t = StatementTarget(
      unitId: o.unitId,
      unitLabel: o.unitLabel,
      kind: side.value,
      from: _isoDate(o.validFrom),
      to: o.validTo == null ? null : _isoDate(o.validTo!),
      former: true,
    );
    if (seen.add(t.id)) out.add(t);
  }
  return out;
}

/// Whether the Money tab is shown: only for people who see at least one side.
bool showMoneyTab(List<StatementTarget> targets) => targets.isNotEmpty;

/// A period filter of the statement.
enum StatementPeriod { last3Months, thisYear, lastYear, all }

/// `from` / `to` query values for [period] on [today] (the site's local
/// date). `null` bounds leave the server default (all time).
({String? from, String? to}) periodRange(
  StatementPeriod period,
  DateTime today,
) {
  switch (period) {
    case StatementPeriod.last3Months:
      return (
        from: _isoDate(DateTime(today.year, today.month - 3, today.day)),
        to: _isoDate(today),
      );
    case StatementPeriod.thisYear:
      return (from: _isoDate(DateTime(today.year)), to: _isoDate(today));
    case StatementPeriod.lastYear:
      return (
        from: _isoDate(DateTime(today.year - 1)),
        to: _isoDate(DateTime(today.year - 1, 12, 31)),
      );
    case StatementPeriod.all:
      return (from: '2000-01-01', to: _isoDate(today));
  }
}

/// Today's calendar date in the site's timezone.
DateTime siteToday(String timezone, [DateTime? now]) {
  final local = inSiteZone(now ?? DateTime.now(), timezone);
  return DateTime(local.year, local.month, local.day);
}

/// Parses what a person types as an amount into integer minor units, or
/// `null` when it is not a positive amount. Accepts `1234,50`, `1.234,50`,
/// `1,234.50` and `1234`; the last separator is the decimal mark when it
/// leaves at most the currency's minor digits after it.
int? parseMoneyInput(String input, String currency) {
  final digits = minorUnitDigits(currency);
  final s = input.trim().replaceAll(RegExp(r'[\s ]'), '');
  if (s.isEmpty || !RegExp(r'^[0-9][0-9.,]*$').hasMatch(s)) return null;
  final lastSep = [
    s.lastIndexOf('.'),
    s.lastIndexOf(','),
  ].reduce((a, b) => a > b ? a : b);
  String whole;
  var frac = '';
  if (lastSep >= 0 && digits > 0 && s.length - lastSep - 1 <= digits) {
    whole = s.substring(0, lastSep);
    frac = s.substring(lastSep + 1);
  } else {
    whole = s;
  }
  whole = whole.replaceAll(RegExp('[.,]'), '');
  if (whole.isEmpty) whole = '0';
  frac = frac.padRight(digits, '0');
  final value = int.tryParse('$whole$frac');
  return value == null || value <= 0 ? null : value;
}

/// An amount in minor units as an editable input string (`1234.50`).
String minorToInput(int minor, String currency) {
  final digits = minorUnitDigits(currency);
  if (digits == 0) return minor.toString();
  final abs = minor.abs().toString().padLeft(digits + 1, '0');
  final whole = abs.substring(0, abs.length - digits);
  final frac = abs.substring(abs.length - digits);
  return '${minor < 0 ? '-' : ''}$whole.$frac';
}

/// Payments of a side that wait for a manager (`pending_declared`).
List<Payment> declaredPayments(Iterable<Payment> payments) => [
  for (final p in payments)
    if (p.status == PaymentStatusEnum.pendingDeclared) p,
];

/// The statement of one side built from the ledger lists a resident may read
/// (`GET /charges` and `GET /payments`), for servers whose statement endpoint
/// refuses residents (it checks `units.read`). Charges are debits on their due
/// date, confirmed payments credits on the day received; the running balance
/// starts from zero at the first entry and the period filter only cuts the
/// lines (the opening balance carries what came before). The accrued late fee
/// and the total due come from the dashboard side, which the server computes.
Statement statementFromLedger({
  required StatementTarget target,
  required List<Charge> charges,
  required List<Payment> payments,
  required String currency,
  required String today,
  String? from,
  String? to,
  MySide? side,
}) {
  Money money(int amount) => Money(amount: amount, currency: currency);
  final kind = target.kind == 'owner'
      ? StatementLineDebtorKindEnum.owner
      : StatementLineDebtorKindEnum.tenant;
  final events =
      <_LedgerEvent>[
        for (final c in charges)
          if (c.status != ChargeStatusEnum.cancelled)
            _LedgerEvent(
              date: c.dueDate,
              debit: true,
              amount: c.amount.amount,
              text: (c.description ?? '').isEmpty
                  ? c.chargeType.value
                  : c.description!,
              type: 'charge',
              id: c.id,
            ),
        for (final p in payments)
          if (p.status == PaymentStatusEnum.confirmed)
            _LedgerEvent(
              date: p.receivedOn,
              debit: false,
              amount: p.net.amount,
              text: p.reference ?? '',
              type: 'payment',
              id: p.id,
            ),
      ]..sort((a, b) {
        final byDate = DateTime(
          a.date.year,
          a.date.month,
          a.date.day,
        ).compareTo(DateTime(b.date.year, b.date.month, b.date.day));
        if (byDate != 0) return byDate;
        return a.debit == b.debit ? 0 : (a.debit ? -1 : 1);
      });
  final fromDate = from == null ? null : DateTime.parse(from);
  final toDate = to == null ? DateTime.parse(today) : DateTime.parse(to);
  var balance = 0;
  var opening = 0;
  final lines = <StatementLine>[];
  for (final e in events) {
    final day = DateTime(e.date.year, e.date.month, e.date.day);
    balance += e.debit ? e.amount : -e.amount;
    if (fromDate != null && day.isBefore(fromDate)) {
      opening = balance;
      continue;
    }
    if (day.isAfter(toDate)) continue;
    lines.add(
      StatementLine(
        date: day,
        kind: e.debit
            ? StatementLineKindEnum.charge
            : StatementLineKindEnum.payment,
        description: e.text,
        refType: e.type,
        refId: e.id,
        debtorKind: kind,
        debtorDisplayName: null,
        principal: money(e.debit ? e.amount : 0),
        lateFee: money(0),
        // Signs as the server's lines: a negative charge (a waiver) is a
        // credit, never a negative debit.
        debit: money(e.signed > 0 ? e.signed : 0),
        credit: money(e.signed < 0 ? -e.signed : 0),
        balance: money(balance),
      ),
    );
  }
  final closing = lines.isEmpty ? opening : lines.last.balance.amount;
  // The dashboard figures are "today's": they only belong to a statement that
  // runs up to today (the server accrues to `min(today, to)`).
  final upToToday = !toDate.isBefore(DateTime.parse(today));
  final todays = upToToday ? side : null;
  final fee = todays?.accruedLateFee.amount ?? 0;
  return Statement(
    debtor: DebtorRef(
      mode: DebtorRefModeEnum.unitSide,
      unitId: target.unitId,
      debtorKind: target.kind == 'owner'
          ? DebtorRefDebtorKindEnum.owner
          : DebtorRefDebtorKindEnum.tenant,
    ),
    from:
        fromDate ??
        (events.isEmpty ? DateTime.parse(today) : events.first.date),
    to: toDate,
    openingBalance: money(opening),
    lines: lines,
    closingBalance: money(closing),
    accruedLateFee: money(fee),
    totalDue: todays?.total ?? money(closing + fee),
    credit: money(closing < 0 ? -closing : 0),
  );
}

class _LedgerEvent {
  const new({
    required this.date,
    required this.debit,
    required this.amount,
    required this.text,
    required this.type,
    required this.id,
  });

  final DateTime date;
  final bool debit;
  final int amount;
  final String text;
  final String type;
  final String id;

  /// Signed from the debtor's point of view: positive owes more.
  int get signed => debit ? amount : -amount;
}

/// The statement endpoint books the fee accrued so far as a last line
/// (a fee line, description `accrued`) and counts it in `closing_balance` and
/// `total_due`, while the contract also reports it as `accrued_late_fee`.
/// The screen shows the accrued fee as its own "not booked yet" row after the
/// booked lines (M4), so that line is taken out here and the closing balance
/// is the booked one again; the fee is then listed once and
/// `total_due == closing + accrued`.
Statement withoutAccruedLine(Statement s) {
  final fee = s.accruedLateFee.amount;
  if (fee <= 0 || s.lines.isEmpty) return s;
  final last = s.lines.last;
  if (last.description != 'accrued' ||
      last.lateFee.amount != fee ||
      last.debit.amount - last.credit.amount != fee) {
    return s;
  }
  final lines = s.lines.sublist(0, s.lines.length - 1);
  final booked = lines.isEmpty ? s.openingBalance : lines.last.balance;
  return Statement(
    debtor: s.debtor,
    from: s.from,
    to: s.to,
    openingBalance: s.openingBalance,
    lines: lines,
    closingBalance: booked,
    accruedLateFee: s.accruedLateFee,
    totalDue: s.totalDue,
    credit: s.credit,
  );
}
