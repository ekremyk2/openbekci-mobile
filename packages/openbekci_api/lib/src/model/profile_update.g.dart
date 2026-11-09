// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileUpdateCWProxy {
  ProfileUpdate displayName(String? displayName);

  ProfileUpdate locale(String? locale);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileUpdate call({String? displayName, String? locale});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileUpdate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileUpdate.copyWith.fieldName(...)`
class _$ProfileUpdateCWProxyImpl implements _$ProfileUpdateCWProxy {
  const _$ProfileUpdateCWProxyImpl(this._value);

  final ProfileUpdate _value;

  @override
  ProfileUpdate displayName(String? displayName) =>
      this(displayName: displayName);

  @override
  ProfileUpdate locale(String? locale) => this(locale: locale);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileUpdate call({
    Object? displayName = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
  }) {
    return ProfileUpdate(
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String?,
    );
  }
}

extension $ProfileUpdateCopyWith on ProfileUpdate {
  /// Returns a callable class that can be used as follows: `instanceOfProfileUpdate.copyWith(...)` or like so:`instanceOfProfileUpdate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileUpdateCWProxy get copyWith => _$ProfileUpdateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdate _$ProfileUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ProfileUpdate', json, ($checkedConvert) {
      final val = ProfileUpdate(
        displayName: $checkedConvert('display_name', (v) => v as String?),
        locale: $checkedConvert('locale', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'displayName': 'display_name'});

Map<String, dynamic> _$ProfileUpdateToJson(ProfileUpdate instance) =>
    <String, dynamic>{
      'display_name': ?instance.displayName,
      'locale': ?instance.locale,
    };
