// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthUserCWProxy {
  AuthUser id(String id);

  AuthUser email(String? email);

  AuthUser phone(String? phone);

  AuthUser locale(String locale);

  AuthUser isPlatformAdmin(bool isPlatformAdmin);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthUser(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthUser call({
    String id,
    String? email,
    String? phone,
    String locale,
    bool isPlatformAdmin,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthUser.copyWith.fieldName(...)`
class _$AuthUserCWProxyImpl implements _$AuthUserCWProxy {
  const _$AuthUserCWProxyImpl(this._value);

  final AuthUser _value;

  @override
  AuthUser id(String id) => this(id: id);

  @override
  AuthUser email(String? email) => this(email: email);

  @override
  AuthUser phone(String? phone) => this(phone: phone);

  @override
  AuthUser locale(String locale) => this(locale: locale);

  @override
  AuthUser isPlatformAdmin(bool isPlatformAdmin) =>
      this(isPlatformAdmin: isPlatformAdmin);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthUser(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? isPlatformAdmin = const $CopyWithPlaceholder(),
  }) {
    return AuthUser(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String,
      isPlatformAdmin: isPlatformAdmin == const $CopyWithPlaceholder()
          ? _value.isPlatformAdmin
          // ignore: cast_nullable_to_non_nullable
          : isPlatformAdmin as bool,
    );
  }
}

extension $AuthUserCopyWith on AuthUser {
  /// Returns a callable class that can be used as follows: `instanceOfAuthUser.copyWith(...)` or like so:`instanceOfAuthUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthUserCWProxy get copyWith => _$AuthUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthUser', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'id',
          'email',
          'phone',
          'locale',
          'is_platform_admin',
        ],
      );
      final val = AuthUser(
        id: $checkedConvert('id', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        locale: $checkedConvert('locale', (v) => v as String),
        isPlatformAdmin: $checkedConvert('is_platform_admin', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'isPlatformAdmin': 'is_platform_admin'});

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'phone': instance.phone,
  'locale': instance.locale,
  'is_platform_admin': instance.isPlatformAdmin,
};
