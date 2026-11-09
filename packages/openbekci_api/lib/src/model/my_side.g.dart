// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_side.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MySideCWProxy {
  MySide unitId(String unitId);

  MySide unitDoorNumber(String unitDoorNumber);

  MySide debtorKind(MySideDebtorKindEnum debtorKind);

  MySide principal(Money principal);

  MySide accruedLateFee(Money accruedLateFee);

  MySide total(Money total);

  MySide credit(Money credit);

  MySide nextDueDate(DateTime? nextDueDate);

  MySide bankDetails(BankDetails? bankDetails);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MySide(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MySide(...).copyWith(id: 12, name: "My name")
  /// ````
  MySide call({
    String unitId,
    String unitDoorNumber,
    MySideDebtorKindEnum debtorKind,
    Money principal,
    Money accruedLateFee,
    Money total,
    Money credit,
    DateTime? nextDueDate,
    BankDetails? bankDetails,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMySide.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMySide.copyWith.fieldName(...)`
class _$MySideCWProxyImpl implements _$MySideCWProxy {
  const _$MySideCWProxyImpl(this._value);

  final MySide _value;

  @override
  MySide unitId(String unitId) => this(unitId: unitId);

  @override
  MySide unitDoorNumber(String unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  MySide debtorKind(MySideDebtorKindEnum debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  MySide principal(Money principal) => this(principal: principal);

  @override
  MySide accruedLateFee(Money accruedLateFee) =>
      this(accruedLateFee: accruedLateFee);

  @override
  MySide total(Money total) => this(total: total);

  @override
  MySide credit(Money credit) => this(credit: credit);

  @override
  MySide nextDueDate(DateTime? nextDueDate) => this(nextDueDate: nextDueDate);

  @override
  MySide bankDetails(BankDetails? bankDetails) =>
      this(bankDetails: bankDetails);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MySide(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MySide(...).copyWith(id: 12, name: "My name")
  /// ````
  MySide call({
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? principal = const $CopyWithPlaceholder(),
    Object? accruedLateFee = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? credit = const $CopyWithPlaceholder(),
    Object? nextDueDate = const $CopyWithPlaceholder(),
    Object? bankDetails = const $CopyWithPlaceholder(),
  }) {
    return MySide(
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      unitDoorNumber: unitDoorNumber == const $CopyWithPlaceholder()
          ? _value.unitDoorNumber
          // ignore: cast_nullable_to_non_nullable
          : unitDoorNumber as String,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as MySideDebtorKindEnum,
      principal: principal == const $CopyWithPlaceholder()
          ? _value.principal
          // ignore: cast_nullable_to_non_nullable
          : principal as Money,
      accruedLateFee: accruedLateFee == const $CopyWithPlaceholder()
          ? _value.accruedLateFee
          // ignore: cast_nullable_to_non_nullable
          : accruedLateFee as Money,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as Money,
      credit: credit == const $CopyWithPlaceholder()
          ? _value.credit
          // ignore: cast_nullable_to_non_nullable
          : credit as Money,
      nextDueDate: nextDueDate == const $CopyWithPlaceholder()
          ? _value.nextDueDate
          // ignore: cast_nullable_to_non_nullable
          : nextDueDate as DateTime?,
      bankDetails: bankDetails == const $CopyWithPlaceholder()
          ? _value.bankDetails
          // ignore: cast_nullable_to_non_nullable
          : bankDetails as BankDetails?,
    );
  }
}

extension $MySideCopyWith on MySide {
  /// Returns a callable class that can be used as follows: `instanceOfMySide.copyWith(...)` or like so:`instanceOfMySide.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MySideCWProxy get copyWith => _$MySideCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySide _$MySideFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MySide',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'unit_id',
        'unit_door_number',
        'debtor_kind',
        'principal',
        'accrued_late_fee',
        'total',
        'credit',
        'next_due_date',
        'bank_details',
      ],
    );
    final val = MySide(
      unitId: $checkedConvert('unit_id', (v) => v as String),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String),
      debtorKind: $checkedConvert(
        'debtor_kind',
        (v) => $enumDecode(
          _$MySideDebtorKindEnumEnumMap,
          v,
          unknownValue: MySideDebtorKindEnum.unknownDefaultOpenApi,
        ),
      ),
      principal: $checkedConvert(
        'principal',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      accruedLateFee: $checkedConvert(
        'accrued_late_fee',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      total: $checkedConvert(
        'total',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      credit: $checkedConvert(
        'credit',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      nextDueDate: $checkedConvert(
        'next_due_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      bankDetails: $checkedConvert(
        'bank_details',
        (v) =>
            v == null ? null : BankDetails.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'unitId': 'unit_id',
    'unitDoorNumber': 'unit_door_number',
    'debtorKind': 'debtor_kind',
    'accruedLateFee': 'accrued_late_fee',
    'nextDueDate': 'next_due_date',
    'bankDetails': 'bank_details',
  },
);

Map<String, dynamic> _$MySideToJson(MySide instance) => <String, dynamic>{
  'unit_id': instance.unitId,
  'unit_door_number': instance.unitDoorNumber,
  'debtor_kind': _$MySideDebtorKindEnumEnumMap[instance.debtorKind]!,
  'principal': instance.principal.toJson(),
  'accrued_late_fee': instance.accruedLateFee.toJson(),
  'total': instance.total.toJson(),
  'credit': instance.credit.toJson(),
  'next_due_date': instance.nextDueDate?.toIso8601String(),
  'bank_details': instance.bankDetails?.toJson(),
};

const _$MySideDebtorKindEnumEnumMap = {
  MySideDebtorKindEnum.owner: 'owner',
  MySideDebtorKindEnum.tenant: 'tenant',
  MySideDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
