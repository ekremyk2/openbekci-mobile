// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_settings_pack_defaults_value.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SiteSettingsPackDefaultsValueCWProxy {
  SiteSettingsPackDefaultsValue pack(String pack);

  SiteSettingsPackDefaultsValue value(Object? value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettingsPackDefaultsValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettingsPackDefaultsValue(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettingsPackDefaultsValue call({String pack, Object? value});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSiteSettingsPackDefaultsValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSiteSettingsPackDefaultsValue.copyWith.fieldName(...)`
class _$SiteSettingsPackDefaultsValueCWProxyImpl
    implements _$SiteSettingsPackDefaultsValueCWProxy {
  const _$SiteSettingsPackDefaultsValueCWProxyImpl(this._value);

  final SiteSettingsPackDefaultsValue _value;

  @override
  SiteSettingsPackDefaultsValue pack(String pack) => this(pack: pack);

  @override
  SiteSettingsPackDefaultsValue value(Object? value) => this(value: value);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettingsPackDefaultsValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettingsPackDefaultsValue(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettingsPackDefaultsValue call({
    Object? pack = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return SiteSettingsPackDefaultsValue(
      pack: pack == const $CopyWithPlaceholder()
          ? _value.pack
          // ignore: cast_nullable_to_non_nullable
          : pack as String,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as Object?,
    );
  }
}

extension $SiteSettingsPackDefaultsValueCopyWith
    on SiteSettingsPackDefaultsValue {
  /// Returns a callable class that can be used as follows: `instanceOfSiteSettingsPackDefaultsValue.copyWith(...)` or like so:`instanceOfSiteSettingsPackDefaultsValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SiteSettingsPackDefaultsValueCWProxy get copyWith =>
      _$SiteSettingsPackDefaultsValueCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteSettingsPackDefaultsValue _$SiteSettingsPackDefaultsValueFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SiteSettingsPackDefaultsValue', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['pack', 'value']);
  final val = SiteSettingsPackDefaultsValue(
    pack: $checkedConvert('pack', (v) => v as String),
    value: $checkedConvert('value', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$SiteSettingsPackDefaultsValueToJson(
  SiteSettingsPackDefaultsValue instance,
) => <String, dynamic>{'pack': instance.pack, 'value': instance.value};
