// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_range.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TimeRangeCWProxy {
  TimeRange start(DateTime start);

  TimeRange end(DateTime end);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeRange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeRange(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeRange call({DateTime start, DateTime end});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimeRange.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimeRange.copyWith.fieldName(...)`
class _$TimeRangeCWProxyImpl implements _$TimeRangeCWProxy {
  const _$TimeRangeCWProxyImpl(this._value);

  final TimeRange _value;

  @override
  TimeRange start(DateTime start) => this(start: start);

  @override
  TimeRange end(DateTime end) => this(end: end);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeRange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeRange(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeRange call({
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
  }) {
    return TimeRange(
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as DateTime,
    );
  }
}

extension $TimeRangeCopyWith on TimeRange {
  /// Returns a callable class that can be used as follows: `instanceOfTimeRange.copyWith(...)` or like so:`instanceOfTimeRange.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeRangeCWProxy get copyWith => _$TimeRangeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TimeRange', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['start', 'end']);
      final val = TimeRange(
        start: $checkedConvert('start', (v) => DateTime.parse(v as String)),
        end: $checkedConvert('end', (v) => DateTime.parse(v as String)),
      );
      return val;
    });

Map<String, dynamic> _$TimeRangeToJson(TimeRange instance) => <String, dynamic>{
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
};
