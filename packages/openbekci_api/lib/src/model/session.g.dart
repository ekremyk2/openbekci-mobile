// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionCWProxy {
  Session id(String id);

  Session client(SessionClientEnum client);

  Session deviceName(String? deviceName);

  Session ip(String? ip);

  Session userAgent(String? userAgent);

  Session createdAt(DateTime createdAt);

  Session lastUsedAt(DateTime? lastUsedAt);

  Session expiresAt(DateTime expiresAt);

  Session current(bool current);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Session(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Session(...).copyWith(id: 12, name: "My name")
  /// ````
  Session call({
    String id,
    SessionClientEnum client,
    String? deviceName,
    String? ip,
    String? userAgent,
    DateTime createdAt,
    DateTime? lastUsedAt,
    DateTime expiresAt,
    bool current,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSession.copyWith.fieldName(...)`
class _$SessionCWProxyImpl implements _$SessionCWProxy {
  const _$SessionCWProxyImpl(this._value);

  final Session _value;

  @override
  Session id(String id) => this(id: id);

  @override
  Session client(SessionClientEnum client) => this(client: client);

  @override
  Session deviceName(String? deviceName) => this(deviceName: deviceName);

  @override
  Session ip(String? ip) => this(ip: ip);

  @override
  Session userAgent(String? userAgent) => this(userAgent: userAgent);

  @override
  Session createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Session lastUsedAt(DateTime? lastUsedAt) => this(lastUsedAt: lastUsedAt);

  @override
  Session expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  Session current(bool current) => this(current: current);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Session(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Session(...).copyWith(id: 12, name: "My name")
  /// ````
  Session call({
    Object? id = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
    Object? deviceName = const $CopyWithPlaceholder(),
    Object? ip = const $CopyWithPlaceholder(),
    Object? userAgent = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? lastUsedAt = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? current = const $CopyWithPlaceholder(),
  }) {
    return Session(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as SessionClientEnum,
      deviceName: deviceName == const $CopyWithPlaceholder()
          ? _value.deviceName
          // ignore: cast_nullable_to_non_nullable
          : deviceName as String?,
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      userAgent: userAgent == const $CopyWithPlaceholder()
          ? _value.userAgent
          // ignore: cast_nullable_to_non_nullable
          : userAgent as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      lastUsedAt: lastUsedAt == const $CopyWithPlaceholder()
          ? _value.lastUsedAt
          // ignore: cast_nullable_to_non_nullable
          : lastUsedAt as DateTime?,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      current: current == const $CopyWithPlaceholder()
          ? _value.current
          // ignore: cast_nullable_to_non_nullable
          : current as bool,
    );
  }
}

extension $SessionCopyWith on Session {
  /// Returns a callable class that can be used as follows: `instanceOfSession.copyWith(...)` or like so:`instanceOfSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionCWProxy get copyWith => _$SessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Session',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'client',
        'device_name',
        'ip',
        'user_agent',
        'created_at',
        'last_used_at',
        'expires_at',
        'current',
      ],
    );
    final val = Session(
      id: $checkedConvert('id', (v) => v as String),
      client: $checkedConvert(
        'client',
        (v) => $enumDecode(
          _$SessionClientEnumEnumMap,
          v,
          unknownValue: SessionClientEnum.unknownDefaultOpenApi,
        ),
      ),
      deviceName: $checkedConvert('device_name', (v) => v as String?),
      ip: $checkedConvert('ip', (v) => v as String?),
      userAgent: $checkedConvert('user_agent', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      lastUsedAt: $checkedConvert(
        'last_used_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      current: $checkedConvert('current', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'deviceName': 'device_name',
    'userAgent': 'user_agent',
    'createdAt': 'created_at',
    'lastUsedAt': 'last_used_at',
    'expiresAt': 'expires_at',
  },
);

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
  'id': instance.id,
  'client': _$SessionClientEnumEnumMap[instance.client]!,
  'device_name': instance.deviceName,
  'ip': instance.ip,
  'user_agent': instance.userAgent,
  'created_at': instance.createdAt.toIso8601String(),
  'last_used_at': instance.lastUsedAt?.toIso8601String(),
  'expires_at': instance.expiresAt.toIso8601String(),
  'current': instance.current,
};

const _$SessionClientEnumEnumMap = {
  SessionClientEnum.web: 'web',
  SessionClientEnum.mobile: 'mobile',
  SessionClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
