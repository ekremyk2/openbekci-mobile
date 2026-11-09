// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeUserCWProxy {
  MeUser id(String id);

  MeUser displayName(String displayName);

  MeUser email(String? email);

  MeUser phone(String? phone);

  MeUser locale(String locale);

  MeUser isPlatformAdmin(bool isPlatformAdmin);

  MeUser version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeUser(...).copyWith(id: 12, name: "My name")
  /// ````
  MeUser call({
    String id,
    String displayName,
    String? email,
    String? phone,
    String locale,
    bool isPlatformAdmin,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeUser.copyWith.fieldName(...)`
class _$MeUserCWProxyImpl implements _$MeUserCWProxy {
  const _$MeUserCWProxyImpl(this._value);

  final MeUser _value;

  @override
  MeUser id(String id) => this(id: id);

  @override
  MeUser displayName(String displayName) => this(displayName: displayName);

  @override
  MeUser email(String? email) => this(email: email);

  @override
  MeUser phone(String? phone) => this(phone: phone);

  @override
  MeUser locale(String locale) => this(locale: locale);

  @override
  MeUser isPlatformAdmin(bool isPlatformAdmin) =>
      this(isPlatformAdmin: isPlatformAdmin);

  @override
  MeUser version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeUser(...).copyWith(id: 12, name: "My name")
  /// ````
  MeUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? isPlatformAdmin = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return MeUser(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
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
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $MeUserCopyWith on MeUser {
  /// Returns a callable class that can be used as follows: `instanceOfMeUser.copyWith(...)` or like so:`instanceOfMeUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeUserCWProxy get copyWith => _$MeUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeUser _$MeUserFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MeUser',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'display_name',
        'email',
        'phone',
        'locale',
        'is_platform_admin',
        'version',
      ],
    );
    final val = MeUser(
      id: $checkedConvert('id', (v) => v as String),
      displayName: $checkedConvert('display_name', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      locale: $checkedConvert('locale', (v) => v as String),
      isPlatformAdmin: $checkedConvert('is_platform_admin', (v) => v as bool),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'displayName': 'display_name',
    'isPlatformAdmin': 'is_platform_admin',
  },
);

Map<String, dynamic> _$MeUserToJson(MeUser instance) => <String, dynamic>{
  'id': instance.id,
  'display_name': instance.displayName,
  'email': instance.email,
  'phone': instance.phone,
  'locale': instance.locale,
  'is_platform_admin': instance.isPlatformAdmin,
  'version': instance.version,
};
