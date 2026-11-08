// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BrandingCWProxy {
  Branding logoUrl(String? logoUrl);

  Branding primaryColor(String? primaryColor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Branding(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Branding(...).copyWith(id: 12, name: "My name")
  /// ````
  Branding call({String? logoUrl, String? primaryColor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBranding.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBranding.copyWith.fieldName(...)`
class _$BrandingCWProxyImpl implements _$BrandingCWProxy {
  const _$BrandingCWProxyImpl(this._value);

  final Branding _value;

  @override
  Branding logoUrl(String? logoUrl) => this(logoUrl: logoUrl);

  @override
  Branding primaryColor(String? primaryColor) =>
      this(primaryColor: primaryColor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Branding(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Branding(...).copyWith(id: 12, name: "My name")
  /// ````
  Branding call({
    Object? logoUrl = const $CopyWithPlaceholder(),
    Object? primaryColor = const $CopyWithPlaceholder(),
  }) {
    return Branding(
      logoUrl: logoUrl == const $CopyWithPlaceholder()
          ? _value.logoUrl
          // ignore: cast_nullable_to_non_nullable
          : logoUrl as String?,
      primaryColor: primaryColor == const $CopyWithPlaceholder()
          ? _value.primaryColor
          // ignore: cast_nullable_to_non_nullable
          : primaryColor as String?,
    );
  }
}

extension $BrandingCopyWith on Branding {
  /// Returns a callable class that can be used as follows: `instanceOfBranding.copyWith(...)` or like so:`instanceOfBranding.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BrandingCWProxy get copyWith => _$BrandingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branding _$BrandingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Branding',
  json,
  ($checkedConvert) {
    final val = Branding(
      logoUrl: $checkedConvert('logo_url', (v) => v as String?),
      primaryColor: $checkedConvert('primary_color', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'logoUrl': 'logo_url', 'primaryColor': 'primary_color'},
);

Map<String, dynamic> _$BrandingToJson(Branding instance) => <String, dynamic>{
  'logo_url': ?instance.logoUrl,
  'primary_color': ?instance.primaryColor,
};
