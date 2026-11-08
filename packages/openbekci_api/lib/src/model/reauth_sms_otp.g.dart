// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reauth_sms_otp.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReauthSmsOtpCWProxy {
  ReauthSmsOtp method(String method);

  ReauthSmsOtp code(String code);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthSmsOtp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthSmsOtp(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthSmsOtp call({String method, String code});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReauthSmsOtp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReauthSmsOtp.copyWith.fieldName(...)`
class _$ReauthSmsOtpCWProxyImpl implements _$ReauthSmsOtpCWProxy {
  const _$ReauthSmsOtpCWProxyImpl(this._value);

  final ReauthSmsOtp _value;

  @override
  ReauthSmsOtp method(String method) => this(method: method);

  @override
  ReauthSmsOtp code(String code) => this(code: code);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthSmsOtp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthSmsOtp(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthSmsOtp call({
    Object? method = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
  }) {
    return ReauthSmsOtp(
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

extension $ReauthSmsOtpCopyWith on ReauthSmsOtp {
  /// Returns a callable class that can be used as follows: `instanceOfReauthSmsOtp.copyWith(...)` or like so:`instanceOfReauthSmsOtp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReauthSmsOtpCWProxy get copyWith => _$ReauthSmsOtpCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReauthSmsOtp _$ReauthSmsOtpFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReauthSmsOtp', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['method', 'code']);
      final val = ReauthSmsOtp(
        method: $checkedConvert('method', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ReauthSmsOtpToJson(ReauthSmsOtp instance) =>
    <String, dynamic>{'method': instance.method, 'code': instance.code};
