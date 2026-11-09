// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeliveryCWProxy {
  Delivery id(String id);

  Delivery orgId(String orgId);

  Delivery siteId(String siteId);

  Delivery unitId(String unitId);

  Delivery unitDoorNumber(String unitDoorNumber);

  Delivery receivedAt(DateTime receivedAt);

  Delivery receivedByDisplayName(String? receivedByDisplayName);

  Delivery description(String? description);

  Delivery status(DeliveryStatusEnum status);

  Delivery collectedAt(DateTime? collectedAt);

  Delivery collectedByName(String? collectedByName);

  Delivery createdAt(DateTime createdAt);

  Delivery updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Delivery(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Delivery(...).copyWith(id: 12, name: "My name")
  /// ````
  Delivery call({
    String id,
    String orgId,
    String siteId,
    String unitId,
    String unitDoorNumber,
    DateTime receivedAt,
    String? receivedByDisplayName,
    String? description,
    DeliveryStatusEnum status,
    DateTime? collectedAt,
    String? collectedByName,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDelivery.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDelivery.copyWith.fieldName(...)`
class _$DeliveryCWProxyImpl implements _$DeliveryCWProxy {
  const _$DeliveryCWProxyImpl(this._value);

  final Delivery _value;

  @override
  Delivery id(String id) => this(id: id);

  @override
  Delivery orgId(String orgId) => this(orgId: orgId);

  @override
  Delivery siteId(String siteId) => this(siteId: siteId);

  @override
  Delivery unitId(String unitId) => this(unitId: unitId);

  @override
  Delivery unitDoorNumber(String unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  Delivery receivedAt(DateTime receivedAt) => this(receivedAt: receivedAt);

  @override
  Delivery receivedByDisplayName(String? receivedByDisplayName) =>
      this(receivedByDisplayName: receivedByDisplayName);

  @override
  Delivery description(String? description) => this(description: description);

  @override
  Delivery status(DeliveryStatusEnum status) => this(status: status);

  @override
  Delivery collectedAt(DateTime? collectedAt) => this(collectedAt: collectedAt);

  @override
  Delivery collectedByName(String? collectedByName) =>
      this(collectedByName: collectedByName);

  @override
  Delivery createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Delivery updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Delivery(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Delivery(...).copyWith(id: 12, name: "My name")
  /// ````
  Delivery call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? receivedAt = const $CopyWithPlaceholder(),
    Object? receivedByDisplayName = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? collectedAt = const $CopyWithPlaceholder(),
    Object? collectedByName = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Delivery(
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
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      unitDoorNumber: unitDoorNumber == const $CopyWithPlaceholder()
          ? _value.unitDoorNumber
          // ignore: cast_nullable_to_non_nullable
          : unitDoorNumber as String,
      receivedAt: receivedAt == const $CopyWithPlaceholder()
          ? _value.receivedAt
          // ignore: cast_nullable_to_non_nullable
          : receivedAt as DateTime,
      receivedByDisplayName:
          receivedByDisplayName == const $CopyWithPlaceholder()
          ? _value.receivedByDisplayName
          // ignore: cast_nullable_to_non_nullable
          : receivedByDisplayName as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DeliveryStatusEnum,
      collectedAt: collectedAt == const $CopyWithPlaceholder()
          ? _value.collectedAt
          // ignore: cast_nullable_to_non_nullable
          : collectedAt as DateTime?,
      collectedByName: collectedByName == const $CopyWithPlaceholder()
          ? _value.collectedByName
          // ignore: cast_nullable_to_non_nullable
          : collectedByName as String?,
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

extension $DeliveryCopyWith on Delivery {
  /// Returns a callable class that can be used as follows: `instanceOfDelivery.copyWith(...)` or like so:`instanceOfDelivery.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeliveryCWProxy get copyWith => _$DeliveryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Delivery',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'unit_id',
        'unit_door_number',
        'received_at',
        'received_by_display_name',
        'description',
        'status',
        'collected_at',
        'collected_by_name',
        'created_at',
        'updated_at',
      ],
    );
    final val = Delivery(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String),
      receivedAt: $checkedConvert(
        'received_at',
        (v) => DateTime.parse(v as String),
      ),
      receivedByDisplayName: $checkedConvert(
        'received_by_display_name',
        (v) => v as String?,
      ),
      description: $checkedConvert('description', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$DeliveryStatusEnumEnumMap,
          v,
          unknownValue: DeliveryStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      collectedAt: $checkedConvert(
        'collected_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      collectedByName: $checkedConvert(
        'collected_by_name',
        (v) => v as String?,
      ),
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
    'unitId': 'unit_id',
    'unitDoorNumber': 'unit_door_number',
    'receivedAt': 'received_at',
    'receivedByDisplayName': 'received_by_display_name',
    'collectedAt': 'collected_at',
    'collectedByName': 'collected_by_name',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'unit_id': instance.unitId,
  'unit_door_number': instance.unitDoorNumber,
  'received_at': instance.receivedAt.toIso8601String(),
  'received_by_display_name': instance.receivedByDisplayName,
  'description': instance.description,
  'status': _$DeliveryStatusEnumEnumMap[instance.status]!,
  'collected_at': instance.collectedAt?.toIso8601String(),
  'collected_by_name': instance.collectedByName,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$DeliveryStatusEnumEnumMap = {
  DeliveryStatusEnum.waiting: 'waiting',
  DeliveryStatusEnum.collected: 'collected',
  DeliveryStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
