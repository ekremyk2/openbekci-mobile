// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_claim_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnitClaimCreateCWProxy {
  UnitClaimCreate unitId(String unitId);

  UnitClaimCreate claimedRole(UnitClaimCreateClaimedRoleEnum claimedRole);

  UnitClaimCreate note(String? note);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnitClaimCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnitClaimCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  UnitClaimCreate call({
    String unitId,
    UnitClaimCreateClaimedRoleEnum claimedRole,
    String? note,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnitClaimCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnitClaimCreate.copyWith.fieldName(...)`
class _$UnitClaimCreateCWProxyImpl implements _$UnitClaimCreateCWProxy {
  const _$UnitClaimCreateCWProxyImpl(this._value);

  final UnitClaimCreate _value;

  @override
  UnitClaimCreate unitId(String unitId) => this(unitId: unitId);

  @override
  UnitClaimCreate claimedRole(UnitClaimCreateClaimedRoleEnum claimedRole) =>
      this(claimedRole: claimedRole);

  @override
  UnitClaimCreate note(String? note) => this(note: note);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnitClaimCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnitClaimCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  UnitClaimCreate call({
    Object? unitId = const $CopyWithPlaceholder(),
    Object? claimedRole = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return UnitClaimCreate(
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      claimedRole: claimedRole == const $CopyWithPlaceholder()
          ? _value.claimedRole
          // ignore: cast_nullable_to_non_nullable
          : claimedRole as UnitClaimCreateClaimedRoleEnum,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $UnitClaimCreateCopyWith on UnitClaimCreate {
  /// Returns a callable class that can be used as follows: `instanceOfUnitClaimCreate.copyWith(...)` or like so:`instanceOfUnitClaimCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnitClaimCreateCWProxy get copyWith => _$UnitClaimCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitClaimCreate _$UnitClaimCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UnitClaimCreate',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['unit_id', 'claimed_role']);
        final val = UnitClaimCreate(
          unitId: $checkedConvert('unit_id', (v) => v as String),
          claimedRole: $checkedConvert(
            'claimed_role',
            (v) => $enumDecode(
              _$UnitClaimCreateClaimedRoleEnumEnumMap,
              v,
              unknownValue:
                  UnitClaimCreateClaimedRoleEnum.unknownDefaultOpenApi,
            ),
          ),
          note: $checkedConvert('note', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'unitId': 'unit_id', 'claimedRole': 'claimed_role'},
    );

Map<String, dynamic> _$UnitClaimCreateToJson(UnitClaimCreate instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'claimed_role':
          _$UnitClaimCreateClaimedRoleEnumEnumMap[instance.claimedRole]!,
      'note': ?instance.note,
    };

const _$UnitClaimCreateClaimedRoleEnumEnumMap = {
  UnitClaimCreateClaimedRoleEnum.owner: 'owner',
  UnitClaimCreateClaimedRoleEnum.tenant: 'tenant',
  UnitClaimCreateClaimedRoleEnum.household: 'household',
  UnitClaimCreateClaimedRoleEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
