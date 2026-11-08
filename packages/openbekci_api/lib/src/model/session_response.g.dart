// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionResponseCWProxy {
  SessionResponse sessionId(String sessionId);

  SessionResponse expiresAt(DateTime expiresAt);

  SessionResponse user(AuthUser user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionResponse call({String sessionId, DateTime expiresAt, AuthUser user});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSessionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSessionResponse.copyWith.fieldName(...)`
class _$SessionResponseCWProxyImpl implements _$SessionResponseCWProxy {
  const _$SessionResponseCWProxyImpl(this._value);

  final SessionResponse _value;

  @override
  SessionResponse sessionId(String sessionId) => this(sessionId: sessionId);

  @override
  SessionResponse expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  SessionResponse user(AuthUser user) => this(user: user);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionResponse call({
    Object? sessionId = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return SessionResponse(
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
    );
  }
}

extension $SessionResponseCopyWith on SessionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfSessionResponse.copyWith(...)` or like so:`instanceOfSessionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionResponseCWProxy get copyWith => _$SessionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SessionResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['session_id', 'expires_at', 'user'],
        );
        final val = SessionResponse(
          sessionId: $checkedConvert('session_id', (v) => v as String),
          expiresAt: $checkedConvert(
            'expires_at',
            (v) => DateTime.parse(v as String),
          ),
          user: $checkedConvert(
            'user',
            (v) => AuthUser.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'sessionId': 'session_id', 'expiresAt': 'expires_at'},
    );

Map<String, dynamic> _$SessionResponseToJson(SessionResponse instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'expires_at': instance.expiresAt.toIso8601String(),
      'user': instance.user.toJson(),
    };
