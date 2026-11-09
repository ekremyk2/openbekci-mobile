// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_visitor_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RecurringVisitorCreateCWProxy {
  RecurringVisitorCreate siteId(String siteId);

  RecurringVisitorCreate unitId(String unitId);

  RecurringVisitorCreate name(String name);

  RecurringVisitorCreate plate(String? plate);

  RecurringVisitorCreate days(List<int> days);

  RecurringVisitorCreate start(String start);

  RecurringVisitorCreate end(String end);

  RecurringVisitorCreate validFrom(String validFrom);

  RecurringVisitorCreate validTo(String? validTo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecurringVisitorCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecurringVisitorCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  RecurringVisitorCreate call({
    String siteId,
    String unitId,
    String name,
    String? plate,
    List<int> days,
    String start,
    String end,
    String validFrom,
    String? validTo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRecurringVisitorCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRecurringVisitorCreate.copyWith.fieldName(...)`
class _$RecurringVisitorCreateCWProxyImpl
    implements _$RecurringVisitorCreateCWProxy {
  const _$RecurringVisitorCreateCWProxyImpl(this._value);

  final RecurringVisitorCreate _value;

  @override
  RecurringVisitorCreate siteId(String siteId) => this(siteId: siteId);

  @override
  RecurringVisitorCreate unitId(String unitId) => this(unitId: unitId);

  @override
  RecurringVisitorCreate name(String name) => this(name: name);

  @override
  RecurringVisitorCreate plate(String? plate) => this(plate: plate);

  @override
  RecurringVisitorCreate days(List<int> days) => this(days: days);

  @override
  RecurringVisitorCreate start(String start) => this(start: start);

  @override
  RecurringVisitorCreate end(String end) => this(end: end);

  @override
  RecurringVisitorCreate validFrom(String validFrom) =>
      this(validFrom: validFrom);

  @override
  RecurringVisitorCreate validTo(String? validTo) => this(validTo: validTo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecurringVisitorCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecurringVisitorCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  RecurringVisitorCreate call({
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? plate = const $CopyWithPlaceholder(),
    Object? days = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? validFrom = const $CopyWithPlaceholder(),
    Object? validTo = const $CopyWithPlaceholder(),
  }) {
    return RecurringVisitorCreate(
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
      days: days == const $CopyWithPlaceholder()
          ? _value.days
          // ignore: cast_nullable_to_non_nullable
          : days as List<int>,
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as String,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as String,
      validFrom: validFrom == const $CopyWithPlaceholder()
          ? _value.validFrom
          // ignore: cast_nullable_to_non_nullable
          : validFrom as String,
      validTo: validTo == const $CopyWithPlaceholder()
          ? _value.validTo
          // ignore: cast_nullable_to_non_nullable
          : validTo as String?,
    );
  }
}

extension $RecurringVisitorCreateCopyWith on RecurringVisitorCreate {
  /// Returns a callable class that can be used as follows: `instanceOfRecurringVisitorCreate.copyWith(...)` or like so:`instanceOfRecurringVisitorCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RecurringVisitorCreateCWProxy get copyWith =>
      _$RecurringVisitorCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecurringVisitorCreate _$RecurringVisitorCreateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'RecurringVisitorCreate',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'site_id',
        'unit_id',
        'name',
        'days',
        'start',
        'end',
        'valid_from',
      ],
    );
    final val = RecurringVisitorCreate(
      siteId: $checkedConvert('site_id', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      plate: $checkedConvert('plate', (v) => v as String?),
      days: $checkedConvert(
        'days',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      start: $checkedConvert('start', (v) => v as String),
      end: $checkedConvert('end', (v) => v as String),
      validFrom: $checkedConvert('valid_from', (v) => v as String),
      validTo: $checkedConvert('valid_to', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'siteId': 'site_id',
    'unitId': 'unit_id',
    'validFrom': 'valid_from',
    'validTo': 'valid_to',
  },
);

Map<String, dynamic> _$RecurringVisitorCreateToJson(
  RecurringVisitorCreate instance,
) => <String, dynamic>{
  'site_id': instance.siteId,
  'unit_id': instance.unitId,
  'name': instance.name,
  'plate': ?instance.plate,
  'days': instance.days,
  'start': instance.start,
  'end': instance.end,
  'valid_from': instance.validFrom,
  'valid_to': ?instance.validTo,
};
