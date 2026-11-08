// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reauth_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReauthRequestCWProxy {
  ReauthRequest method(String method);

  ReauthRequest password(String password);

  ReauthRequest code(String code);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthRequest call({String method, String password, String code});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReauthRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReauthRequest.copyWith.fieldName(...)`
class _$ReauthRequestCWProxyImpl implements _$ReauthRequestCWProxy {
  const _$ReauthRequestCWProxyImpl(this._value);

  final ReauthRequest _value;

  @override
  ReauthRequest method(String method) => this(method: method);

  @override
  ReauthRequest password(String password) => this(password: password);

  @override
  ReauthRequest code(String code) => this(code: code);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthRequest call({
    Object? method = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
  }) {
    return ReauthRequest(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
    );
  }
}

extension $ReauthRequestCopyWith on ReauthRequest {
  /// Returns a callable class that can be used as follows: `instanceOfReauthRequest.copyWith(...)` or like so:`instanceOfReauthRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReauthRequestCWProxy get copyWith => _$ReauthRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReauthRequest _$ReauthRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReauthRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['method', 'password', 'code']);
      final val = ReauthRequest(
        method: $checkedConvert('method', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ReauthRequestToJson(ReauthRequest instance) =>
    <String, dynamic>{
      'method': instance.method,
      'password': instance.password,
      'code': instance.code,
    };
