// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_field_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProblemFieldErrorCWProxy {
  ProblemFieldError field(String field);

  ProblemFieldError code(String code);

  ProblemFieldError params(Map<String, Object>? params);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProblemFieldError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProblemFieldError(...).copyWith(id: 12, name: "My name")
  /// ````
  ProblemFieldError call({
    String field,
    String code,
    Map<String, Object>? params,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProblemFieldError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProblemFieldError.copyWith.fieldName(...)`
class _$ProblemFieldErrorCWProxyImpl implements _$ProblemFieldErrorCWProxy {
  const _$ProblemFieldErrorCWProxyImpl(this._value);

  final ProblemFieldError _value;

  @override
  ProblemFieldError field(String field) => this(field: field);

  @override
  ProblemFieldError code(String code) => this(code: code);

  @override
  ProblemFieldError params(Map<String, Object>? params) => this(params: params);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProblemFieldError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProblemFieldError(...).copyWith(id: 12, name: "My name")
  /// ````
  ProblemFieldError call({
    Object? field = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? params = const $CopyWithPlaceholder(),
  }) {
    return ProblemFieldError(
      field: field == const $CopyWithPlaceholder()
          ? _value.field
          // ignore: cast_nullable_to_non_nullable
          : field as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      params: params == const $CopyWithPlaceholder()
          ? _value.params
          // ignore: cast_nullable_to_non_nullable
          : params as Map<String, Object>?,
    );
  }
}

extension $ProblemFieldErrorCopyWith on ProblemFieldError {
  /// Returns a callable class that can be used as follows: `instanceOfProblemFieldError.copyWith(...)` or like so:`instanceOfProblemFieldError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProblemFieldErrorCWProxy get copyWith =>
      _$ProblemFieldErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemFieldError _$ProblemFieldErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ProblemFieldError', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['field', 'code']);
      final val = ProblemFieldError(
        field: $checkedConvert('field', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        params: $checkedConvert(
          'params',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Object),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ProblemFieldErrorToJson(ProblemFieldError instance) =>
    <String, dynamic>{
      'field': instance.field,
      'code': instance.code,
      'params': ?instance.params,
    };
