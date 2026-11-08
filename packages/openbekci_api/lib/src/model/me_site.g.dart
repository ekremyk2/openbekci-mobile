// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_site.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeSiteCWProxy {
  MeSite id(String id);

  MeSite name(String name);

  MeSite timezone(String timezone);

  MeSite currency(String currency);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeSite(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeSite(...).copyWith(id: 12, name: "My name")
  /// ````
  MeSite call({String id, String name, String timezone, String currency});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeSite.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeSite.copyWith.fieldName(...)`
class _$MeSiteCWProxyImpl implements _$MeSiteCWProxy {
  const _$MeSiteCWProxyImpl(this._value);

  final MeSite _value;

  @override
  MeSite id(String id) => this(id: id);

  @override
  MeSite name(String name) => this(name: name);

  @override
  MeSite timezone(String timezone) => this(timezone: timezone);

  @override
  MeSite currency(String currency) => this(currency: currency);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeSite(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeSite(...).copyWith(id: 12, name: "My name")
  /// ````
  MeSite call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? timezone = const $CopyWithPlaceholder(),
    Object? currency = const $CopyWithPlaceholder(),
  }) {
    return MeSite(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      timezone: timezone == const $CopyWithPlaceholder()
          ? _value.timezone
          // ignore: cast_nullable_to_non_nullable
          : timezone as String,
      currency: currency == const $CopyWithPlaceholder()
          ? _value.currency
          // ignore: cast_nullable_to_non_nullable
          : currency as String,
    );
  }
}

extension $MeSiteCopyWith on MeSite {
  /// Returns a callable class that can be used as follows: `instanceOfMeSite.copyWith(...)` or like so:`instanceOfMeSite.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeSiteCWProxy get copyWith => _$MeSiteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeSite _$MeSiteFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MeSite', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['id', 'name', 'timezone', 'currency'],
      );
      final val = MeSite(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        timezone: $checkedConvert('timezone', (v) => v as String),
        currency: $checkedConvert('currency', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MeSiteToJson(MeSite instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'timezone': instance.timezone,
  'currency': instance.currency,
};
