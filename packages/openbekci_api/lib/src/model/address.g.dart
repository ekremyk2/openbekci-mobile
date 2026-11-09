// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressCWProxy {
  Address line1(String line1);

  Address line2(String? line2);

  Address district(String? district);

  Address city(String? city);

  Address postalCode(String? postalCode);

  Address countryCode(String countryCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    String line1,
    String? line2,
    String? district,
    String? city,
    String? postalCode,
    String countryCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddress.copyWith.fieldName(...)`
class _$AddressCWProxyImpl implements _$AddressCWProxy {
  const _$AddressCWProxyImpl(this._value);

  final Address _value;

  @override
  Address line1(String line1) => this(line1: line1);

  @override
  Address line2(String? line2) => this(line2: line2);

  @override
  Address district(String? district) => this(district: district);

  @override
  Address city(String? city) => this(city: city);

  @override
  Address postalCode(String? postalCode) => this(postalCode: postalCode);

  @override
  Address countryCode(String countryCode) => this(countryCode: countryCode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    Object? line1 = const $CopyWithPlaceholder(),
    Object? line2 = const $CopyWithPlaceholder(),
    Object? district = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
    Object? countryCode = const $CopyWithPlaceholder(),
  }) {
    return Address(
      line1: line1 == const $CopyWithPlaceholder()
          ? _value.line1
          // ignore: cast_nullable_to_non_nullable
          : line1 as String,
      line2: line2 == const $CopyWithPlaceholder()
          ? _value.line2
          // ignore: cast_nullable_to_non_nullable
          : line2 as String?,
      district: district == const $CopyWithPlaceholder()
          ? _value.district
          // ignore: cast_nullable_to_non_nullable
          : district as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      postalCode: postalCode == const $CopyWithPlaceholder()
          ? _value.postalCode
          // ignore: cast_nullable_to_non_nullable
          : postalCode as String?,
      countryCode: countryCode == const $CopyWithPlaceholder()
          ? _value.countryCode
          // ignore: cast_nullable_to_non_nullable
          : countryCode as String,
    );
  }
}

extension $AddressCopyWith on Address {
  /// Returns a callable class that can be used as follows: `instanceOfAddress.copyWith(...)` or like so:`instanceOfAddress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressCWProxy get copyWith => _$AddressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Address',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'line1',
        'line2',
        'district',
        'city',
        'postal_code',
        'country_code',
      ],
    );
    final val = Address(
      line1: $checkedConvert('line1', (v) => v as String),
      line2: $checkedConvert('line2', (v) => v as String?),
      district: $checkedConvert('district', (v) => v as String?),
      city: $checkedConvert('city', (v) => v as String?),
      postalCode: $checkedConvert('postal_code', (v) => v as String?),
      countryCode: $checkedConvert('country_code', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'postalCode': 'postal_code',
    'countryCode': 'country_code',
  },
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'line1': instance.line1,
  'line2': instance.line2,
  'district': instance.district,
  'city': instance.city,
  'postal_code': instance.postalCode,
  'country_code': instance.countryCode,
};
