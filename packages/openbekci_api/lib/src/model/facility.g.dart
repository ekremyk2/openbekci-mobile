// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FacilityCWProxy {
  Facility id(String id);

  Facility orgId(String orgId);

  Facility siteId(String siteId);

  Facility name(String name);

  Facility description(String? description);

  Facility rules(FacilityRules rules);

  Facility enabled(bool enabled);

  Facility createdAt(DateTime createdAt);

  Facility updatedAt(DateTime updatedAt);

  Facility version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Facility(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Facility(...).copyWith(id: 12, name: "My name")
  /// ````
  Facility call({
    String id,
    String orgId,
    String siteId,
    String name,
    String? description,
    FacilityRules rules,
    bool enabled,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFacility.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFacility.copyWith.fieldName(...)`
class _$FacilityCWProxyImpl implements _$FacilityCWProxy {
  const _$FacilityCWProxyImpl(this._value);

  final Facility _value;

  @override
  Facility id(String id) => this(id: id);

  @override
  Facility orgId(String orgId) => this(orgId: orgId);

  @override
  Facility siteId(String siteId) => this(siteId: siteId);

  @override
  Facility name(String name) => this(name: name);

  @override
  Facility description(String? description) => this(description: description);

  @override
  Facility rules(FacilityRules rules) => this(rules: rules);

  @override
  Facility enabled(bool enabled) => this(enabled: enabled);

  @override
  Facility createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Facility updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Facility version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Facility(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Facility(...).copyWith(id: 12, name: "My name")
  /// ````
  Facility call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? rules = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Facility(
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
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      rules: rules == const $CopyWithPlaceholder()
          ? _value.rules
          // ignore: cast_nullable_to_non_nullable
          : rules as FacilityRules,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $FacilityCopyWith on Facility {
  /// Returns a callable class that can be used as follows: `instanceOfFacility.copyWith(...)` or like so:`instanceOfFacility.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FacilityCWProxy get copyWith => _$FacilityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facility _$FacilityFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Facility',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'name',
        'description',
        'rules',
        'enabled',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Facility(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      rules: $checkedConvert(
        'rules',
        (v) => FacilityRules.fromJson(v as Map<String, dynamic>),
      ),
      enabled: $checkedConvert('enabled', (v) => v as bool),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'name': instance.name,
  'description': instance.description,
  'rules': instance.rules.toJson(),
  'enabled': instance.enabled,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};
