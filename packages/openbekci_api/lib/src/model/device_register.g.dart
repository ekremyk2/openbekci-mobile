// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_register.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceRegisterCWProxy {
  DeviceRegister pushKind(String pushKind);

  DeviceRegister token(String token);

  DeviceRegister relayId(String? relayId);

  DeviceRegister appVersion(String? appVersion);

  DeviceRegister locale(String? locale);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceRegister(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceRegister(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceRegister call({
    String pushKind,
    String token,
    String? relayId,
    String? appVersion,
    String? locale,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceRegister.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceRegister.copyWith.fieldName(...)`
class _$DeviceRegisterCWProxyImpl implements _$DeviceRegisterCWProxy {
  const _$DeviceRegisterCWProxyImpl(this._value);

  final DeviceRegister _value;

  @override
  DeviceRegister pushKind(String pushKind) => this(pushKind: pushKind);

  @override
  DeviceRegister token(String token) => this(token: token);

  @override
  DeviceRegister relayId(String? relayId) => this(relayId: relayId);

  @override
  DeviceRegister appVersion(String? appVersion) => this(appVersion: appVersion);

  @override
  DeviceRegister locale(String? locale) => this(locale: locale);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceRegister(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceRegister(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceRegister call({
    Object? pushKind = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? relayId = const $CopyWithPlaceholder(),
    Object? appVersion = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
  }) {
    return DeviceRegister(
      pushKind: pushKind == const $CopyWithPlaceholder()
          ? _value.pushKind
          // ignore: cast_nullable_to_non_nullable
          : pushKind as String,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      relayId: relayId == const $CopyWithPlaceholder()
          ? _value.relayId
          // ignore: cast_nullable_to_non_nullable
          : relayId as String?,
      appVersion: appVersion == const $CopyWithPlaceholder()
          ? _value.appVersion
          // ignore: cast_nullable_to_non_nullable
          : appVersion as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String?,
    );
  }
}

extension $DeviceRegisterCopyWith on DeviceRegister {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceRegister.copyWith(...)` or like so:`instanceOfDeviceRegister.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceRegisterCWProxy get copyWith => _$DeviceRegisterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceRegister _$DeviceRegisterFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeviceRegister',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['push_kind', 'token']);
        final val = DeviceRegister(
          pushKind: $checkedConvert('push_kind', (v) => v as String),
          token: $checkedConvert('token', (v) => v as String),
          relayId: $checkedConvert('relay_id', (v) => v as String?),
          appVersion: $checkedConvert('app_version', (v) => v as String?),
          locale: $checkedConvert('locale', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'pushKind': 'push_kind',
        'relayId': 'relay_id',
        'appVersion': 'app_version',
      },
    );

Map<String, dynamic> _$DeviceRegisterToJson(DeviceRegister instance) =>
    <String, dynamic>{
      'push_kind': instance.pushKind,
      'token': instance.token,
      'relay_id': ?instance.relayId,
      'app_version': ?instance.appVersion,
      'locale': ?instance.locale,
    };
