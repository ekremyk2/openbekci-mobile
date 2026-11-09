// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_attachment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementAttachmentCWProxy {
  AnnouncementAttachment id(String id);

  AnnouncementAttachment name(String name);

  AnnouncementAttachment mime(String mime);

  AnnouncementAttachment size(int size);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementAttachment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementAttachment(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementAttachment call({String id, String name, String mime, int size});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncementAttachment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncementAttachment.copyWith.fieldName(...)`
class _$AnnouncementAttachmentCWProxyImpl
    implements _$AnnouncementAttachmentCWProxy {
  const _$AnnouncementAttachmentCWProxyImpl(this._value);

  final AnnouncementAttachment _value;

  @override
  AnnouncementAttachment id(String id) => this(id: id);

  @override
  AnnouncementAttachment name(String name) => this(name: name);

  @override
  AnnouncementAttachment mime(String mime) => this(mime: mime);

  @override
  AnnouncementAttachment size(int size) => this(size: size);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementAttachment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementAttachment(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementAttachment call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? mime = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
  }) {
    return AnnouncementAttachment(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      mime: mime == const $CopyWithPlaceholder()
          ? _value.mime
          // ignore: cast_nullable_to_non_nullable
          : mime as String,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
    );
  }
}

extension $AnnouncementAttachmentCopyWith on AnnouncementAttachment {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncementAttachment.copyWith(...)` or like so:`instanceOfAnnouncementAttachment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementAttachmentCWProxy get copyWith =>
      _$AnnouncementAttachmentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementAttachment _$AnnouncementAttachmentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AnnouncementAttachment', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'name', 'mime', 'size']);
  final val = AnnouncementAttachment(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    mime: $checkedConvert('mime', (v) => v as String),
    size: $checkedConvert('size', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$AnnouncementAttachmentToJson(
  AnnouncementAttachment instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'mime': instance.mime,
  'size': instance.size,
};
