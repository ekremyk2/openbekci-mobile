// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CredentialsCWProxy {
  Credentials method(String method);

  Credentials identifier(String identifier);

  Credentials password(String? password);

  Credentials code(String? code);

  Credentials client(CredentialsClientEnum? client);

  Credentials deviceName(String? deviceName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Credentials(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Credentials(...).copyWith(id: 12, name: "My name")
  /// ````
  Credentials call({
    String method,
    String identifier,
    String? password,
    String? code,
    CredentialsClientEnum? client,
    String? deviceName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCredentials.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCredentials.copyWith.fieldName(...)`
class _$CredentialsCWProxyImpl implements _$CredentialsCWProxy {
  const _$CredentialsCWProxyImpl(this._value);

  final Credentials _value;

  @override
  Credentials method(String method) => this(method: method);

  @override
  Credentials identifier(String identifier) => this(identifier: identifier);

  @override
  Credentials password(String? password) => this(password: password);

  @override
  Credentials code(String? code) => this(code: code);

  @override
  Credentials client(CredentialsClientEnum? client) => this(client: client);

  @override
  Credentials deviceName(String? deviceName) => this(deviceName: deviceName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Credentials(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Credentials(...).copyWith(id: 12, name: "My name")
  /// ````
  Credentials call({
    Object? method = const $CopyWithPlaceholder(),
    Object? identifier = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
    Object? deviceName = const $CopyWithPlaceholder(),
  }) {
    return Credentials(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      identifier: identifier == const $CopyWithPlaceholder()
          ? _value.identifier
          // ignore: cast_nullable_to_non_nullable
          : identifier as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as CredentialsClientEnum?,
      deviceName: deviceName == const $CopyWithPlaceholder()
          ? _value.deviceName
          // ignore: cast_nullable_to_non_nullable
          : deviceName as String?,
    );
  }
}

extension $CredentialsCopyWith on Credentials {
  /// Returns a callable class that can be used as follows: `instanceOfCredentials.copyWith(...)` or like so:`instanceOfCredentials.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CredentialsCWProxy get copyWith => _$CredentialsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credentials _$CredentialsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Credentials', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['method', 'identifier']);
      final val = Credentials(
        method: $checkedConvert('method', (v) => v as String),
        identifier: $checkedConvert('identifier', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String?),
        code: $checkedConvert('code', (v) => v as String?),
        client: $checkedConvert(
          'client',
          (v) =>
              $enumDecodeNullable(
                _$CredentialsClientEnumEnumMap,
                v,
                unknownValue: CredentialsClientEnum.unknownDefaultOpenApi,
              ) ??
              CredentialsClientEnum.web,
        ),
        deviceName: $checkedConvert('device_name', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'deviceName': 'device_name'});

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'method': instance.method,
      'identifier': instance.identifier,
      'password': ?instance.password,
      'code': ?instance.code,
      'client': ?_$CredentialsClientEnumEnumMap[instance.client],
      'device_name': ?instance.deviceName,
    };

const _$CredentialsClientEnumEnumMap = {
  CredentialsClientEnum.web: 'web',
  CredentialsClientEnum.mobile: 'mobile',
  CredentialsClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
