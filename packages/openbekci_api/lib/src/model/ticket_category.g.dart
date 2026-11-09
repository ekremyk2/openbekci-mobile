// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_category.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCategoryCWProxy {
  TicketCategory id(String id);

  TicketCategory orgId(String orgId);

  TicketCategory siteId(String siteId);

  TicketCategory name(String name);

  TicketCategory defaultVisibility(
    TicketCategoryDefaultVisibilityEnum defaultVisibility,
  );

  TicketCategory defaultAssigneeRole(
    TicketCategoryDefaultAssigneeRoleEnum? defaultAssigneeRole,
  );

  TicketCategory position(int position);

  TicketCategory archived(bool archived);

  TicketCategory createdAt(DateTime createdAt);

  TicketCategory updatedAt(DateTime updatedAt);

  TicketCategory version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCategory call({
    String id,
    String orgId,
    String siteId,
    String name,
    TicketCategoryDefaultVisibilityEnum defaultVisibility,
    TicketCategoryDefaultAssigneeRoleEnum? defaultAssigneeRole,
    int position,
    bool archived,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketCategory.copyWith.fieldName(...)`
class _$TicketCategoryCWProxyImpl implements _$TicketCategoryCWProxy {
  const _$TicketCategoryCWProxyImpl(this._value);

  final TicketCategory _value;

  @override
  TicketCategory id(String id) => this(id: id);

  @override
  TicketCategory orgId(String orgId) => this(orgId: orgId);

  @override
  TicketCategory siteId(String siteId) => this(siteId: siteId);

  @override
  TicketCategory name(String name) => this(name: name);

  @override
  TicketCategory defaultVisibility(
    TicketCategoryDefaultVisibilityEnum defaultVisibility,
  ) => this(defaultVisibility: defaultVisibility);

  @override
  TicketCategory defaultAssigneeRole(
    TicketCategoryDefaultAssigneeRoleEnum? defaultAssigneeRole,
  ) => this(defaultAssigneeRole: defaultAssigneeRole);

  @override
  TicketCategory position(int position) => this(position: position);

  @override
  TicketCategory archived(bool archived) => this(archived: archived);

  @override
  TicketCategory createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  TicketCategory updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  TicketCategory version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCategory call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? defaultVisibility = const $CopyWithPlaceholder(),
    Object? defaultAssigneeRole = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? archived = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return TicketCategory(
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
      defaultVisibility: defaultVisibility == const $CopyWithPlaceholder()
          ? _value.defaultVisibility
          // ignore: cast_nullable_to_non_nullable
          : defaultVisibility as TicketCategoryDefaultVisibilityEnum,
      defaultAssigneeRole: defaultAssigneeRole == const $CopyWithPlaceholder()
          ? _value.defaultAssigneeRole
          // ignore: cast_nullable_to_non_nullable
          : defaultAssigneeRole as TicketCategoryDefaultAssigneeRoleEnum?,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as int,
      archived: archived == const $CopyWithPlaceholder()
          ? _value.archived
          // ignore: cast_nullable_to_non_nullable
          : archived as bool,
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

extension $TicketCategoryCopyWith on TicketCategory {
  /// Returns a callable class that can be used as follows: `instanceOfTicketCategory.copyWith(...)` or like so:`instanceOfTicketCategory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCategoryCWProxy get copyWith => _$TicketCategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCategory _$TicketCategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketCategory',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'org_id',
            'site_id',
            'name',
            'default_visibility',
            'default_assignee_role',
            'position',
            'archived',
            'created_at',
            'updated_at',
            'version',
          ],
        );
        final val = TicketCategory(
          id: $checkedConvert('id', (v) => v as String),
          orgId: $checkedConvert('org_id', (v) => v as String),
          siteId: $checkedConvert('site_id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          defaultVisibility: $checkedConvert(
            'default_visibility',
            (v) => $enumDecode(
              _$TicketCategoryDefaultVisibilityEnumEnumMap,
              v,
              unknownValue:
                  TicketCategoryDefaultVisibilityEnum.unknownDefaultOpenApi,
            ),
          ),
          defaultAssigneeRole: $checkedConvert(
            'default_assignee_role',
            (v) => $enumDecodeNullable(
              _$TicketCategoryDefaultAssigneeRoleEnumEnumMap,
              v,
              unknownValue:
                  TicketCategoryDefaultAssigneeRoleEnum.unknownDefaultOpenApi,
            ),
          ),
          position: $checkedConvert('position', (v) => (v as num).toInt()),
          archived: $checkedConvert('archived', (v) => v as bool),
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
        'defaultVisibility': 'default_visibility',
        'defaultAssigneeRole': 'default_assignee_role',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$TicketCategoryToJson(
  TicketCategory instance,
) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'name': instance.name,
  'default_visibility':
      _$TicketCategoryDefaultVisibilityEnumEnumMap[instance.defaultVisibility]!,
  'default_assignee_role':
      _$TicketCategoryDefaultAssigneeRoleEnumEnumMap[instance
          .defaultAssigneeRole],
  'position': instance.position,
  'archived': instance.archived,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$TicketCategoryDefaultVisibilityEnumEnumMap = {
  TicketCategoryDefaultVisibilityEnum.private: 'private',
  TicketCategoryDefaultVisibilityEnum.common: 'common',
  TicketCategoryDefaultVisibilityEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$TicketCategoryDefaultAssigneeRoleEnumEnumMap = {
  TicketCategoryDefaultAssigneeRoleEnum.siteManager: 'site_manager',
  TicketCategoryDefaultAssigneeRoleEnum.staff: 'staff',
  TicketCategoryDefaultAssigneeRoleEnum.boardMember: 'board_member',
  TicketCategoryDefaultAssigneeRoleEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
