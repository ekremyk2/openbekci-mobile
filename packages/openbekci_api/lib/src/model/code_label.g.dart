// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_label.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CodeLabelCWProxy {
  CodeLabel code(String code);

  CodeLabel label(String label);

  CodeLabel description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodeLabel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodeLabel(...).copyWith(id: 12, name: "My name")
  /// ````
  CodeLabel call({String code, String label, String? description});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCodeLabel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCodeLabel.copyWith.fieldName(...)`
class _$CodeLabelCWProxyImpl implements _$CodeLabelCWProxy {
  const _$CodeLabelCWProxyImpl(this._value);

  final CodeLabel _value;

  @override
  CodeLabel code(String code) => this(code: code);

  @override
  CodeLabel label(String label) => this(label: label);

  @override
  CodeLabel description(String? description) => this(description: description);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodeLabel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodeLabel(...).copyWith(id: 12, name: "My name")
  /// ````
  CodeLabel call({
    Object? code = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return CodeLabel(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $CodeLabelCopyWith on CodeLabel {
  /// Returns a callable class that can be used as follows: `instanceOfCodeLabel.copyWith(...)` or like so:`instanceOfCodeLabel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CodeLabelCWProxy get copyWith => _$CodeLabelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeLabel _$CodeLabelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CodeLabel', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'label']);
      final val = CodeLabel(
        code: $checkedConvert('code', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CodeLabelToJson(CodeLabel instance) => <String, dynamic>{
  'code': instance.code,
  'label': instance.label,
  'description': ?instance.description,
};
