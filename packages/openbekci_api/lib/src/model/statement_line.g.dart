// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_line.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StatementLineCWProxy {
  StatementLine date(DateTime date);

  StatementLine kind(StatementLineKindEnum kind);

  StatementLine description(String description);

  StatementLine refType(String? refType);

  StatementLine refId(String? refId);

  StatementLine debtorKind(StatementLineDebtorKindEnum? debtorKind);

  StatementLine debtorDisplayName(String? debtorDisplayName);

  StatementLine principal(Money principal);

  StatementLine lateFee(Money lateFee);

  StatementLine debit(Money debit);

  StatementLine credit(Money credit);

  StatementLine balance(Money balance);

  StatementLine accrued(bool? accrued);

  StatementLine declaredAmount(Money? declaredAmount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StatementLine(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StatementLine(...).copyWith(id: 12, name: "My name")
  /// ````
  StatementLine call({
    DateTime date,
    StatementLineKindEnum kind,
    String description,
    String? refType,
    String? refId,
    StatementLineDebtorKindEnum? debtorKind,
    String? debtorDisplayName,
    Money principal,
    Money lateFee,
    Money debit,
    Money credit,
    Money balance,
    bool? accrued,
    Money? declaredAmount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStatementLine.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStatementLine.copyWith.fieldName(...)`
class _$StatementLineCWProxyImpl implements _$StatementLineCWProxy {
  const _$StatementLineCWProxyImpl(this._value);

  final StatementLine _value;

  @override
  StatementLine date(DateTime date) => this(date: date);

  @override
  StatementLine kind(StatementLineKindEnum kind) => this(kind: kind);

  @override
  StatementLine description(String description) =>
      this(description: description);

  @override
  StatementLine refType(String? refType) => this(refType: refType);

  @override
  StatementLine refId(String? refId) => this(refId: refId);

  @override
  StatementLine debtorKind(StatementLineDebtorKindEnum? debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  StatementLine debtorDisplayName(String? debtorDisplayName) =>
      this(debtorDisplayName: debtorDisplayName);

  @override
  StatementLine principal(Money principal) => this(principal: principal);

  @override
  StatementLine lateFee(Money lateFee) => this(lateFee: lateFee);

  @override
  StatementLine debit(Money debit) => this(debit: debit);

  @override
  StatementLine credit(Money credit) => this(credit: credit);

  @override
  StatementLine balance(Money balance) => this(balance: balance);

  @override
  StatementLine accrued(bool? accrued) => this(accrued: accrued);

  @override
  StatementLine declaredAmount(Money? declaredAmount) =>
      this(declaredAmount: declaredAmount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StatementLine(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StatementLine(...).copyWith(id: 12, name: "My name")
  /// ````
  StatementLine call({
    Object? date = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? refType = const $CopyWithPlaceholder(),
    Object? refId = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? debtorDisplayName = const $CopyWithPlaceholder(),
    Object? principal = const $CopyWithPlaceholder(),
    Object? lateFee = const $CopyWithPlaceholder(),
    Object? debit = const $CopyWithPlaceholder(),
    Object? credit = const $CopyWithPlaceholder(),
    Object? balance = const $CopyWithPlaceholder(),
    Object? accrued = const $CopyWithPlaceholder(),
    Object? declaredAmount = const $CopyWithPlaceholder(),
  }) {
    return StatementLine(
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as StatementLineKindEnum,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      refType: refType == const $CopyWithPlaceholder()
          ? _value.refType
          // ignore: cast_nullable_to_non_nullable
          : refType as String?,
      refId: refId == const $CopyWithPlaceholder()
          ? _value.refId
          // ignore: cast_nullable_to_non_nullable
          : refId as String?,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as StatementLineDebtorKindEnum?,
      debtorDisplayName: debtorDisplayName == const $CopyWithPlaceholder()
          ? _value.debtorDisplayName
          // ignore: cast_nullable_to_non_nullable
          : debtorDisplayName as String?,
      principal: principal == const $CopyWithPlaceholder()
          ? _value.principal
          // ignore: cast_nullable_to_non_nullable
          : principal as Money,
      lateFee: lateFee == const $CopyWithPlaceholder()
          ? _value.lateFee
          // ignore: cast_nullable_to_non_nullable
          : lateFee as Money,
      debit: debit == const $CopyWithPlaceholder()
          ? _value.debit
          // ignore: cast_nullable_to_non_nullable
          : debit as Money,
      credit: credit == const $CopyWithPlaceholder()
          ? _value.credit
          // ignore: cast_nullable_to_non_nullable
          : credit as Money,
      balance: balance == const $CopyWithPlaceholder()
          ? _value.balance
          // ignore: cast_nullable_to_non_nullable
          : balance as Money,
      accrued: accrued == const $CopyWithPlaceholder()
          ? _value.accrued
          // ignore: cast_nullable_to_non_nullable
          : accrued as bool?,
      declaredAmount: declaredAmount == const $CopyWithPlaceholder()
          ? _value.declaredAmount
          // ignore: cast_nullable_to_non_nullable
          : declaredAmount as Money?,
    );
  }
}

extension $StatementLineCopyWith on StatementLine {
  /// Returns a callable class that can be used as follows: `instanceOfStatementLine.copyWith(...)` or like so:`instanceOfStatementLine.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StatementLineCWProxy get copyWith => _$StatementLineCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementLine _$StatementLineFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StatementLine',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'date',
            'kind',
            'description',
            'ref_type',
            'ref_id',
            'debtor_kind',
            'debtor_display_name',
            'principal',
            'late_fee',
            'debit',
            'credit',
            'balance',
          ],
        );
        final val = StatementLine(
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecode(
              _$StatementLineKindEnumEnumMap,
              v,
              unknownValue: StatementLineKindEnum.unknownDefaultOpenApi,
            ),
          ),
          description: $checkedConvert('description', (v) => v as String),
          refType: $checkedConvert('ref_type', (v) => v as String?),
          refId: $checkedConvert('ref_id', (v) => v as String?),
          debtorKind: $checkedConvert(
            'debtor_kind',
            (v) => $enumDecodeNullable(
              _$StatementLineDebtorKindEnumEnumMap,
              v,
              unknownValue: StatementLineDebtorKindEnum.unknownDefaultOpenApi,
            ),
          ),
          debtorDisplayName: $checkedConvert(
            'debtor_display_name',
            (v) => v as String?,
          ),
          principal: $checkedConvert(
            'principal',
            (v) => Money.fromJson(v as Map<String, dynamic>),
          ),
          lateFee: $checkedConvert(
            'late_fee',
            (v) => Money.fromJson(v as Map<String, dynamic>),
          ),
          debit: $checkedConvert(
            'debit',
            (v) => Money.fromJson(v as Map<String, dynamic>),
          ),
          credit: $checkedConvert(
            'credit',
            (v) => Money.fromJson(v as Map<String, dynamic>),
          ),
          balance: $checkedConvert(
            'balance',
            (v) => Money.fromJson(v as Map<String, dynamic>),
          ),
          accrued: $checkedConvert('accrued', (v) => v as bool?),
          declaredAmount: $checkedConvert(
            'declared_amount',
            (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'refType': 'ref_type',
        'refId': 'ref_id',
        'debtorKind': 'debtor_kind',
        'debtorDisplayName': 'debtor_display_name',
        'lateFee': 'late_fee',
        'declaredAmount': 'declared_amount',
      },
    );

Map<String, dynamic> _$StatementLineToJson(StatementLine instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'kind': _$StatementLineKindEnumEnumMap[instance.kind]!,
      'description': instance.description,
      'ref_type': instance.refType,
      'ref_id': instance.refId,
      'debtor_kind': _$StatementLineDebtorKindEnumEnumMap[instance.debtorKind],
      'debtor_display_name': instance.debtorDisplayName,
      'principal': instance.principal.toJson(),
      'late_fee': instance.lateFee.toJson(),
      'debit': instance.debit.toJson(),
      'credit': instance.credit.toJson(),
      'balance': instance.balance.toJson(),
      'accrued': ?instance.accrued,
      'declared_amount': ?instance.declaredAmount?.toJson(),
    };

const _$StatementLineKindEnumEnumMap = {
  StatementLineKindEnum.opening: 'opening',
  StatementLineKindEnum.charge: 'charge',
  StatementLineKindEnum.payment: 'payment',
  StatementLineKindEnum.lateFee: 'late_fee',
  StatementLineKindEnum.credit: 'credit',
  StatementLineKindEnum.refund: 'refund',
  StatementLineKindEnum.adjustment: 'adjustment',
  StatementLineKindEnum.reversal: 'reversal',
  StatementLineKindEnum.fee: 'fee',
  StatementLineKindEnum.waiver: 'waiver',
  StatementLineKindEnum.declaredPayment: 'declared_payment',
  StatementLineKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$StatementLineDebtorKindEnumEnumMap = {
  StatementLineDebtorKindEnum.owner: 'owner',
  StatementLineDebtorKindEnum.tenant: 'tenant',
  StatementLineDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
