// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_settings_payments_card.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SiteSettingsPaymentsCardCWProxy {
  SiteSettingsPaymentsCard available(bool available);

  SiteSettingsPaymentsCard provider(String? provider);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettingsPaymentsCard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettingsPaymentsCard(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettingsPaymentsCard call({bool available, String? provider});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSiteSettingsPaymentsCard.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSiteSettingsPaymentsCard.copyWith.fieldName(...)`
class _$SiteSettingsPaymentsCardCWProxyImpl
    implements _$SiteSettingsPaymentsCardCWProxy {
  const _$SiteSettingsPaymentsCardCWProxyImpl(this._value);

  final SiteSettingsPaymentsCard _value;

  @override
  SiteSettingsPaymentsCard available(bool available) =>
      this(available: available);

  @override
  SiteSettingsPaymentsCard provider(String? provider) =>
      this(provider: provider);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettingsPaymentsCard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettingsPaymentsCard(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettingsPaymentsCard call({
    Object? available = const $CopyWithPlaceholder(),
    Object? provider = const $CopyWithPlaceholder(),
  }) {
    return SiteSettingsPaymentsCard(
      available: available == const $CopyWithPlaceholder()
          ? _value.available
          // ignore: cast_nullable_to_non_nullable
          : available as bool,
      provider: provider == const $CopyWithPlaceholder()
          ? _value.provider
          // ignore: cast_nullable_to_non_nullable
          : provider as String?,
    );
  }
}

extension $SiteSettingsPaymentsCardCopyWith on SiteSettingsPaymentsCard {
  /// Returns a callable class that can be used as follows: `instanceOfSiteSettingsPaymentsCard.copyWith(...)` or like so:`instanceOfSiteSettingsPaymentsCard.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SiteSettingsPaymentsCardCWProxy get copyWith =>
      _$SiteSettingsPaymentsCardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteSettingsPaymentsCard _$SiteSettingsPaymentsCardFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SiteSettingsPaymentsCard', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['available', 'provider']);
  final val = SiteSettingsPaymentsCard(
    available: $checkedConvert('available', (v) => v as bool),
    provider: $checkedConvert('provider', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SiteSettingsPaymentsCardToJson(
  SiteSettingsPaymentsCard instance,
) => <String, dynamic>{
  'available': instance.available,
  'provider': instance.provider,
};
