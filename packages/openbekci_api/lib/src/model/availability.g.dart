// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AvailabilityCWProxy {
  Availability facilityId(String facilityId);

  Availability from(DateTime from);

  Availability to(DateTime to);

  Availability taken(List<TimeRange> taken);

  Availability blocked(List<TimeRange> blocked);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Availability(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Availability(...).copyWith(id: 12, name: "My name")
  /// ````
  Availability call({
    String facilityId,
    DateTime from,
    DateTime to,
    List<TimeRange> taken,
    List<TimeRange> blocked,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAvailability.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAvailability.copyWith.fieldName(...)`
class _$AvailabilityCWProxyImpl implements _$AvailabilityCWProxy {
  const _$AvailabilityCWProxyImpl(this._value);

  final Availability _value;

  @override
  Availability facilityId(String facilityId) => this(facilityId: facilityId);

  @override
  Availability from(DateTime from) => this(from: from);

  @override
  Availability to(DateTime to) => this(to: to);

  @override
  Availability taken(List<TimeRange> taken) => this(taken: taken);

  @override
  Availability blocked(List<TimeRange> blocked) => this(blocked: blocked);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Availability(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Availability(...).copyWith(id: 12, name: "My name")
  /// ````
  Availability call({
    Object? facilityId = const $CopyWithPlaceholder(),
    Object? from = const $CopyWithPlaceholder(),
    Object? to = const $CopyWithPlaceholder(),
    Object? taken = const $CopyWithPlaceholder(),
    Object? blocked = const $CopyWithPlaceholder(),
  }) {
    return Availability(
      facilityId: facilityId == const $CopyWithPlaceholder()
          ? _value.facilityId
          // ignore: cast_nullable_to_non_nullable
          : facilityId as String,
      from: from == const $CopyWithPlaceholder()
          ? _value.from
          // ignore: cast_nullable_to_non_nullable
          : from as DateTime,
      to: to == const $CopyWithPlaceholder()
          ? _value.to
          // ignore: cast_nullable_to_non_nullable
          : to as DateTime,
      taken: taken == const $CopyWithPlaceholder()
          ? _value.taken
          // ignore: cast_nullable_to_non_nullable
          : taken as List<TimeRange>,
      blocked: blocked == const $CopyWithPlaceholder()
          ? _value.blocked
          // ignore: cast_nullable_to_non_nullable
          : blocked as List<TimeRange>,
    );
  }
}

extension $AvailabilityCopyWith on Availability {
  /// Returns a callable class that can be used as follows: `instanceOfAvailability.copyWith(...)` or like so:`instanceOfAvailability.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AvailabilityCWProxy get copyWith => _$AvailabilityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Availability _$AvailabilityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Availability', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['facility_id', 'from', 'to', 'taken', 'blocked'],
      );
      final val = Availability(
        facilityId: $checkedConvert('facility_id', (v) => v as String),
        from: $checkedConvert('from', (v) => DateTime.parse(v as String)),
        to: $checkedConvert('to', (v) => DateTime.parse(v as String)),
        taken: $checkedConvert(
          'taken',
          (v) => (v as List<dynamic>)
              .map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        blocked: $checkedConvert(
          'blocked',
          (v) => (v as List<dynamic>)
              .map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'facilityId': 'facility_id'});

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'facility_id': instance.facilityId,
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
      'taken': instance.taken.map((e) => e.toJson()).toList(),
      'blocked': instance.blocked.map((e) => e.toJson()).toList(),
    };
