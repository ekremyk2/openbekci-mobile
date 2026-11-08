// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'min_app_version.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MinAppVersionCWProxy {
  MinAppVersion android(String android);

  MinAppVersion ios(String ios);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MinAppVersion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MinAppVersion(...).copyWith(id: 12, name: "My name")
  /// ````
  MinAppVersion call({String android, String ios});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMinAppVersion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMinAppVersion.copyWith.fieldName(...)`
class _$MinAppVersionCWProxyImpl implements _$MinAppVersionCWProxy {
  const _$MinAppVersionCWProxyImpl(this._value);

  final MinAppVersion _value;

  @override
  MinAppVersion android(String android) => this(android: android);

  @override
  MinAppVersion ios(String ios) => this(ios: ios);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MinAppVersion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MinAppVersion(...).copyWith(id: 12, name: "My name")
  /// ````
  MinAppVersion call({
    Object? android = const $CopyWithPlaceholder(),
    Object? ios = const $CopyWithPlaceholder(),
  }) {
    return MinAppVersion(
      android: android == const $CopyWithPlaceholder()
          ? _value.android
          // ignore: cast_nullable_to_non_nullable
          : android as String,
      ios: ios == const $CopyWithPlaceholder()
          ? _value.ios
          // ignore: cast_nullable_to_non_nullable
          : ios as String,
    );
  }
}

extension $MinAppVersionCopyWith on MinAppVersion {
  /// Returns a callable class that can be used as follows: `instanceOfMinAppVersion.copyWith(...)` or like so:`instanceOfMinAppVersion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MinAppVersionCWProxy get copyWith => _$MinAppVersionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinAppVersion _$MinAppVersionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MinAppVersion', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['android', 'ios']);
      final val = MinAppVersion(
        android: $checkedConvert('android', (v) => v as String),
        ios: $checkedConvert('ios', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MinAppVersionToJson(MinAppVersion instance) =>
    <String, dynamic>{'android': instance.android, 'ios': instance.ios};
