// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_link_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MagicLinkRequestCWProxy {
  MagicLinkRequest email(String email);

  MagicLinkRequest client(MagicLinkRequestClientEnum? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MagicLinkRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MagicLinkRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  MagicLinkRequest call({String email, MagicLinkRequestClientEnum? client});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMagicLinkRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMagicLinkRequest.copyWith.fieldName(...)`
class _$MagicLinkRequestCWProxyImpl implements _$MagicLinkRequestCWProxy {
  const _$MagicLinkRequestCWProxyImpl(this._value);

  final MagicLinkRequest _value;

  @override
  MagicLinkRequest email(String email) => this(email: email);

  @override
  MagicLinkRequest client(MagicLinkRequestClientEnum? client) =>
      this(client: client);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MagicLinkRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MagicLinkRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  MagicLinkRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) {
    return MagicLinkRequest(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as MagicLinkRequestClientEnum?,
    );
  }
}

extension $MagicLinkRequestCopyWith on MagicLinkRequest {
  /// Returns a callable class that can be used as follows: `instanceOfMagicLinkRequest.copyWith(...)` or like so:`instanceOfMagicLinkRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MagicLinkRequestCWProxy get copyWith => _$MagicLinkRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MagicLinkRequest _$MagicLinkRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MagicLinkRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email']);
      final val = MagicLinkRequest(
        email: $checkedConvert('email', (v) => v as String),
        client: $checkedConvert(
          'client',
          (v) =>
              $enumDecodeNullable(
                _$MagicLinkRequestClientEnumEnumMap,
                v,
                unknownValue: MagicLinkRequestClientEnum.unknownDefaultOpenApi,
              ) ??
              MagicLinkRequestClientEnum.web,
        ),
      );
      return val;
    });

Map<String, dynamic> _$MagicLinkRequestToJson(MagicLinkRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'client': ?_$MagicLinkRequestClientEnumEnumMap[instance.client],
    };

const _$MagicLinkRequestClientEnumEnumMap = {
  MagicLinkRequestClientEnum.web: 'web',
  MagicLinkRequestClientEnum.mobile: 'mobile',
  MagicLinkRequestClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
