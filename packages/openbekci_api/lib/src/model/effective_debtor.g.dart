// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effective_debtor.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EffectiveDebtorCWProxy {
  EffectiveDebtor debtorKind(EffectiveDebtorDebtorKindEnum debtorKind);

  EffectiveDebtor personId(String? personId);

  EffectiveDebtor displayName(String? displayName);

  EffectiveDebtor source_(EffectiveDebtorSource_Enum source_);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EffectiveDebtor(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EffectiveDebtor(...).copyWith(id: 12, name: "My name")
  /// ````
  EffectiveDebtor call({
    EffectiveDebtorDebtorKindEnum debtorKind,
    String? personId,
    String? displayName,
    EffectiveDebtorSource_Enum source_,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEffectiveDebtor.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEffectiveDebtor.copyWith.fieldName(...)`
class _$EffectiveDebtorCWProxyImpl implements _$EffectiveDebtorCWProxy {
  const _$EffectiveDebtorCWProxyImpl(this._value);

  final EffectiveDebtor _value;

  @override
  EffectiveDebtor debtorKind(EffectiveDebtorDebtorKindEnum debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  EffectiveDebtor personId(String? personId) => this(personId: personId);

  @override
  EffectiveDebtor displayName(String? displayName) =>
      this(displayName: displayName);

  @override
  EffectiveDebtor source_(EffectiveDebtorSource_Enum source_) =>
      this(source_: source_);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EffectiveDebtor(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EffectiveDebtor(...).copyWith(id: 12, name: "My name")
  /// ````
  EffectiveDebtor call({
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
  }) {
    return EffectiveDebtor(
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as EffectiveDebtorDebtorKindEnum,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as EffectiveDebtorSource_Enum,
    );
  }
}

extension $EffectiveDebtorCopyWith on EffectiveDebtor {
  /// Returns a callable class that can be used as follows: `instanceOfEffectiveDebtor.copyWith(...)` or like so:`instanceOfEffectiveDebtor.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EffectiveDebtorCWProxy get copyWith => _$EffectiveDebtorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EffectiveDebtor _$EffectiveDebtorFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EffectiveDebtor',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'debtor_kind',
            'person_id',
            'display_name',
            'source',
          ],
        );
        final val = EffectiveDebtor(
          debtorKind: $checkedConvert(
            'debtor_kind',
            (v) => $enumDecode(
              _$EffectiveDebtorDebtorKindEnumEnumMap,
              v,
              unknownValue: EffectiveDebtorDebtorKindEnum.unknownDefaultOpenApi,
            ),
          ),
          personId: $checkedConvert('person_id', (v) => v as String?),
          displayName: $checkedConvert('display_name', (v) => v as String?),
          source_: $checkedConvert(
            'source',
            (v) => $enumDecode(
              _$EffectiveDebtorSource_EnumEnumMap,
              v,
              unknownValue: EffectiveDebtorSource_Enum.unknownDefaultOpenApi,
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'debtorKind': 'debtor_kind',
        'personId': 'person_id',
        'displayName': 'display_name',
        'source_': 'source',
      },
    );

Map<String, dynamic> _$EffectiveDebtorToJson(
  EffectiveDebtor instance,
) => <String, dynamic>{
  'debtor_kind': _$EffectiveDebtorDebtorKindEnumEnumMap[instance.debtorKind]!,
  'person_id': instance.personId,
  'display_name': instance.displayName,
  'source': _$EffectiveDebtorSource_EnumEnumMap[instance.source_]!,
};

const _$EffectiveDebtorDebtorKindEnumEnumMap = {
  EffectiveDebtorDebtorKindEnum.owner: 'owner',
  EffectiveDebtorDebtorKindEnum.tenant: 'tenant',
  EffectiveDebtorDebtorKindEnum.person: 'person',
  EffectiveDebtorDebtorKindEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$EffectiveDebtorSource_EnumEnumMap = {
  EffectiveDebtorSource_Enum.charge: 'charge',
  EffectiveDebtorSource_Enum.unitOverride: 'unit_override',
  EffectiveDebtorSource_Enum.planDefault: 'plan_default',
  EffectiveDebtorSource_Enum.carried: 'carried',
  EffectiveDebtorSource_Enum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
