// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reauth_password.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReauthPasswordCWProxy {
  ReauthPassword method(String method);

  ReauthPassword password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthPassword(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthPassword(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthPassword call({String method, String password});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReauthPassword.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReauthPassword.copyWith.fieldName(...)`
class _$ReauthPasswordCWProxyImpl implements _$ReauthPasswordCWProxy {
  const _$ReauthPasswordCWProxyImpl(this._value);

  final ReauthPassword _value;

  @override
  ReauthPassword method(String method) => this(method: method);

  @override
  ReauthPassword password(String password) => this(password: password);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthPassword(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthPassword(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthPassword call({
    Object? method = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return ReauthPassword(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $ReauthPasswordCopyWith on ReauthPassword {
  /// Returns a callable class that can be used as follows: `instanceOfReauthPassword.copyWith(...)` or like so:`instanceOfReauthPassword.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReauthPasswordCWProxy get copyWith => _$ReauthPasswordCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReauthPassword _$ReauthPasswordFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReauthPassword', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['method', 'password']);
      final val = ReauthPassword(
        method: $checkedConvert('method', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ReauthPasswordToJson(ReauthPassword instance) =>
    <String, dynamic>{'method': instance.method, 'password': instance.password};
