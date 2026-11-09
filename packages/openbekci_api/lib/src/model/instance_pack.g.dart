// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance_pack.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InstancePackCWProxy {
  InstancePack id(String id);

  InstancePack version(String version);

  InstancePack minSdk(String minSdk);

  InstancePack countries(List<String> countries);

  InstancePack enabled(bool enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InstancePack(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InstancePack(...).copyWith(id: 12, name: "My name")
  /// ````
  InstancePack call({
    String id,
    String version,
    String minSdk,
    List<String> countries,
    bool enabled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInstancePack.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInstancePack.copyWith.fieldName(...)`
class _$InstancePackCWProxyImpl implements _$InstancePackCWProxy {
  const _$InstancePackCWProxyImpl(this._value);

  final InstancePack _value;

  @override
  InstancePack id(String id) => this(id: id);

  @override
  InstancePack version(String version) => this(version: version);

  @override
  InstancePack minSdk(String minSdk) => this(minSdk: minSdk);

  @override
  InstancePack countries(List<String> countries) => this(countries: countries);

  @override
  InstancePack enabled(bool enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InstancePack(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InstancePack(...).copyWith(id: 12, name: "My name")
  /// ````
  InstancePack call({
    Object? id = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? minSdk = const $CopyWithPlaceholder(),
    Object? countries = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return InstancePack(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String,
      minSdk: minSdk == const $CopyWithPlaceholder()
          ? _value.minSdk
          // ignore: cast_nullable_to_non_nullable
          : minSdk as String,
      countries: countries == const $CopyWithPlaceholder()
          ? _value.countries
          // ignore: cast_nullable_to_non_nullable
          : countries as List<String>,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as bool,
    );
  }
}

extension $InstancePackCopyWith on InstancePack {
  /// Returns a callable class that can be used as follows: `instanceOfInstancePack.copyWith(...)` or like so:`instanceOfInstancePack.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InstancePackCWProxy get copyWith => _$InstancePackCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstancePack _$InstancePackFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InstancePack', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'id',
          'version',
          'min_sdk',
          'countries',
          'enabled',
        ],
      );
      final val = InstancePack(
        id: $checkedConvert('id', (v) => v as String),
        version: $checkedConvert('version', (v) => v as String),
        minSdk: $checkedConvert('min_sdk', (v) => v as String),
        countries: $checkedConvert(
          'countries',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        enabled: $checkedConvert('enabled', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'minSdk': 'min_sdk'});

Map<String, dynamic> _$InstancePackToJson(InstancePack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'min_sdk': instance.minSdk,
      'countries': instance.countries,
      'enabled': instance.enabled,
    };
