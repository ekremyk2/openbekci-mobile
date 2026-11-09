// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StatementCWProxy {
  Statement debtor(DebtorRef debtor);

  Statement from(DateTime from);

  Statement to(DateTime to);

  Statement openingBalance(Money openingBalance);

  Statement lines(List<StatementLine> lines);

  Statement closingBalance(Money closingBalance);

  Statement accruedLateFee(Money accruedLateFee);

  Statement totalDue(Money totalDue);

  Statement credit(Money credit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Statement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Statement(...).copyWith(id: 12, name: "My name")
  /// ````
  Statement call({
    DebtorRef debtor,
    DateTime from,
    DateTime to,
    Money openingBalance,
    List<StatementLine> lines,
    Money closingBalance,
    Money accruedLateFee,
    Money totalDue,
    Money credit,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStatement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStatement.copyWith.fieldName(...)`
class _$StatementCWProxyImpl implements _$StatementCWProxy {
  const _$StatementCWProxyImpl(this._value);

  final Statement _value;

  @override
  Statement debtor(DebtorRef debtor) => this(debtor: debtor);

  @override
  Statement from(DateTime from) => this(from: from);

  @override
  Statement to(DateTime to) => this(to: to);

  @override
  Statement openingBalance(Money openingBalance) =>
      this(openingBalance: openingBalance);

  @override
  Statement lines(List<StatementLine> lines) => this(lines: lines);

  @override
  Statement closingBalance(Money closingBalance) =>
      this(closingBalance: closingBalance);

  @override
  Statement accruedLateFee(Money accruedLateFee) =>
      this(accruedLateFee: accruedLateFee);

  @override
  Statement totalDue(Money totalDue) => this(totalDue: totalDue);

  @override
  Statement credit(Money credit) => this(credit: credit);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Statement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Statement(...).copyWith(id: 12, name: "My name")
  /// ````
  Statement call({
    Object? debtor = const $CopyWithPlaceholder(),
    Object? from = const $CopyWithPlaceholder(),
    Object? to = const $CopyWithPlaceholder(),
    Object? openingBalance = const $CopyWithPlaceholder(),
    Object? lines = const $CopyWithPlaceholder(),
    Object? closingBalance = const $CopyWithPlaceholder(),
    Object? accruedLateFee = const $CopyWithPlaceholder(),
    Object? totalDue = const $CopyWithPlaceholder(),
    Object? credit = const $CopyWithPlaceholder(),
  }) {
    return Statement(
      debtor: debtor == const $CopyWithPlaceholder()
          ? _value.debtor
          // ignore: cast_nullable_to_non_nullable
          : debtor as DebtorRef,
      from: from == const $CopyWithPlaceholder()
          ? _value.from
          // ignore: cast_nullable_to_non_nullable
          : from as DateTime,
      to: to == const $CopyWithPlaceholder()
          ? _value.to
          // ignore: cast_nullable_to_non_nullable
          : to as DateTime,
      openingBalance: openingBalance == const $CopyWithPlaceholder()
          ? _value.openingBalance
          // ignore: cast_nullable_to_non_nullable
          : openingBalance as Money,
      lines: lines == const $CopyWithPlaceholder()
          ? _value.lines
          // ignore: cast_nullable_to_non_nullable
          : lines as List<StatementLine>,
      closingBalance: closingBalance == const $CopyWithPlaceholder()
          ? _value.closingBalance
          // ignore: cast_nullable_to_non_nullable
          : closingBalance as Money,
      accruedLateFee: accruedLateFee == const $CopyWithPlaceholder()
          ? _value.accruedLateFee
          // ignore: cast_nullable_to_non_nullable
          : accruedLateFee as Money,
      totalDue: totalDue == const $CopyWithPlaceholder()
          ? _value.totalDue
          // ignore: cast_nullable_to_non_nullable
          : totalDue as Money,
      credit: credit == const $CopyWithPlaceholder()
          ? _value.credit
          // ignore: cast_nullable_to_non_nullable
          : credit as Money,
    );
  }
}

extension $StatementCopyWith on Statement {
  /// Returns a callable class that can be used as follows: `instanceOfStatement.copyWith(...)` or like so:`instanceOfStatement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StatementCWProxy get copyWith => _$StatementCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statement _$StatementFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Statement',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'debtor',
        'from',
        'to',
        'opening_balance',
        'lines',
        'closing_balance',
        'accrued_late_fee',
        'total_due',
        'credit',
      ],
    );
    final val = Statement(
      debtor: $checkedConvert(
        'debtor',
        (v) => DebtorRef.fromJson(v as Map<String, dynamic>),
      ),
      from: $checkedConvert('from', (v) => DateTime.parse(v as String)),
      to: $checkedConvert('to', (v) => DateTime.parse(v as String)),
      openingBalance: $checkedConvert(
        'opening_balance',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      lines: $checkedConvert(
        'lines',
        (v) => (v as List<dynamic>)
            .map((e) => StatementLine.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      closingBalance: $checkedConvert(
        'closing_balance',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      accruedLateFee: $checkedConvert(
        'accrued_late_fee',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      totalDue: $checkedConvert(
        'total_due',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      credit: $checkedConvert(
        'credit',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'openingBalance': 'opening_balance',
    'closingBalance': 'closing_balance',
    'accruedLateFee': 'accrued_late_fee',
    'totalDue': 'total_due',
  },
);

Map<String, dynamic> _$StatementToJson(Statement instance) => <String, dynamic>{
  'debtor': instance.debtor.toJson(),
  'from': instance.from.toIso8601String(),
  'to': instance.to.toIso8601String(),
  'opening_balance': instance.openingBalance.toJson(),
  'lines': instance.lines.map((e) => e.toJson()).toList(),
  'closing_balance': instance.closingBalance.toJson(),
  'accrued_late_fee': instance.accruedLateFee.toJson(),
  'total_due': instance.totalDue.toJson(),
  'credit': instance.credit.toJson(),
};
