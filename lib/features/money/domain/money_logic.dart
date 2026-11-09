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
