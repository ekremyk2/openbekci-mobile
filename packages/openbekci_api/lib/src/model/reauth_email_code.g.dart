// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reauth_email_code.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReauthEmailCodeCWProxy {
  ReauthEmailCode method(String method);

  ReauthEmailCode code(String code);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthEmailCode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthEmailCode(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthEmailCode call({String method, String code});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReauthEmailCode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReauthEmailCode.copyWith.fieldName(...)`
class _$ReauthEmailCodeCWProxyImpl implements _$ReauthEmailCodeCWProxy {
  const _$ReauthEmailCodeCWProxyImpl(this._value);

  final ReauthEmailCode _value;

  @override
  ReauthEmailCode method(String method) => this(method: method);

  @override
  ReauthEmailCode code(String code) => this(code: code);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthEmailCode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthEmailCode(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthEmailCode call({
    Object? method = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
  }) {
    return ReauthEmailCode(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
    );
  }
}

extension $ReauthEmailCodeCopyWith on ReauthEmailCode {
  /// Returns a callable class that can be used as follows: `instanceOfReauthEmailCode.copyWith(...)` or like so:`instanceOfReauthEmailCode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReauthEmailCodeCWProxy get copyWith => _$ReauthEmailCodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReauthEmailCode _$ReauthEmailCodeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReauthEmailCode', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['method', 'code']);
      final val = ReauthEmailCode(
        method: $checkedConvert('method', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ReauthEmailCodeToJson(ReauthEmailCode instance) =>
    <String, dynamic>{'method': instance.method, 'code': instance.code};
