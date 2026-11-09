// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_entry_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorEntryCreateCWProxy {
  VisitorEntryCreate siteId(String siteId);

  VisitorEntryCreate unitId(String unitId);

  VisitorEntryCreate name(String name);

  VisitorEntryCreate plate(String? plate);

  VisitorEntryCreate windowFrom(DateTime windowFrom);

  VisitorEntryCreate windowTo(DateTime windowTo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorEntryCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorEntryCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorEntryCreate call({
    String siteId,
    String unitId,
    String name,
    String? plate,
    DateTime windowFrom,
    DateTime windowTo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorEntryCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVisitorEntryCreate.copyWith.fieldName(...)`
class _$VisitorEntryCreateCWProxyImpl implements _$VisitorEntryCreateCWProxy {
  const _$VisitorEntryCreateCWProxyImpl(this._value);

  final VisitorEntryCreate _value;

  @override
  VisitorEntryCreate siteId(String siteId) => this(siteId: siteId);

  @override
  VisitorEntryCreate unitId(String unitId) => this(unitId: unitId);

  @override
  VisitorEntryCreate name(String name) => this(name: name);

  @override
  VisitorEntryCreate plate(String? plate) => this(plate: plate);

  @override
  VisitorEntryCreate windowFrom(DateTime windowFrom) =>
      this(windowFrom: windowFrom);

  @override
  VisitorEntryCreate windowTo(DateTime windowTo) => this(windowTo: windowTo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorEntryCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorEntryCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorEntryCreate call({
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? plate = const $CopyWithPlaceholder(),
    Object? windowFrom = const $CopyWithPlaceholder(),
    Object? windowTo = const $CopyWithPlaceholder(),
  }) {
    return VisitorEntryCreate(
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      plate: plate == const $CopyWithPlaceholder()
          ? _value.plate
          // ignore: cast_nullable_to_non_nullable
          : plate as String?,
      windowFrom: windowFrom == const $CopyWithPlaceholder()
          ? _value.windowFrom
          // ignore: cast_nullable_to_non_nullable
          : windowFrom as DateTime,
      windowTo: windowTo == const $CopyWithPlaceholder()
          ? _value.windowTo
          // ignore: cast_nullable_to_non_nullable
          : windowTo as DateTime,
    );
  }
}

extension $VisitorEntryCreateCopyWith on VisitorEntryCreate {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorEntryCreate.copyWith(...)` or like so:`instanceOfVisitorEntryCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorEntryCreateCWProxy get copyWith =>
      _$VisitorEntryCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorEntryCreate _$VisitorEntryCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VisitorEntryCreate',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'site_id',
            'unit_id',
            'name',
            'window_from',
            'window_to',
          ],
        );
        final val = VisitorEntryCreate(
          siteId: $checkedConvert('site_id', (v) => v as String),
          unitId: $checkedConvert('unit_id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          plate: $checkedConvert('plate', (v) => v as String?),
          windowFrom: $checkedConvert(
            'window_from',
            (v) => DateTime.parse(v as String),
          ),
          windowTo: $checkedConvert(
            'window_to',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'siteId': 'site_id',
        'unitId': 'unit_id',
        'windowFrom': 'window_from',
        'windowTo': 'window_to',
      },
    );

Map<String, dynamic> _$VisitorEntryCreateToJson(VisitorEntryCreate instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'unit_id': instance.unitId,
      'name': instance.name,
      'plate': ?instance.plate,
      'window_from': instance.windowFrom.toIso8601String(),
      'window_to': instance.windowTo.toIso8601String(),
    };
