// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_sign_up_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinSignUpRequestCWProxy {
  JoinSignUpRequest phone(String? phone);

  JoinSignUpRequest email(String? email);

  JoinSignUpRequest name(String? name);

  JoinSignUpRequest locale(JoinSignUpRequestLocaleEnum? locale);

  JoinSignUpRequest client(JoinSignUpRequestClientEnum? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinSignUpRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinSignUpRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinSignUpRequest call({
    String? phone,
    String? email,
    String? name,
    JoinSignUpRequestLocaleEnum? locale,
    JoinSignUpRequestClientEnum? client,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinSignUpRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJoinSignUpRequest.copyWith.fieldName(...)`
class _$JoinSignUpRequestCWProxyImpl implements _$JoinSignUpRequestCWProxy {
  const _$JoinSignUpRequestCWProxyImpl(this._value);

  final JoinSignUpRequest _value;

  @override
  JoinSignUpRequest phone(String? phone) => this(phone: phone);

  @override
  JoinSignUpRequest email(String? email) => this(email: email);

  @override
  JoinSignUpRequest name(String? name) => this(name: name);

  @override
  JoinSignUpRequest locale(JoinSignUpRequestLocaleEnum? locale) =>
      this(locale: locale);

  @override
  JoinSignUpRequest client(JoinSignUpRequestClientEnum? client) =>
      this(client: client);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinSignUpRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinSignUpRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinSignUpRequest call({
    Object? phone = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) {
    return JoinSignUpRequest(
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as JoinSignUpRequestLocaleEnum?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as JoinSignUpRequestClientEnum?,
    );
  }
}

extension $JoinSignUpRequestCopyWith on JoinSignUpRequest {
  /// Returns a callable class that can be used as follows: `instanceOfJoinSignUpRequest.copyWith(...)` or like so:`instanceOfJoinSignUpRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinSignUpRequestCWProxy get copyWith =>
      _$JoinSignUpRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinSignUpRequest _$JoinSignUpRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('JoinSignUpRequest', json, ($checkedConvert) {
      final val = JoinSignUpRequest(
        phone: $checkedConvert('phone', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        locale: $checkedConvert(
          'locale',
          (v) =>
              $enumDecodeNullable(
                _$JoinSignUpRequestLocaleEnumEnumMap,
                v,
                unknownValue: JoinSignUpRequestLocaleEnum.unknownDefaultOpenApi,
              ) ??
              JoinSignUpRequestLocaleEnum.tr,
        ),
        client: $checkedConvert(
          'client',
          (v) =>
              $enumDecodeNullable(
                _$JoinSignUpRequestClientEnumEnumMap,
                v,
                unknownValue: JoinSignUpRequestClientEnum.unknownDefaultOpenApi,
              ) ??
              JoinSignUpRequestClientEnum.web,
        ),
      );
      return val;
    });

Map<String, dynamic> _$JoinSignUpRequestToJson(JoinSignUpRequest instance) =>
    <String, dynamic>{
      'phone': ?instance.phone,
      'email': ?instance.email,
      'name': ?instance.name,
      'locale': ?_$JoinSignUpRequestLocaleEnumEnumMap[instance.locale],
      'client': ?_$JoinSignUpRequestClientEnumEnumMap[instance.client],
    };

const _$JoinSignUpRequestLocaleEnumEnumMap = {
  JoinSignUpRequestLocaleEnum.tr: 'tr',
  JoinSignUpRequestLocaleEnum.en: 'en',
  JoinSignUpRequestLocaleEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$JoinSignUpRequestClientEnumEnumMap = {
  JoinSignUpRequestClientEnum.web: 'web',
  JoinSignUpRequestClientEnum.mobile: 'mobile',
  JoinSignUpRequestClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
