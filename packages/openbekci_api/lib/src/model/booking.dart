//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Booking {
  /// Returns a new [Booking] instance.
  Booking({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.facilityId,

    required  this.facilityName,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.personId,

    required  this.personDisplayName,

    required  this.start,

    required  this.end,

    required  this.status,

    required  this.chargeId,

    required  this.fee,

    required  this.refund,

    required  this.cancelledReason,

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
    
    name: r'facility_id',
    required: true,
    includeIfNull: false,
  )


  final String facilityId;



  @JsonKey(
    
    name: r'facility_name',
    required: true,
    includeIfNull: false,
  )


  final String facilityName;



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
    
    name: r'person_id',
    required: true,
    includeIfNull: true,
  )


  final String? personId;



      /// Managers and the booker only.
  @JsonKey(
    
    name: r'person_display_name',
    required: true,
    includeIfNull: true,
  )


  final String? personDisplayName;



  @JsonKey(
    
    name: r'start',
    required: true,
    includeIfNull: false,
  )


  final DateTime start;



  @JsonKey(
    
    name: r'end',
    required: true,
    includeIfNull: false,
  )


  final DateTime end;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: BookingStatusEnum.unknownDefaultOpenApi,
  )


  final BookingStatusEnum status;



  @JsonKey(
    
    name: r'charge_id',
    required: true,
    includeIfNull: true,
  )


  final String? chargeId;



  @JsonKey(
    
    name: r'fee',
    required: true,
    includeIfNull: true,
  )


  final Money? fee;



  @JsonKey(
    
    name: r'refund',
    required: true,
    includeIfNull: true,
  )


  final Money? refund;



  @JsonKey(
    
    name: r'cancelled_reason',
    required: true,
    includeIfNull: true,
  )


  final String? cancelledReason;



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
    bool operator ==(Object other) => identical(this, other) || other is Booking &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.facilityId == facilityId &&
      other.facilityName == facilityName &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.personId == personId &&
      other.personDisplayName == personDisplayName &&
      other.start == start &&
      other.end == end &&
      other.status == status &&
      other.chargeId == chargeId &&
      other.fee == fee &&
      other.refund == refund &&
      other.cancelledReason == cancelledReason &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        facilityId.hashCode +
        facilityName.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        (personId == null ? 0 : personId.hashCode) +
        (personDisplayName == null ? 0 : personDisplayName.hashCode) +
        start.hashCode +
        end.hashCode +
        status.hashCode +
        (chargeId == null ? 0 : chargeId.hashCode) +
        (fee == null ? 0 : fee.hashCode) +
        (refund == null ? 0 : refund.hashCode) +
        (cancelledReason == null ? 0 : cancelledReason.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum BookingStatusEnum {
@JsonValue(r'confirmed')
confirmed(r'confirmed'),
@JsonValue(r'cancelled')
cancelled(r'cancelled'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const BookingStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


