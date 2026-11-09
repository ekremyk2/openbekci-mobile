// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DocumentCWProxy {
  Document id(String id);

  Document orgId(String orgId);

  Document siteId(String siteId);

  Document folderId(String folderId);

  Document title(String title);

  Document fileId(String fileId);

  Document mime(String mime);

  Document size(int size);

  Document visibility(DocumentVisibility? visibility);

  Document source_(DocumentSource_Enum source_);

  Document generatedFrom(GeneratedFrom? generatedFrom);

  Document uploadedBy(String? uploadedBy);

  Document createdAt(DateTime createdAt);

  Document updatedAt(DateTime updatedAt);

  Document version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Document(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Document(...).copyWith(id: 12, name: "My name")
  /// ````
  Document call({
    String id,
    String orgId,
    String siteId,
    String folderId,
    String title,
    String fileId,
    String mime,
    int size,
    DocumentVisibility? visibility,
    DocumentSource_Enum source_,
    GeneratedFrom? generatedFrom,
    String? uploadedBy,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDocument.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDocument.copyWith.fieldName(...)`
class _$DocumentCWProxyImpl implements _$DocumentCWProxy {
  const _$DocumentCWProxyImpl(this._value);

  final Document _value;

  @override
  Document id(String id) => this(id: id);

  @override
  Document orgId(String orgId) => this(orgId: orgId);

  @override
  Document siteId(String siteId) => this(siteId: siteId);

  @override
  Document folderId(String folderId) => this(folderId: folderId);

  @override
  Document title(String title) => this(title: title);

  @override
  Document fileId(String fileId) => this(fileId: fileId);

  @override
  Document mime(String mime) => this(mime: mime);

  @override
  Document size(int size) => this(size: size);

  @override
  Document visibility(DocumentVisibility? visibility) =>
      this(visibility: visibility);

  @override
  Document source_(DocumentSource_Enum source_) => this(source_: source_);

  @override
  Document generatedFrom(GeneratedFrom? generatedFrom) =>
      this(generatedFrom: generatedFrom);

  @override
  Document uploadedBy(String? uploadedBy) => this(uploadedBy: uploadedBy);

  @override
  Document createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Document updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Document version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Document(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Document(...).copyWith(id: 12, name: "My name")
  /// ````
  Document call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? folderId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? fileId = const $CopyWithPlaceholder(),
    Object? mime = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? source_ = const $CopyWithPlaceholder(),
    Object? generatedFrom = const $CopyWithPlaceholder(),
    Object? uploadedBy = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Document(
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
      folderId: folderId == const $CopyWithPlaceholder()
          ? _value.folderId
          // ignore: cast_nullable_to_non_nullable
          : folderId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      fileId: fileId == const $CopyWithPlaceholder()
          ? _value.fileId
          // ignore: cast_nullable_to_non_nullable
          : fileId as String,
      mime: mime == const $CopyWithPlaceholder()
          ? _value.mime
          // ignore: cast_nullable_to_non_nullable
          : mime as String,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      visibility: visibility == const $CopyWithPlaceholder()
          ? _value.visibility
          // ignore: cast_nullable_to_non_nullable
          : visibility as DocumentVisibility?,
      source_: source_ == const $CopyWithPlaceholder()
          ? _value.source_
          // ignore: cast_nullable_to_non_nullable
          : source_ as DocumentSource_Enum,
      generatedFrom: generatedFrom == const $CopyWithPlaceholder()
          ? _value.generatedFrom
          // ignore: cast_nullable_to_non_nullable
          : generatedFrom as GeneratedFrom?,
      uploadedBy: uploadedBy == const $CopyWithPlaceholder()
          ? _value.uploadedBy
          // ignore: cast_nullable_to_non_nullable
          : uploadedBy as String?,
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

extension $DocumentCopyWith on Document {
  /// Returns a callable class that can be used as follows: `instanceOfDocument.copyWith(...)` or like so:`instanceOfDocument.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DocumentCWProxy get copyWith => _$DocumentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Document',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'folder_id',
        'title',
        'file_id',
        'mime',
        'size',
        'visibility',
        'source',
        'generated_from',
        'uploaded_by',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Document(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      folderId: $checkedConvert('folder_id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      fileId: $checkedConvert('file_id', (v) => v as String),
      mime: $checkedConvert('mime', (v) => v as String),
      size: $checkedConvert('size', (v) => (v as num).toInt()),
      visibility: $checkedConvert(
        'visibility',
        (v) => v == null
            ? null
            : DocumentVisibility.fromJson(v as Map<String, dynamic>),
      ),
      source_: $checkedConvert(
        'source',
        (v) => $enumDecode(
          _$DocumentSource_EnumEnumMap,
          v,
          unknownValue: DocumentSource_Enum.unknownDefaultOpenApi,
        ),
      ),
      generatedFrom: $checkedConvert(
        'generated_from',
        (v) => v == null
            ? null
            : GeneratedFrom.fromJson(v as Map<String, dynamic>),
      ),
      uploadedBy: $checkedConvert('uploaded_by', (v) => v as String?),
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
    'folderId': 'folder_id',
    'fileId': 'file_id',
    'source_': 'source',
    'generatedFrom': 'generated_from',
    'uploadedBy': 'uploaded_by',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'folder_id': instance.folderId,
  'title': instance.title,
  'file_id': instance.fileId,
  'mime': instance.mime,
  'size': instance.size,
  'visibility': instance.visibility?.toJson(),
  'source': _$DocumentSource_EnumEnumMap[instance.source_]!,
  'generated_from': instance.generatedFrom?.toJson(),
  'uploaded_by': instance.uploadedBy,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$DocumentSource_EnumEnumMap = {
  DocumentSource_Enum.uploaded: 'uploaded',
  DocumentSource_Enum.generated: 'generated',
  DocumentSource_Enum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
