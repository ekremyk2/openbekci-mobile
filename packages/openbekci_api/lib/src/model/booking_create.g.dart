// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingCreateCWProxy {
  BookingCreate facilityId(String facilityId);

  BookingCreate unitId(String unitId);

  BookingCreate start(DateTime start);

  BookingCreate end(DateTime end);

  BookingCreate personId(String? personId);

  BookingCreate debtorKind(BookingCreateDebtorKindEnum? debtorKind);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingCreate call({
    String facilityId,
    String unitId,
    DateTime start,
    DateTime end,
    String? personId,
    BookingCreateDebtorKindEnum? debtorKind,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBookingCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBookingCreate.copyWith.fieldName(...)`
class _$BookingCreateCWProxyImpl implements _$BookingCreateCWProxy {
  const _$BookingCreateCWProxyImpl(this._value);

  final BookingCreate _value;

  @override
  BookingCreate facilityId(String facilityId) => this(facilityId: facilityId);

  @override
  BookingCreate unitId(String unitId) => this(unitId: unitId);

  @override
  BookingCreate start(DateTime start) => this(start: start);

  @override
  BookingCreate end(DateTime end) => this(end: end);

  @override
  BookingCreate personId(String? personId) => this(personId: personId);

  @override
  BookingCreate debtorKind(BookingCreateDebtorKindEnum? debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingCreate call({
    Object? facilityId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
  }) {
    return BookingCreate(
      facilityId: facilityId == const $CopyWithPlaceholder()
          ? _value.facilityId
          // ignore: cast_nullable_to_non_nullable
          : facilityId as String,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as DateTime,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as BookingCreateDebtorKindEnum?,
    );
  }
}

extension $BookingCreateCopyWith on BookingCreate {
  /// Returns a callable class that can be used as follows: `instanceOfBookingCreate.copyWith(...)` or like so:`instanceOfBookingCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingCreateCWProxy get copyWith => _$BookingCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingCreate _$BookingCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BookingCreate',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['facility_id', 'unit_id', 'start', 'end'],
        );
        final val = BookingCreate(
          facilityId: $checkedConvert('facility_id', (v) => v as String),
          unitId: $checkedConvert('unit_id', (v) => v as String),
          start: $checkedConvert('start', (v) => DateTime.parse(v as String)),
          end: $checkedConvert('end', (v) => DateTime.parse(v as String)),
          personId: $checkedConvert('person_id', (v) => v as String?),
          debtorKind: $checkedConvert(
            'debtor_kind',
            (v) => $enumDecodeNullable(
              _$BookingCreateDebtorKindEnumEnumMap,
              v,
              unknownValue: BookingCreateDebtorKindEnum.unknownDefaultOpenApi,
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'facilityId': 'facility_id',
        'unitId': 'unit_id',
        'personId': 'person_id',
        'debtorKind': 'debtor_kind',
      },
    );

Map<String, dynamic> _$BookingCreateToJson(BookingCreate instance) =>
    <String, dynamic>{
      'facility_id': instance.facilityId,
      'unit_id': instance.unitId,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'person_id': ?instance.personId,
      'debtor_kind': ?_$BookingCreateDebtorKindEnumEnumMap[instance.debtorKind],
    };

const _$BookingCreateDebtorKindEnumEnumMap = {
  BookingCreateDebtorKindEnum.owner: 'owner',
  BookingCreateDebtorKindEnum.tenant: 'tenant',
  BookingCreateDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
