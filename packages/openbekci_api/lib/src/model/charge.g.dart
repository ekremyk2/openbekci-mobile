// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChargeCWProxy {
  Charge id(String id);

  Charge orgId(String orgId);

  Charge siteId(String siteId);

  Charge planId(String? planId);

  Charge unitId(String unitId);

  Charge unitDoorNumber(String unitDoorNumber);

  Charge debtorKind(ChargeDebtorKindEnum debtorKind);

  Charge debtorPersonId(String? debtorPersonId);

  Charge debtorDisplayName(String? debtorDisplayName);

  Charge chargeType(ChargeChargeTypeEnum chargeType);

  Charge period(String? period);

  Charge amount(Money amount);

  Charge paid(Money paid);

  Charge balance(Money balance);

  Charge dueDate(DateTime dueDate);

  Charge description(String? description);

  Charge allocationBasis(AllocationBasis? allocationBasis);

  Charge journalEntryId(String journalEntryId);

  Charge status(ChargeStatusEnum status);

  Charge cancelledReason(String? cancelledReason);

  Charge createdAt(DateTime createdAt);

  Charge updatedAt(DateTime updatedAt);

  Charge effectiveDebtor(EffectiveDebtor effectiveDebtor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Charge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Charge(...).copyWith(id: 12, name: "My name")
  /// ````
  Charge call({
    String id,
    String orgId,
    String siteId,
    String? planId,
    String unitId,
    String unitDoorNumber,
    ChargeDebtorKindEnum debtorKind,
    String? debtorPersonId,
    String? debtorDisplayName,
    ChargeChargeTypeEnum chargeType,
    String? period,
    Money amount,
    Money paid,
    Money balance,
    DateTime dueDate,
    String? description,
    AllocationBasis? allocationBasis,
    String journalEntryId,
    ChargeStatusEnum status,
    String? cancelledReason,
    DateTime createdAt,
    DateTime updatedAt,
    EffectiveDebtor effectiveDebtor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCharge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCharge.copyWith.fieldName(...)`
class _$ChargeCWProxyImpl implements _$ChargeCWProxy {
  const _$ChargeCWProxyImpl(this._value);

  final Charge _value;

  @override
  Charge id(String id) => this(id: id);

  @override
  Charge orgId(String orgId) => this(orgId: orgId);

  @override
  Charge siteId(String siteId) => this(siteId: siteId);

  @override
  Charge planId(String? planId) => this(planId: planId);

  @override
  Charge unitId(String unitId) => this(unitId: unitId);

  @override
  Charge unitDoorNumber(String unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  Charge debtorKind(ChargeDebtorKindEnum debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  Charge debtorPersonId(String? debtorPersonId) =>
      this(debtorPersonId: debtorPersonId);

  @override
  Charge debtorDisplayName(String? debtorDisplayName) =>
      this(debtorDisplayName: debtorDisplayName);

  @override
  Charge chargeType(ChargeChargeTypeEnum chargeType) =>
      this(chargeType: chargeType);

  @override
  Charge period(String? period) => this(period: period);

  @override
  Charge amount(Money amount) => this(amount: amount);

  @override
  Charge paid(Money paid) => this(paid: paid);

  @override
  Charge balance(Money balance) => this(balance: balance);

  @override
  Charge dueDate(DateTime dueDate) => this(dueDate: dueDate);

  @override
  Charge description(String? description) => this(description: description);

  @override
  Charge allocationBasis(AllocationBasis? allocationBasis) =>
      this(allocationBasis: allocationBasis);

  @override
  Charge journalEntryId(String journalEntryId) =>
      this(journalEntryId: journalEntryId);

  @override
  Charge status(ChargeStatusEnum status) => this(status: status);

  @override
  Charge cancelledReason(String? cancelledReason) =>
      this(cancelledReason: cancelledReason);

  @override
  Charge createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Charge updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Charge effectiveDebtor(EffectiveDebtor effectiveDebtor) =>
      this(effectiveDebtor: effectiveDebtor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Charge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Charge(...).copyWith(id: 12, name: "My name")
  /// ````
  Charge call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? planId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? debtorPersonId = const $CopyWithPlaceholder(),
    Object? debtorDisplayName = const $CopyWithPlaceholder(),
    Object? chargeType = const $CopyWithPlaceholder(),
    Object? period = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? paid = const $CopyWithPlaceholder(),
    Object? balance = const $CopyWithPlaceholder(),
    Object? dueDate = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? allocationBasis = const $CopyWithPlaceholder(),
    Object? journalEntryId = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? cancelledReason = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? effectiveDebtor = const $CopyWithPlaceholder(),
  }) {
    return Charge(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      planId: planId == const $CopyWithPlaceholder()
          ? _value.planId
          // ignore: cast_nullable_to_non_nullable
          : planId as String?,
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
          : debtorKind as ChargeDebtorKindEnum,
      debtorPersonId: debtorPersonId == const $CopyWithPlaceholder()
          ? _value.debtorPersonId
          // ignore: cast_nullable_to_non_nullable
          : debtorPersonId as String?,
      debtorDisplayName: debtorDisplayName == const $CopyWithPlaceholder()
          ? _value.debtorDisplayName
          // ignore: cast_nullable_to_non_nullable
          : debtorDisplayName as String?,
      chargeType: chargeType == const $CopyWithPlaceholder()
          ? _value.chargeType
          // ignore: cast_nullable_to_non_nullable
          : chargeType as ChargeChargeTypeEnum,
      period: period == const $CopyWithPlaceholder()
          ? _value.period
          // ignore: cast_nullable_to_non_nullable
          : period as String?,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as Money,
      paid: paid == const $CopyWithPlaceholder()
          ? _value.paid
          // ignore: cast_nullable_to_non_nullable
          : paid as Money,
      balance: balance == const $CopyWithPlaceholder()
          ? _value.balance
          // ignore: cast_nullable_to_non_nullable
          : balance as Money,
      dueDate: dueDate == const $CopyWithPlaceholder()
          ? _value.dueDate
          // ignore: cast_nullable_to_non_nullable
          : dueDate as DateTime,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      allocationBasis: allocationBasis == const $CopyWithPlaceholder()
          ? _value.allocationBasis
          // ignore: cast_nullable_to_non_nullable
          : allocationBasis as AllocationBasis?,
      journalEntryId: journalEntryId == const $CopyWithPlaceholder()
          ? _value.journalEntryId
          // ignore: cast_nullable_to_non_nullable
          : journalEntryId as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ChargeStatusEnum,
      cancelledReason: cancelledReason == const $CopyWithPlaceholder()
          ? _value.cancelledReason
          // ignore: cast_nullable_to_non_nullable
          : cancelledReason as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      effectiveDebtor: effectiveDebtor == const $CopyWithPlaceholder()
          ? _value.effectiveDebtor
          // ignore: cast_nullable_to_non_nullable
          : effectiveDebtor as EffectiveDebtor,
    );
  }
}

extension $ChargeCopyWith on Charge {
  /// Returns a callable class that can be used as follows: `instanceOfCharge.copyWith(...)` or like so:`instanceOfCharge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChargeCWProxy get copyWith => _$ChargeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Charge _$ChargeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Charge',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'plan_id',
        'unit_id',
        'unit_door_number',
        'debtor_kind',
        'debtor_person_id',
        'debtor_display_name',
        'charge_type',
        'period',
        'amount',
        'paid',
        'balance',
        'due_date',
        'description',
        'allocation_basis',
        'journal_entry_id',
        'status',
        'cancelled_reason',
        'created_at',
        'updated_at',
        'effective_debtor',
      ],
    );
    final val = Charge(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      planId: $checkedConvert('plan_id', (v) => v as String?),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String),
      debtorKind: $checkedConvert(
        'debtor_kind',
        (v) => $enumDecode(
          _$ChargeDebtorKindEnumEnumMap,
          v,
          unknownValue: ChargeDebtorKindEnum.unknownDefaultOpenApi,
        ),
      ),
      debtorPersonId: $checkedConvert('debtor_person_id', (v) => v as String?),
      debtorDisplayName: $checkedConvert(
        'debtor_display_name',
        (v) => v as String?,
      ),
      chargeType: $checkedConvert(
        'charge_type',
        (v) => $enumDecode(
          _$ChargeChargeTypeEnumEnumMap,
          v,
          unknownValue: ChargeChargeTypeEnum.unknownDefaultOpenApi,
        ),
      ),
      period: $checkedConvert('period', (v) => v as String?),
      amount: $checkedConvert(
        'amount',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      paid: $checkedConvert(
        'paid',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      balance: $checkedConvert(
        'balance',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      dueDate: $checkedConvert('due_date', (v) => DateTime.parse(v as String)),
      description: $checkedConvert('description', (v) => v as String?),
      allocationBasis: $checkedConvert(
        'allocation_basis',
        (v) => v == null
            ? null
            : AllocationBasis.fromJson(v as Map<String, dynamic>),
      ),
      journalEntryId: $checkedConvert('journal_entry_id', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$ChargeStatusEnumEnumMap,
          v,
          unknownValue: ChargeStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      cancelledReason: $checkedConvert('cancelled_reason', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      effectiveDebtor: $checkedConvert(
        'effective_debtor',
        (v) => EffectiveDebtor.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'planId': 'plan_id',
    'unitId': 'unit_id',
    'unitDoorNumber': 'unit_door_number',
    'debtorKind': 'debtor_kind',
    'debtorPersonId': 'debtor_person_id',
    'debtorDisplayName': 'debtor_display_name',
    'chargeType': 'charge_type',
    'dueDate': 'due_date',
    'allocationBasis': 'allocation_basis',
    'journalEntryId': 'journal_entry_id',
    'cancelledReason': 'cancelled_reason',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'effectiveDebtor': 'effective_debtor',
  },
);

Map<String, dynamic> _$ChargeToJson(Charge instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'plan_id': instance.planId,
  'unit_id': instance.unitId,
  'unit_door_number': instance.unitDoorNumber,
  'debtor_kind': _$ChargeDebtorKindEnumEnumMap[instance.debtorKind]!,
  'debtor_person_id': instance.debtorPersonId,
  'debtor_display_name': instance.debtorDisplayName,
  'charge_type': _$ChargeChargeTypeEnumEnumMap[instance.chargeType]!,
  'period': instance.period,
  'amount': instance.amount.toJson(),
  'paid': instance.paid.toJson(),
  'balance': instance.balance.toJson(),
  'due_date': instance.dueDate.toIso8601String(),
  'description': instance.description,
  'allocation_basis': instance.allocationBasis?.toJson(),
  'journal_entry_id': instance.journalEntryId,
  'status': _$ChargeStatusEnumEnumMap[instance.status]!,
  'cancelled_reason': instance.cancelledReason,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'effective_debtor': instance.effectiveDebtor.toJson(),
};

const _$ChargeDebtorKindEnumEnumMap = {
  ChargeDebtorKindEnum.owner: 'owner',
  ChargeDebtorKindEnum.tenant: 'tenant',
  ChargeDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$ChargeChargeTypeEnumEnumMap = {
  ChargeChargeTypeEnum.dues: 'dues',
  ChargeChargeTypeEnum.specialAssessment: 'special_assessment',
  ChargeChargeTypeEnum.reserveContribution: 'reserve_contribution',
  ChargeChargeTypeEnum.utility: 'utility',
  ChargeChargeTypeEnum.bookingFee: 'booking_fee',
  ChargeChargeTypeEnum.legalCost: 'legal_cost',
  ChargeChargeTypeEnum.deposit: 'deposit',
  ChargeChargeTypeEnum.adjustment: 'adjustment',
  ChargeChargeTypeEnum.settlement: 'settlement',
  ChargeChargeTypeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$ChargeStatusEnumEnumMap = {
  ChargeStatusEnum.open: 'open',
  ChargeStatusEnum.partiallyPaid: 'partially_paid',
  ChargeStatusEnum.paid: 'paid',
  ChargeStatusEnum.cancelled: 'cancelled',
  ChargeStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
