// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileCWProxy {
  File id(String id);

  File orgId(String orgId);

  File siteId(String? siteId);

  File name(String name);

  File size(int size);

  File mime(String mime);

  File sha256(String sha256);

  File status(FileStatusEnum status);

  File source_(FileSource_Enum source_);

  File uploadedBy(String? uploadedBy);

  File scope(String? scope);

  File hasVariants(bool hasVariants);

  File retentionUntil(DateTime? retentionUntil);

  File variants(Map<String, FileVariant> variants);

  File links(FileLinks links);

  File createdAt(DateTime createdAt);

  File updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `File(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// File(...).copyWith(id: 12, name: "My name")
  /// ````
  File call({
    String id,
    String orgId,
    String? siteId,
    String name,
    int size,
    String mime,
    String sha256,
    FileStatusEnum status,
    FileSource_Enum source_,
    String? uploadedBy,
    String? scope,
    bool hasVariants,
    DateTime? retentionUntil,
    Map<String, FileVariant> variants,
    FileLinks links,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFile.copyWith.fieldName(...)`
class _$FileCWProxyImpl implements _$FileCWProxy {
  const _$FileCWProxyImpl(this._value);

  final File _value;

  @override
  File id(String id) => this(id: id);

  @override
  File orgId(String orgId) => this(orgId: orgId);

  @override
  File siteId(String? siteId) => this(siteId: siteId);

  @override
  File name(String name) => this(name: name);

  @override
  File size(int size) => this(size: size);

  @override
  File mime(String mime) => this(mime: mime);

  @override
  File sha256(String sha256) => this(sha256: sha256);

  @override
  File status(FileStatusEnum status) => this(status: status);

  @override
  File source_(FileSource_Enum source_) => this(source_: source_);

  @override
  File uploadedBy(String? uploadedBy) => this(uploadedBy: uploadedBy);

  @override
  File scope(String? scope) => this(scope: scope);

  @override
  File hasVariants(bool hasVariants) => this(hasVariants: hasVariants);

  @override
  File retentionUntil(DateTime? retentionUntil) =>
      this(retentionUntil: retentionUntil);

  @override
  File variants(Map<String, FileVariant> variants) => this(variants: variants);

  @override
  File links(FileLinks links) => this(links: links);

  @override
  File createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  File updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `File(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// File(...).copyWith(id: 12, name: "My name")
  /// ````
  File call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? mime = const $CopyWithPlaceholder(),
    Object? sha256 = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? uploadedBy = const $CopyWithPlaceholder(),
    Object? scope = const $CopyWithPlaceholder(),
    Object? hasVariants = const $CopyWithPlaceholder(),
    Object? retentionUntil = const $CopyWithPlaceholder(),
    Object? variants = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return File(
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
          : siteId as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      mime: mime == const $CopyWithPlaceholder()
          ? _value.mime
          // ignore: cast_nullable_to_non_nullable
          : mime as String,
      sha256: sha256 == const $CopyWithPlaceholder()
          ? _value.sha256
          // ignore: cast_nullable_to_non_nullable
          : sha256 as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as FileStatusEnum,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as FileSource_Enum,
      uploadedBy: uploadedBy == const $CopyWithPlaceholder()
          ? _value.uploadedBy
          // ignore: cast_nullable_to_non_nullable
          : uploadedBy as String?,
      scope: scope == const $CopyWithPlaceholder()
          ? _value.scope
          // ignore: cast_nullable_to_non_nullable
          : scope as String?,
      hasVariants: hasVariants == const $CopyWithPlaceholder()
          ? _value.hasVariants
          // ignore: cast_nullable_to_non_nullable
          : hasVariants as bool,
      retentionUntil: retentionUntil == const $CopyWithPlaceholder()
          ? _value.retentionUntil
          // ignore: cast_nullable_to_non_nullable
          : retentionUntil as DateTime?,
      variants: variants == const $CopyWithPlaceholder()
          ? _value.variants
          // ignore: cast_nullable_to_non_nullable
          : variants as Map<String, FileVariant>,
      links: links == const $CopyWithPlaceholder()
          ? _value.links
          // ignore: cast_nullable_to_non_nullable
          : links as FileLinks,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $FileCopyWith on File {
  /// Returns a callable class that can be used as follows: `instanceOfFile.copyWith(...)` or like so:`instanceOfFile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileCWProxy get copyWith => _$FileCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => $checkedCreate(
  'File',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'name',
        'size',
        'mime',
        'sha256',
        'status',
        'source',
        'uploaded_by',
        'scope',
        'has_variants',
        'retention_until',
        'variants',
        'links',
        'created_at',
        'updated_at',
      ],
    );
    final val = File(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String),
      size: $checkedConvert('size', (v) => (v as num).toInt()),
      mime: $checkedConvert('mime', (v) => v as String),
      sha256: $checkedConvert('sha256', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$FileStatusEnumEnumMap,
          v,
          unknownValue: FileStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      source_: $checkedConvert(
        'source',
        (v) => $enumDecode(
          _$FileSource_EnumEnumMap,
          v,
          unknownValue: FileSource_Enum.unknownDefaultOpenApi,
        ),
      ),
      uploadedBy: $checkedConvert('uploaded_by', (v) => v as String?),
      scope: $checkedConvert('scope', (v) => v as String?),
      hasVariants: $checkedConvert('has_variants', (v) => v as bool),
      retentionUntil: $checkedConvert(
        'retention_until',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      variants: $checkedConvert(
        'variants',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry(k, FileVariant.fromJson(e as Map<String, dynamic>)),
        ),
      ),
      links: $checkedConvert(
        'links',
        (v) => FileLinks.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'source_': 'source',
    'uploadedBy': 'uploaded_by',
    'hasVariants': 'has_variants',
    'retentionUntil': 'retention_until',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'name': instance.name,
  'size': instance.size,
  'mime': instance.mime,
  'sha256': instance.sha256,
  'status': _$FileStatusEnumEnumMap[instance.status]!,
  'source': _$FileSource_EnumEnumMap[instance.source_]!,
  'uploaded_by': instance.uploadedBy,
  'scope': instance.scope,
  'has_variants': instance.hasVariants,
  'retention_until': instance.retentionUntil?.toIso8601String(),
  'variants': instance.variants.map((k, e) => MapEntry(k, e.toJson())),
  'links': instance.links.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$FileStatusEnumEnumMap = {
  FileStatusEnum.ready: 'ready',
  FileStatusEnum.quarantined: 'quarantined',
  FileStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$FileSource_EnumEnumMap = {
  FileSource_Enum.uploaded: 'uploaded',
  FileSource_Enum.generated: 'generated',
  FileSource_Enum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
