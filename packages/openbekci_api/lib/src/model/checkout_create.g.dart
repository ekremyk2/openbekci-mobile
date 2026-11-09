// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckoutCreateCWProxy {
  CheckoutCreate unitId(String unitId);

  CheckoutCreate debtorKind(CheckoutCreateDebtorKindEnum debtorKind);

  CheckoutCreate chargeIds(List<String>? chargeIds);

  CheckoutCreate amount(Money? amount);

  CheckoutCreate client(CheckoutCreateClientEnum? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckoutCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckoutCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckoutCreate call({
    String unitId,
    CheckoutCreateDebtorKindEnum debtorKind,
    List<String>? chargeIds,
    Money? amount,
    CheckoutCreateClientEnum? client,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCheckoutCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCheckoutCreate.copyWith.fieldName(...)`
class _$CheckoutCreateCWProxyImpl implements _$CheckoutCreateCWProxy {
  const _$CheckoutCreateCWProxyImpl(this._value);

  final CheckoutCreate _value;

  @override
  CheckoutCreate unitId(String unitId) => this(unitId: unitId);

  @override
  CheckoutCreate debtorKind(CheckoutCreateDebtorKindEnum debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  CheckoutCreate chargeIds(List<String>? chargeIds) =>
      this(chargeIds: chargeIds);

  @override
  CheckoutCreate amount(Money? amount) => this(amount: amount);

  @override
  CheckoutCreate client(CheckoutCreateClientEnum? client) =>
      this(client: client);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckoutCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckoutCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckoutCreate call({
    Object? unitId = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? chargeIds = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) {
    return CheckoutCreate(
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as CheckoutCreateDebtorKindEnum,
      chargeIds: chargeIds == const $CopyWithPlaceholder()
          ? _value.chargeIds
          // ignore: cast_nullable_to_non_nullable
          : chargeIds as List<String>?,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as Money?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as CheckoutCreateClientEnum?,
    );
  }
}

extension $CheckoutCreateCopyWith on CheckoutCreate {
  /// Returns a callable class that can be used as follows: `instanceOfCheckoutCreate.copyWith(...)` or like so:`instanceOfCheckoutCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckoutCreateCWProxy get copyWith => _$CheckoutCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutCreate _$CheckoutCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CheckoutCreate',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['unit_id', 'debtor_kind']);
        final val = CheckoutCreate(
          unitId: $checkedConvert('unit_id', (v) => v as String),
          debtorKind: $checkedConvert(
            'debtor_kind',
            (v) => $enumDecode(
              _$CheckoutCreateDebtorKindEnumEnumMap,
              v,
              unknownValue: CheckoutCreateDebtorKindEnum.unknownDefaultOpenApi,
            ),
          ),
          chargeIds: $checkedConvert(
            'charge_ids',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          amount: $checkedConvert(
            'amount',
            (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
          ),
          client: $checkedConvert(
            'client',
            (v) =>
                $enumDecodeNullable(
                  _$CheckoutCreateClientEnumEnumMap,
                  v,
                  unknownValue: CheckoutCreateClientEnum.unknownDefaultOpenApi,
                ) ??
                CheckoutCreateClientEnum.web,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'unitId': 'unit_id',
        'debtorKind': 'debtor_kind',
        'chargeIds': 'charge_ids',
      },
    );

Map<String, dynamic> _$CheckoutCreateToJson(
  CheckoutCreate instance,
) => <String, dynamic>{
  'unit_id': instance.unitId,
  'debtor_kind': _$CheckoutCreateDebtorKindEnumEnumMap[instance.debtorKind]!,
  'charge_ids': ?instance.chargeIds,
  'amount': ?instance.amount?.toJson(),
  'client': ?_$CheckoutCreateClientEnumEnumMap[instance.client],
};

const _$CheckoutCreateDebtorKindEnumEnumMap = {
  CheckoutCreateDebtorKindEnum.owner: 'owner',
  CheckoutCreateDebtorKindEnum.tenant: 'tenant',
  CheckoutCreateDebtorKindEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$CheckoutCreateClientEnumEnumMap = {
  CheckoutCreateClientEnum.web: 'web',
  CheckoutCreateClientEnum.mobile: 'mobile',
  CheckoutCreateClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
