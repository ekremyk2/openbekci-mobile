// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_occupancy.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeOccupancyCWProxy {
  MeOccupancy id(String id);

  MeOccupancy orgId(String orgId);

  MeOccupancy siteId(String siteId);

  MeOccupancy unitId(String unitId);

  MeOccupancy unitLabel(String unitLabel);

  MeOccupancy kind(MeOccupancyKindEnum kind);

  MeOccupancy side(MeOccupancySideEnum? side);

  MeOccupancy maySeeMoney(bool maySeeMoney);

  MeOccupancy validFrom(DateTime validFrom);

  MeOccupancy validTo(DateTime? validTo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeOccupancy(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeOccupancy(...).copyWith(id: 12, name: "My name")
  /// ````
  MeOccupancy call({
    String id,
    String orgId,
    String siteId,
    String unitId,
    String unitLabel,
    MeOccupancyKindEnum kind,
    MeOccupancySideEnum? side,
    bool maySeeMoney,
    DateTime validFrom,
    DateTime? validTo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeOccupancy.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeOccupancy.copyWith.fieldName(...)`
class _$MeOccupancyCWProxyImpl implements _$MeOccupancyCWProxy {
  const _$MeOccupancyCWProxyImpl(this._value);

  final MeOccupancy _value;

  @override
  MeOccupancy id(String id) => this(id: id);

  @override
  MeOccupancy orgId(String orgId) => this(orgId: orgId);

  @override
  MeOccupancy siteId(String siteId) => this(siteId: siteId);

  @override
  MeOccupancy unitId(String unitId) => this(unitId: unitId);

  @override
  MeOccupancy unitLabel(String unitLabel) => this(unitLabel: unitLabel);

  @override
  MeOccupancy kind(MeOccupancyKindEnum kind) => this(kind: kind);

  @override
  MeOccupancy side(MeOccupancySideEnum? side) => this(side: side);

  @override
  MeOccupancy maySeeMoney(bool maySeeMoney) => this(maySeeMoney: maySeeMoney);

  @override
  MeOccupancy validFrom(DateTime validFrom) => this(validFrom: validFrom);

  @override
  MeOccupancy validTo(DateTime? validTo) => this(validTo: validTo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeOccupancy(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeOccupancy(...).copyWith(id: 12, name: "My name")
  /// ````
  MeOccupancy call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitLabel = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? side = const $CopyWithPlaceholder(),
    Object? maySeeMoney = const $CopyWithPlaceholder(),
    Object? validFrom = const $CopyWithPlaceholder(),
    Object? validTo = const $CopyWithPlaceholder(),
  }) {
    return MeOccupancy(
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
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      unitLabel: unitLabel == const $CopyWithPlaceholder()
          ? _value.unitLabel
          // ignore: cast_nullable_to_non_nullable
          : unitLabel as String,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as MeOccupancyKindEnum,
      side: side == const $CopyWithPlaceholder()
          ? _value.side
          // ignore: cast_nullable_to_non_nullable
          : side as MeOccupancySideEnum?,
      maySeeMoney: maySeeMoney == const $CopyWithPlaceholder()
          ? _value.maySeeMoney
          // ignore: cast_nullable_to_non_nullable
          : maySeeMoney as bool,
      validFrom: validFrom == const $CopyWithPlaceholder()
          ? _value.validFrom
          // ignore: cast_nullable_to_non_nullable
          : validFrom as DateTime,
      validTo: validTo == const $CopyWithPlaceholder()
          ? _value.validTo
          // ignore: cast_nullable_to_non_nullable
          : validTo as DateTime?,
    );
  }
}

extension $MeOccupancyCopyWith on MeOccupancy {
  /// Returns a callable class that can be used as follows: `instanceOfMeOccupancy.copyWith(...)` or like so:`instanceOfMeOccupancy.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeOccupancyCWProxy get copyWith => _$MeOccupancyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeOccupancy _$MeOccupancyFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MeOccupancy',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'unit_id',
        'unit_label',
        'kind',
        'side',
        'may_see_money',
        'valid_from',
        'valid_to',
      ],
    );
    final val = MeOccupancy(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      unitLabel: $checkedConvert('unit_label', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(
          _$MeOccupancyKindEnumEnumMap,
          v,
          unknownValue: MeOccupancyKindEnum.unknownDefaultOpenApi,
        ),
      ),
      side: $checkedConvert(
        'side',
        (v) => $enumDecodeNullable(
          _$MeOccupancySideEnumEnumMap,
          v,
          unknownValue: MeOccupancySideEnum.unknownDefaultOpenApi,
        ),
      ),
      maySeeMoney: $checkedConvert('may_see_money', (v) => v as bool),
      validFrom: $checkedConvert(
        'valid_from',
        (v) => DateTime.parse(v as String),
      ),
      validTo: $checkedConvert(
        'valid_to',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'unitId': 'unit_id',
    'unitLabel': 'unit_label',
    'maySeeMoney': 'may_see_money',
    'validFrom': 'valid_from',
    'validTo': 'valid_to',
  },
);

Map<String, dynamic> _$MeOccupancyToJson(MeOccupancy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'site_id': instance.siteId,
      'unit_id': instance.unitId,
      'unit_label': instance.unitLabel,
      'kind': _$MeOccupancyKindEnumEnumMap[instance.kind]!,
      'side': _$MeOccupancySideEnumEnumMap[instance.side],
      'may_see_money': instance.maySeeMoney,
      'valid_from': instance.validFrom.toIso8601String(),
      'valid_to': instance.validTo?.toIso8601String(),
    };

const _$MeOccupancyKindEnumEnumMap = {
  MeOccupancyKindEnum.owner: 'owner',
  MeOccupancyKindEnum.tenant: 'tenant',
  MeOccupancyKindEnum.household: 'household',
  MeOccupancyKindEnum.formerOccupant: 'former_occupant',
  MeOccupancyKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$MeOccupancySideEnumEnumMap = {
  MeOccupancySideEnum.owner: 'owner',
  MeOccupancySideEnum.tenant: 'tenant',
  MeOccupancySideEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
