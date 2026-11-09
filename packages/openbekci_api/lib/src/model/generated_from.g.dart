// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_from.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GeneratedFromCWProxy {
  GeneratedFrom type(String type);

  GeneratedFrom id(String id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeneratedFrom(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeneratedFrom(...).copyWith(id: 12, name: "My name")
  /// ````
  GeneratedFrom call({String type, String id});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeneratedFrom.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeneratedFrom.copyWith.fieldName(...)`
class _$GeneratedFromCWProxyImpl implements _$GeneratedFromCWProxy {
  const _$GeneratedFromCWProxyImpl(this._value);

  final GeneratedFrom _value;

  @override
  GeneratedFrom type(String type) => this(type: type);

  @override
  GeneratedFrom id(String id) => this(id: id);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GeneratedFrom(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GeneratedFrom(...).copyWith(id: 12, name: "My name")
  /// ````
  GeneratedFrom call({
    Object? type = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return GeneratedFrom(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
    );
  }
}

extension $GeneratedFromCopyWith on GeneratedFrom {
  /// Returns a callable class that can be used as follows: `instanceOfGeneratedFrom.copyWith(...)` or like so:`instanceOfGeneratedFrom.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeneratedFromCWProxy get copyWith => _$GeneratedFromCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedFrom _$GeneratedFromFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GeneratedFrom', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['type', 'id']);
      final val = GeneratedFrom(
        type: $checkedConvert('type', (v) => v as String),
        id: $checkedConvert('id', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$GeneratedFromToJson(GeneratedFrom instance) =>
    <String, dynamic>{'type': instance.type, 'id': instance.id};
