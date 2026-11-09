// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debtor_ref.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DebtorRefCWProxy {
  DebtorRef mode(DebtorRefModeEnum mode);

  DebtorRef unitId(String? unitId);

  DebtorRef debtorKind(DebtorRefDebtorKindEnum? debtorKind);

  DebtorRef personId(String? personId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DebtorRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DebtorRef(...).copyWith(id: 12, name: "My name")
  /// ````
  DebtorRef call({
    DebtorRefModeEnum mode,
    String? unitId,
    DebtorRefDebtorKindEnum? debtorKind,
    String? personId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDebtorRef.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDebtorRef.copyWith.fieldName(...)`
class _$DebtorRefCWProxyImpl implements _$DebtorRefCWProxy {
  const _$DebtorRefCWProxyImpl(this._value);

  final DebtorRef _value;

  @override
  DebtorRef mode(DebtorRefModeEnum mode) => this(mode: mode);

  @override
  DebtorRef unitId(String? unitId) => this(unitId: unitId);

  @override
  DebtorRef debtorKind(DebtorRefDebtorKindEnum? debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  DebtorRef personId(String? personId) => this(personId: personId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DebtorRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DebtorRef(...).copyWith(id: 12, name: "My name")
  /// ````
  DebtorRef call({
    Object? mode = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
  }) {
    return DebtorRef(
      mode: mode == const $CopyWithPlaceholder()
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as DebtorRefModeEnum,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as DebtorRefDebtorKindEnum?,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
    );
  }
}

extension $DebtorRefCopyWith on DebtorRef {
  /// Returns a callable class that can be used as follows: `instanceOfDebtorRef.copyWith(...)` or like so:`instanceOfDebtorRef.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DebtorRefCWProxy get copyWith => _$DebtorRefCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DebtorRef _$DebtorRefFromJson(Map<String, dynamic> json) => $checkedCreate(
  'DebtorRef',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['mode']);
    final val = DebtorRef(
      mode: $checkedConvert(
        'mode',
        (v) => $enumDecode(
          _$DebtorRefModeEnumEnumMap,
          v,
          unknownValue: DebtorRefModeEnum.unknownDefaultOpenApi,
        ),
      ),
      unitId: $checkedConvert('unit_id', (v) => v as String?),
      debtorKind: $checkedConvert(
        'debtor_kind',
        (v) => $enumDecodeNullable(
          _$DebtorRefDebtorKindEnumEnumMap,
          v,
          unknownValue: DebtorRefDebtorKindEnum.unknownDefaultOpenApi,
        ),
      ),
      personId: $checkedConvert('person_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'unitId': 'unit_id',
    'debtorKind': 'debtor_kind',
    'personId': 'person_id',
  },
);

Map<String, dynamic> _$DebtorRefToJson(DebtorRef instance) => <String, dynamic>{
  'mode': _$DebtorRefModeEnumEnumMap[instance.mode]!,
  'unit_id': ?instance.unitId,
  'debtor_kind': ?_$DebtorRefDebtorKindEnumEnumMap[instance.debtorKind],
  'person_id': ?instance.personId,
};

const _$DebtorRefModeEnumEnumMap = {
  DebtorRefModeEnum.unitSide: 'unit_side',
  DebtorRefModeEnum.person: 'person',
  DebtorRefModeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$DebtorRefDebtorKindEnumEnumMap = {
  DebtorRefDebtorKindEnum.owner: 'owner',
  DebtorRefDebtorKindEnum.tenant: 'tenant',
  DebtorRefDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
