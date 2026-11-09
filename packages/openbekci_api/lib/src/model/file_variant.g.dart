// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_variant.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileVariantCWProxy {
  FileVariant width(int width);

  FileVariant height(int height);

  FileVariant size(int size);

  FileVariant mime(String mime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FileVariant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FileVariant(...).copyWith(id: 12, name: "My name")
  /// ````
  FileVariant call({int width, int height, int size, String mime});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFileVariant.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFileVariant.copyWith.fieldName(...)`
class _$FileVariantCWProxyImpl implements _$FileVariantCWProxy {
  const _$FileVariantCWProxyImpl(this._value);

  final FileVariant _value;

  @override
  FileVariant width(int width) => this(width: width);

  @override
  FileVariant height(int height) => this(height: height);

  @override
  FileVariant size(int size) => this(size: size);

  @override
  FileVariant mime(String mime) => this(mime: mime);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FileVariant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FileVariant(...).copyWith(id: 12, name: "My name")
  /// ````
  FileVariant call({
    Object? width = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? mime = const $CopyWithPlaceholder(),
  }) {
    return FileVariant(
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as int,
      height: height == const $CopyWithPlaceholder()
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as int,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      mime: mime == const $CopyWithPlaceholder()
          ? _value.mime
          // ignore: cast_nullable_to_non_nullable
          : mime as String,
    );
  }
}

extension $FileVariantCopyWith on FileVariant {
  /// Returns a callable class that can be used as follows: `instanceOfFileVariant.copyWith(...)` or like so:`instanceOfFileVariant.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileVariantCWProxy get copyWith => _$FileVariantCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileVariant _$FileVariantFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FileVariant', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['width', 'height', 'size', 'mime']);
      final val = FileVariant(
        width: $checkedConvert('width', (v) => (v as num).toInt()),
        height: $checkedConvert('height', (v) => (v as num).toInt()),
        size: $checkedConvert('size', (v) => (v as num).toInt()),
        mime: $checkedConvert('mime', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FileVariantToJson(FileVariant instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'size': instance.size,
      'mime': instance.mime,
    };
