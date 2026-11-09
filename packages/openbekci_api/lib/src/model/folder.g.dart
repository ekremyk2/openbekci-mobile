// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FolderCWProxy {
  Folder id(String id);

  Folder orgId(String orgId);

  Folder siteId(String siteId);

  Folder parentId(String? parentId);

  Folder name(String name);

  Folder kind(FolderKindEnum kind);

  Folder unitId(String? unitId);

  Folder visibility(DocumentVisibility visibility);

  Folder breadcrumb(List<FolderCrumb> breadcrumb);

  Folder isSystem(bool isSystem);

  Folder createdAt(DateTime createdAt);

  Folder updatedAt(DateTime updatedAt);

  Folder version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Folder(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Folder(...).copyWith(id: 12, name: "My name")
  /// ````
  Folder call({
    String id,
    String orgId,
    String siteId,
    String? parentId,
    String name,
    FolderKindEnum kind,
    String? unitId,
    DocumentVisibility visibility,
    List<FolderCrumb> breadcrumb,
    bool isSystem,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFolder.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFolder.copyWith.fieldName(...)`
class _$FolderCWProxyImpl implements _$FolderCWProxy {
  const _$FolderCWProxyImpl(this._value);

  final Folder _value;

  @override
  Folder id(String id) => this(id: id);

  @override
  Folder orgId(String orgId) => this(orgId: orgId);

  @override
  Folder siteId(String siteId) => this(siteId: siteId);

  @override
  Folder parentId(String? parentId) => this(parentId: parentId);

  @override
  Folder name(String name) => this(name: name);

  @override
  Folder kind(FolderKindEnum kind) => this(kind: kind);

  @override
  Folder unitId(String? unitId) => this(unitId: unitId);

  @override
  Folder visibility(DocumentVisibility visibility) =>
      this(visibility: visibility);

  @override
  Folder breadcrumb(List<FolderCrumb> breadcrumb) =>
      this(breadcrumb: breadcrumb);

  @override
  Folder isSystem(bool isSystem) => this(isSystem: isSystem);

  @override
  Folder createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Folder updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Folder version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Folder(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Folder(...).copyWith(id: 12, name: "My name")
  /// ````
  Folder call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? parentId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? breadcrumb = const $CopyWithPlaceholder(),
    Object? isSystem = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Folder(
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
      parentId: parentId == const $CopyWithPlaceholder()
          ? _value.parentId
          // ignore: cast_nullable_to_non_nullable
          : parentId as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as FolderKindEnum,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
      visibility: visibility == const $CopyWithPlaceholder()
          ? _value.visibility
          // ignore: cast_nullable_to_non_nullable
          : visibility as DocumentVisibility,
      breadcrumb: breadcrumb == const $CopyWithPlaceholder()
          ? _value.breadcrumb
          // ignore: cast_nullable_to_non_nullable
          : breadcrumb as List<FolderCrumb>,
      isSystem: isSystem == const $CopyWithPlaceholder()
          ? _value.isSystem
          // ignore: cast_nullable_to_non_nullable
          : isSystem as bool,
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

extension $FolderCopyWith on Folder {
  /// Returns a callable class that can be used as follows: `instanceOfFolder.copyWith(...)` or like so:`instanceOfFolder.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FolderCWProxy get copyWith => _$FolderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Folder _$FolderFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Folder',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'parent_id',
        'name',
        'kind',
        'unit_id',
        'visibility',
        'breadcrumb',
        'is_system',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Folder(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      parentId: $checkedConvert('parent_id', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(
          _$FolderKindEnumEnumMap,
          v,
          unknownValue: FolderKindEnum.unknownDefaultOpenApi,
        ),
      ),
      unitId: $checkedConvert('unit_id', (v) => v as String?),
      visibility: $checkedConvert(
        'visibility',
        (v) => DocumentVisibility.fromJson(v as Map<String, dynamic>),
      ),
      breadcrumb: $checkedConvert(
        'breadcrumb',
        (v) => (v as List<dynamic>)
            .map((e) => FolderCrumb.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      isSystem: $checkedConvert('is_system', (v) => v as bool),
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
    'parentId': 'parent_id',
    'unitId': 'unit_id',
    'isSystem': 'is_system',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$FolderToJson(Folder instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'parent_id': instance.parentId,
  'name': instance.name,
  'kind': _$FolderKindEnumEnumMap[instance.kind]!,
  'unit_id': instance.unitId,
  'visibility': instance.visibility.toJson(),
  'breadcrumb': instance.breadcrumb.map((e) => e.toJson()).toList(),
  'is_system': instance.isSystem,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$FolderKindEnumEnumMap = {
  FolderKindEnum.site: 'site',
  FolderKindEnum.unit: 'unit',
  FolderKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
