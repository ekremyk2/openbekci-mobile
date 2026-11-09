// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingCWProxy {
  Booking id(String id);

  Booking orgId(String orgId);

  Booking siteId(String siteId);

  Booking facilityId(String facilityId);

  Booking facilityName(String facilityName);

  Booking unitId(String unitId);

  Booking unitDoorNumber(String unitDoorNumber);

  Booking personId(String? personId);

  Booking personDisplayName(String? personDisplayName);

  Booking start(DateTime start);

  Booking end(DateTime end);

  Booking status(BookingStatusEnum status);

  Booking chargeId(String? chargeId);

  Booking fee(Money? fee);

  Booking refund(Money? refund);

  Booking cancelledReason(String? cancelledReason);

  Booking createdAt(DateTime createdAt);

  Booking updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Booking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Booking(...).copyWith(id: 12, name: "My name")
  /// ````
  Booking call({
    String id,
    String orgId,
    String siteId,
    String facilityId,
    String facilityName,
    String unitId,
    String unitDoorNumber,
    String? personId,
    String? personDisplayName,
    DateTime start,
    DateTime end,
    BookingStatusEnum status,
    String? chargeId,
    Money? fee,
    Money? refund,
    String? cancelledReason,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBooking.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBooking.copyWith.fieldName(...)`
class _$BookingCWProxyImpl implements _$BookingCWProxy {
  const _$BookingCWProxyImpl(this._value);

  final Booking _value;

  @override
  Booking id(String id) => this(id: id);

  @override
  Booking orgId(String orgId) => this(orgId: orgId);

  @override
  Booking siteId(String siteId) => this(siteId: siteId);

  @override
  Booking facilityId(String facilityId) => this(facilityId: facilityId);

  @override
  Booking facilityName(String facilityName) => this(facilityName: facilityName);

  @override
  Booking unitId(String unitId) => this(unitId: unitId);

  @override
  Booking unitDoorNumber(String unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  Booking personId(String? personId) => this(personId: personId);

  @override
  Booking personDisplayName(String? personDisplayName) =>
      this(personDisplayName: personDisplayName);

  @override
  Booking start(DateTime start) => this(start: start);

  @override
  Booking end(DateTime end) => this(end: end);

  @override
  Booking status(BookingStatusEnum status) => this(status: status);

  @override
  Booking chargeId(String? chargeId) => this(chargeId: chargeId);

  @override
  Booking fee(Money? fee) => this(fee: fee);

  @override
  Booking refund(Money? refund) => this(refund: refund);

  @override
  Booking cancelledReason(String? cancelledReason) =>
      this(cancelledReason: cancelledReason);

  @override
  Booking createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Booking updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Booking(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Booking(...).copyWith(id: 12, name: "My name")
  /// ````
  Booking call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? facilityId = const $CopyWithPlaceholder(),
    Object? facilityName = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
    Object? personDisplayName = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? end = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? chargeId = const $CopyWithPlaceholder(),
    Object? fee = const $CopyWithPlaceholder(),
    Object? refund = const $CopyWithPlaceholder(),
    Object? cancelledReason = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Booking(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      facilityId: facilityId == const $CopyWithPlaceholder()
          ? _value.facilityId
          // ignore: cast_nullable_to_non_nullable
          : facilityId as String,
      facilityName: facilityName == const $CopyWithPlaceholder()
          ? _value.facilityName
          // ignore: cast_nullable_to_non_nullable
          : facilityName as String,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      unitDoorNumber: unitDoorNumber == const $CopyWithPlaceholder()
          ? _value.unitDoorNumber
          // ignore: cast_nullable_to_non_nullable
          : unitDoorNumber as String,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
      personDisplayName: personDisplayName == const $CopyWithPlaceholder()
          ? _value.personDisplayName
          // ignore: cast_nullable_to_non_nullable
          : personDisplayName as String?,
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime,
      end: end == const $CopyWithPlaceholder()
          ? _value.end
          // ignore: cast_nullable_to_non_nullable
          : end as DateTime,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BookingStatusEnum,
      chargeId: chargeId == const $CopyWithPlaceholder()
          ? _value.chargeId
          // ignore: cast_nullable_to_non_nullable
          : chargeId as String?,
      fee: fee == const $CopyWithPlaceholder()
          ? _value.fee
          // ignore: cast_nullable_to_non_nullable
          : fee as Money?,
      refund: refund == const $CopyWithPlaceholder()
          ? _value.refund
          // ignore: cast_nullable_to_non_nullable
          : refund as Money?,
      cancelledReason: cancelledReason == const $CopyWithPlaceholder()
          ? _value.cancelledReason
          // ignore: cast_nullable_to_non_nullable
          : cancelledReason as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $BookingCopyWith on Booking {
  /// Returns a callable class that can be used as follows: `instanceOfBooking.copyWith(...)` or like so:`instanceOfBooking.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingCWProxy get copyWith => _$BookingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Booking',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'facility_id',
        'facility_name',
        'unit_id',
        'unit_door_number',
        'person_id',
        'person_display_name',
        'start',
        'end',
        'status',
        'charge_id',
        'fee',
        'refund',
        'cancelled_reason',
        'created_at',
        'updated_at',
      ],
    );
    final val = Booking(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      facilityId: $checkedConvert('facility_id', (v) => v as String),
      facilityName: $checkedConvert('facility_name', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String),
      personId: $checkedConvert('person_id', (v) => v as String?),
      personDisplayName: $checkedConvert(
        'person_display_name',
        (v) => v as String?,
      ),
      start: $checkedConvert('start', (v) => DateTime.parse(v as String)),
      end: $checkedConvert('end', (v) => DateTime.parse(v as String)),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$BookingStatusEnumEnumMap,
          v,
          unknownValue: BookingStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      chargeId: $checkedConvert('charge_id', (v) => v as String?),
      fee: $checkedConvert(
        'fee',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      refund: $checkedConvert(
        'refund',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      cancelledReason: $checkedConvert('cancelled_reason', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'facilityId': 'facility_id',
    'facilityName': 'facility_name',
    'unitId': 'unit_id',
    'unitDoorNumber': 'unit_door_number',
    'personId': 'person_id',
    'personDisplayName': 'person_display_name',
    'chargeId': 'charge_id',
    'cancelledReason': 'cancelled_reason',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'facility_id': instance.facilityId,
  'facility_name': instance.facilityName,
  'unit_id': instance.unitId,
  'unit_door_number': instance.unitDoorNumber,
  'person_id': instance.personId,
  'person_display_name': instance.personDisplayName,
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
  'status': _$BookingStatusEnumEnumMap[instance.status]!,
  'charge_id': instance.chargeId,
  'fee': instance.fee?.toJson(),
  'refund': instance.refund?.toJson(),
  'cancelled_reason': instance.cancelledReason,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$BookingStatusEnumEnumMap = {
  BookingStatusEnum.confirmed: 'confirmed',
  BookingStatusEnum.cancelled: 'cancelled',
  BookingStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
