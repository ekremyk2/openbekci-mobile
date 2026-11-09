// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_links.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileLinksCWProxy {
  FileLinks original(String? original);

  FileLinks variants(Map<String, String> variants);

  FileLinks expiresAt(DateTime expiresAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FileLinks(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FileLinks(...).copyWith(id: 12, name: "My name")
  /// ````
  FileLinks call({
    String? original,
    Map<String, String> variants,
    DateTime expiresAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFileLinks.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFileLinks.copyWith.fieldName(...)`
class _$FileLinksCWProxyImpl implements _$FileLinksCWProxy {
  const _$FileLinksCWProxyImpl(this._value);

  final FileLinks _value;

  @override
  FileLinks original(String? original) => this(original: original);

  @override
  FileLinks variants(Map<String, String> variants) => this(variants: variants);

  @override
  FileLinks expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FileLinks(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FileLinks(...).copyWith(id: 12, name: "My name")
  /// ````
  FileLinks call({
    Object? original = const $CopyWithPlaceholder(),
    Object? variants = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return FileLinks(
      original: original == const $CopyWithPlaceholder()
          ? _value.original
          // ignore: cast_nullable_to_non_nullable
          : original as String?,
      variants: variants == const $CopyWithPlaceholder()
          ? _value.variants
          // ignore: cast_nullable_to_non_nullable
          : variants as Map<String, String>,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $FileLinksCopyWith on FileLinks {
  /// Returns a callable class that can be used as follows: `instanceOfFileLinks.copyWith(...)` or like so:`instanceOfFileLinks.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileLinksCWProxy get copyWith => _$FileLinksCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileLinks _$FileLinksFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FileLinks', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['original', 'variants', 'expires_at'],
      );
      final val = FileLinks(
        original: $checkedConvert('original', (v) => v as String?),
        variants: $checkedConvert(
          'variants',
          (v) => Map<String, String>.from(v as Map),
        ),
        expiresAt: $checkedConvert(
          'expires_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$FileLinksToJson(FileLinks instance) => <String, dynamic>{
  'original': instance.original,
  'variants': instance.variants,
  'expires_at': instance.expiresAt.toIso8601String(),
};
