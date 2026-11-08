// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_link_consume_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MagicLinkConsumeRequestCWProxy {
  MagicLinkConsumeRequest token(String token);

  MagicLinkConsumeRequest client(MagicLinkConsumeRequestClientEnum? client);

  MagicLinkConsumeRequest deviceName(String? deviceName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MagicLinkConsumeRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MagicLinkConsumeRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  MagicLinkConsumeRequest call({
    String token,
    MagicLinkConsumeRequestClientEnum? client,
    String? deviceName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMagicLinkConsumeRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMagicLinkConsumeRequest.copyWith.fieldName(...)`
class _$MagicLinkConsumeRequestCWProxyImpl
    implements _$MagicLinkConsumeRequestCWProxy {
  const _$MagicLinkConsumeRequestCWProxyImpl(this._value);

  final MagicLinkConsumeRequest _value;

  @override
  MagicLinkConsumeRequest token(String token) => this(token: token);

  @override
  MagicLinkConsumeRequest client(MagicLinkConsumeRequestClientEnum? client) =>
      this(client: client);

  @override
  MagicLinkConsumeRequest deviceName(String? deviceName) =>
      this(deviceName: deviceName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MagicLinkConsumeRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MagicLinkConsumeRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  MagicLinkConsumeRequest call({
    Object? token = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
    Object? deviceName = const $CopyWithPlaceholder(),
  }) {
    return MagicLinkConsumeRequest(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as MagicLinkConsumeRequestClientEnum?,
      deviceName: deviceName == const $CopyWithPlaceholder()
          ? _value.deviceName
          // ignore: cast_nullable_to_non_nullable
          : deviceName as String?,
    );
  }
}

extension $MagicLinkConsumeRequestCopyWith on MagicLinkConsumeRequest {
  /// Returns a callable class that can be used as follows: `instanceOfMagicLinkConsumeRequest.copyWith(...)` or like so:`instanceOfMagicLinkConsumeRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MagicLinkConsumeRequestCWProxy get copyWith =>
      _$MagicLinkConsumeRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MagicLinkConsumeRequest _$MagicLinkConsumeRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MagicLinkConsumeRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['token']);
  final val = MagicLinkConsumeRequest(
    token: $checkedConvert('token', (v) => v as String),
    client: $checkedConvert(
      'client',
      (v) =>
          $enumDecodeNullable(
            _$MagicLinkConsumeRequestClientEnumEnumMap,
            v,
            unknownValue:
                MagicLinkConsumeRequestClientEnum.unknownDefaultOpenApi,
          ) ??
          MagicLinkConsumeRequestClientEnum.web,
    ),
    deviceName: $checkedConvert('device_name', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'deviceName': 'device_name'});

Map<String, dynamic> _$MagicLinkConsumeRequestToJson(
  MagicLinkConsumeRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'client': ?_$MagicLinkConsumeRequestClientEnumEnumMap[instance.client],
  'device_name': ?instance.deviceName,
};

const _$MagicLinkConsumeRequestClientEnumEnumMap = {
  MagicLinkConsumeRequestClientEnum.web: 'web',
  MagicLinkConsumeRequestClientEnum.mobile: 'mobile',
  MagicLinkConsumeRequestClientEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
