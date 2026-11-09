// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OpeningHoursCWProxy {
  OpeningHours days(List<int> days);

  OpeningHours start(String start);

  OpeningHours end(String end);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OpeningHours(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OpeningHours(...).copyWith(id: 12, name: "My name")
  /// ````
  OpeningHours call({List<int> days, String start, String end});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOpeningHours.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOpeningHours.copyWith.fieldName(...)`
class _$OpeningHoursCWProxyImpl implements _$OpeningHoursCWProxy {
  const _$OpeningHoursCWProxyImpl(this._value);

  final OpeningHours _value;

  @override
  OpeningHours days(List<int> days) => this(days: days);

  @override
  OpeningHours start(String start) => this(start: start);

  @override
  OpeningHours end(String end) => this(end: end);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OpeningHours(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OpeningHours(...).copyWith(id: 12, name: "My name")
  /// ````
  OpeningHours call({
    Object? days = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
  }) {
    return OpeningHours(
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
    );
  }
}

extension $OpeningHoursCopyWith on OpeningHours {
  /// Returns a callable class that can be used as follows: `instanceOfOpeningHours.copyWith(...)` or like so:`instanceOfOpeningHours.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OpeningHoursCWProxy get copyWith => _$OpeningHoursCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OpeningHours', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['days', 'start', 'end']);
      final val = OpeningHours(
        days: $checkedConvert(
          'days',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
        start: $checkedConvert('start', (v) => v as String),
        end: $checkedConvert('end', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$OpeningHoursToJson(OpeningHours instance) =>
    <String, dynamic>{
      'days': instance.days,
      'start': instance.start,
      'end': instance.end,
    };
