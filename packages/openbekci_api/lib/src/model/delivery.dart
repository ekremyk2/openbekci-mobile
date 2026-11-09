//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Delivery {
  /// Returns a new [Delivery] instance.
  Delivery({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.receivedAt,

    required  this.receivedByDisplayName,

    required  this.description,

    required  this.status,

    required  this.collectedAt,

    required  this.collectedByName,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'unit_door_number',
    required: true,
    includeIfNull: false,
  )


  final String unitDoorNumber;



  @JsonKey(
    
    name: r'received_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime receivedAt;



  @JsonKey(
    
    name: r'received_by_display_name',
    required: true,
    includeIfNull: true,
  )


  final String? receivedByDisplayName;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: true,
  )


  final String? description;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: DeliveryStatusEnum.unknownDefaultOpenApi,
  )


  final DeliveryStatusEnum status;



  @JsonKey(
    
    name: r'collected_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? collectedAt;



  @JsonKey(
    
    name: r'collected_by_name',
    required: true,
    includeIfNull: true,
  )


  final String? collectedByName;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Delivery &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.receivedAt == receivedAt &&
      other.receivedByDisplayName == receivedByDisplayName &&
      other.description == description &&
      other.status == status &&
      other.collectedAt == collectedAt &&
      other.collectedByName == collectedByName &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        receivedAt.hashCode +
        (receivedByDisplayName == null ? 0 : receivedByDisplayName.hashCode) +
        (description == null ? 0 : description.hashCode) +
        status.hashCode +
        (collectedAt == null ? 0 : collectedAt.hashCode) +
        (collectedByName == null ? 0 : collectedByName.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Delivery.fromJson(Map<String, dynamic> json) => _$DeliveryFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum DeliveryStatusEnum {
@JsonValue(r'waiting')
waiting(r'waiting'),
@JsonValue(r'collected')
collected(r'collected'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DeliveryStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


