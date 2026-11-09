// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceCWProxy {
  Device id(String id);

  Device pushKind(String pushKind);

  Device relayId(String? relayId);

  Device appVersion(String? appVersion);

  Device locale(String? locale);

  Device enabled(bool enabled);

  Device createdAt(DateTime createdAt);

  Device updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Device(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Device(...).copyWith(id: 12, name: "My name")
  /// ````
  Device call({
    String id,
    String pushKind,
    String? relayId,
    String? appVersion,
    String? locale,
    bool enabled,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevice.copyWith.fieldName(...)`
class _$DeviceCWProxyImpl implements _$DeviceCWProxy {
  const _$DeviceCWProxyImpl(this._value);

  final Device _value;

  @override
  Device id(String id) => this(id: id);

  @override
  Device pushKind(String pushKind) => this(pushKind: pushKind);

  @override
  Device relayId(String? relayId) => this(relayId: relayId);

  @override
  Device appVersion(String? appVersion) => this(appVersion: appVersion);

  @override
  Device locale(String? locale) => this(locale: locale);

  @override
  Device enabled(bool enabled) => this(enabled: enabled);

  @override
  Device createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Device updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Device(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Device(...).copyWith(id: 12, name: "My name")
  /// ````
  Device call({
    Object? id = const $CopyWithPlaceholder(),
    Object? pushKind = const $CopyWithPlaceholder(),
    Object? relayId = const $CopyWithPlaceholder(),
    Object? appVersion = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Device(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      pushKind: pushKind == const $CopyWithPlaceholder()
          ? _value.pushKind
          // ignore: cast_nullable_to_non_nullable
          : pushKind as String,
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
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $DeviceCopyWith on Device {
  /// Returns a callable class that can be used as follows: `instanceOfDevice.copyWith(...)` or like so:`instanceOfDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceCWProxy get copyWith => _$DeviceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Device',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'push_kind',
        'relay_id',
        'app_version',
        'locale',
        'enabled',
        'created_at',
        'updated_at',
      ],
    );
    final val = Device(
      id: $checkedConvert('id', (v) => v as String),
      pushKind: $checkedConvert('push_kind', (v) => v as String),
      relayId: $checkedConvert('relay_id', (v) => v as String?),
      appVersion: $checkedConvert('app_version', (v) => v as String?),
      locale: $checkedConvert('locale', (v) => v as String?),
      enabled: $checkedConvert('enabled', (v) => v as bool),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'pushKind': 'push_kind',
    'relayId': 'relay_id',
    'appVersion': 'app_version',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'id': instance.id,
  'push_kind': instance.pushKind,
  'relay_id': instance.relayId,
  'app_version': instance.appVersion,
  'locale': instance.locale,
  'enabled': instance.enabled,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
