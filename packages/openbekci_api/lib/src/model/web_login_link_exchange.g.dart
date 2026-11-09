// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_login_link_exchange.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WebLoginLinkExchangeCWProxy {
  WebLoginLinkExchange token(String token);

  WebLoginLinkExchange deviceName(String? deviceName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebLoginLinkExchange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebLoginLinkExchange(...).copyWith(id: 12, name: "My name")
  /// ````
  WebLoginLinkExchange call({String token, String? deviceName});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWebLoginLinkExchange.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWebLoginLinkExchange.copyWith.fieldName(...)`
class _$WebLoginLinkExchangeCWProxyImpl
    implements _$WebLoginLinkExchangeCWProxy {
  const _$WebLoginLinkExchangeCWProxyImpl(this._value);

  final WebLoginLinkExchange _value;

  @override
  WebLoginLinkExchange token(String token) => this(token: token);

  @override
  WebLoginLinkExchange deviceName(String? deviceName) =>
      this(deviceName: deviceName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebLoginLinkExchange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebLoginLinkExchange(...).copyWith(id: 12, name: "My name")
  /// ````
  WebLoginLinkExchange call({
    Object? token = const $CopyWithPlaceholder(),
    Object? deviceName = const $CopyWithPlaceholder(),
  }) {
    return WebLoginLinkExchange(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      deviceName: deviceName == const $CopyWithPlaceholder()
          ? _value.deviceName
          // ignore: cast_nullable_to_non_nullable
          : deviceName as String?,
    );
  }
}

extension $WebLoginLinkExchangeCopyWith on WebLoginLinkExchange {
  /// Returns a callable class that can be used as follows: `instanceOfWebLoginLinkExchange.copyWith(...)` or like so:`instanceOfWebLoginLinkExchange.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WebLoginLinkExchangeCWProxy get copyWith =>
      _$WebLoginLinkExchangeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebLoginLinkExchange _$WebLoginLinkExchangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WebLoginLinkExchange', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['token']);
  final val = WebLoginLinkExchange(
    token: $checkedConvert('token', (v) => v as String),
    deviceName: $checkedConvert('device_name', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'deviceName': 'device_name'});

Map<String, dynamic> _$WebLoginLinkExchangeToJson(
  WebLoginLinkExchange instance,
) => <String, dynamic>{
  'token': instance.token,
  'device_name': ?instance.deviceName,
};
