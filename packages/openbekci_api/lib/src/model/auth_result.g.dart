// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthResultCWProxy {
  AuthResult client(AuthResultClientEnum client);

  AuthResult sessionId(String sessionId);

  AuthResult expiresAt(DateTime expiresAt);

  AuthResult user(AuthUser user);

  AuthResult accessToken(String? accessToken);

  AuthResult refreshToken(String? refreshToken);

  AuthResult refreshExpiresAt(DateTime? refreshExpiresAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthResult(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthResult call({
    AuthResultClientEnum client,
    String sessionId,
    DateTime expiresAt,
    AuthUser user,
    String? accessToken,
    String? refreshToken,
    DateTime? refreshExpiresAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthResult.copyWith.fieldName(...)`
class _$AuthResultCWProxyImpl implements _$AuthResultCWProxy {
  const _$AuthResultCWProxyImpl(this._value);

  final AuthResult _value;

  @override
  AuthResult client(AuthResultClientEnum client) => this(client: client);

  @override
  AuthResult sessionId(String sessionId) => this(sessionId: sessionId);

  @override
  AuthResult expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  AuthResult user(AuthUser user) => this(user: user);

  @override
  AuthResult accessToken(String? accessToken) => this(accessToken: accessToken);

  @override
  AuthResult refreshToken(String? refreshToken) =>
      this(refreshToken: refreshToken);

  @override
  AuthResult refreshExpiresAt(DateTime? refreshExpiresAt) =>
      this(refreshExpiresAt: refreshExpiresAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthResult(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthResult call({
    Object? client = const $CopyWithPlaceholder(),
    Object? sessionId = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
    Object? refreshExpiresAt = const $CopyWithPlaceholder(),
  }) {
    return AuthResult(
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as AuthResultClientEnum,
      sessionId: sessionId == const $CopyWithPlaceholder()
          ? _value.sessionId
          // ignore: cast_nullable_to_non_nullable
          : sessionId as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AuthUser,
      accessToken: accessToken == const $CopyWithPlaceholder()
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String?,
      refreshToken: refreshToken == const $CopyWithPlaceholder()
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String?,
      refreshExpiresAt: refreshExpiresAt == const $CopyWithPlaceholder()
          ? _value.refreshExpiresAt
          // ignore: cast_nullable_to_non_nullable
          : refreshExpiresAt as DateTime?,
    );
  }
}

extension $AuthResultCopyWith on AuthResult {
  /// Returns a callable class that can be used as follows: `instanceOfAuthResult.copyWith(...)` or like so:`instanceOfAuthResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthResultCWProxy get copyWith => _$AuthResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AuthResult',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['client', 'session_id', 'expires_at', 'user'],
    );
    final val = AuthResult(
      client: $checkedConvert(
        'client',
        (v) => $enumDecode(
          _$AuthResultClientEnumEnumMap,
          v,
          unknownValue: AuthResultClientEnum.unknownDefaultOpenApi,
        ),
      ),
      sessionId: $checkedConvert('session_id', (v) => v as String),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      user: $checkedConvert(
        'user',
        (v) => AuthUser.fromJson(v as Map<String, dynamic>),
      ),
      accessToken: $checkedConvert('access_token', (v) => v as String?),
      refreshToken: $checkedConvert('refresh_token', (v) => v as String?),
      refreshExpiresAt: $checkedConvert(
        'refresh_expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'sessionId': 'session_id',
    'expiresAt': 'expires_at',
    'accessToken': 'access_token',
    'refreshToken': 'refresh_token',
    'refreshExpiresAt': 'refresh_expires_at',
  },
);

Map<String, dynamic> _$AuthResultToJson(AuthResult instance) =>
    <String, dynamic>{
      'client': _$AuthResultClientEnumEnumMap[instance.client]!,
      'session_id': instance.sessionId,
      'expires_at': instance.expiresAt.toIso8601String(),
      'user': instance.user.toJson(),
      'access_token': ?instance.accessToken,
      'refresh_token': ?instance.refreshToken,
      'refresh_expires_at': ?instance.refreshExpiresAt?.toIso8601String(),
    };

const _$AuthResultClientEnumEnumMap = {
  AuthResultClientEnum.web: 'web',
  AuthResultClientEnum.mobile: 'mobile',
  AuthResultClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
