//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_approval_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VisitorApprovalRequest {
  /// Returns a new [VisitorApprovalRequest] instance.
  VisitorApprovalRequest({

    required  this.id,

    required  this.orgId,

    required  this.entryId,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.visitorName,

    required  this.plate,

    required  this.requestedAt,

    required  this.expiresAt,

    required  this.status,

    required  this.decidedBy,

    required  this.decidedAt,

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
    
    name: r'entry_id',
    required: true,
    includeIfNull: false,
  )


  final String entryId;



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
    
    name: r'visitor_name',
    required: true,
    includeIfNull: false,
  )


  final String visitorName;



  @JsonKey(
    
    name: r'plate',
    required: true,
    includeIfNull: true,
  )


  final String? plate;



  @JsonKey(
    
    name: r'requested_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime requestedAt;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: VisitorApprovalRequestStatusEnum.unknownDefaultOpenApi,
  )


  final VisitorApprovalRequestStatusEnum status;



  @JsonKey(
    
    name: r'decided_by',
    required: true,
    includeIfNull: true,
  )


  final String? decidedBy;



  @JsonKey(
    
    name: r'decided_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? decidedAt;



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
    bool operator ==(Object other) => identical(this, other) || other is VisitorApprovalRequest &&
      other.id == id &&
      other.orgId == orgId &&
      other.entryId == entryId &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.visitorName == visitorName &&
      other.plate == plate &&
      other.requestedAt == requestedAt &&
      other.expiresAt == expiresAt &&
      other.status == status &&
      other.decidedBy == decidedBy &&
      other.decidedAt == decidedAt &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        entryId.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        visitorName.hashCode +
        (plate == null ? 0 : plate.hashCode) +
        requestedAt.hashCode +
        expiresAt.hashCode +
        status.hashCode +
        (decidedBy == null ? 0 : decidedBy.hashCode) +
        (decidedAt == null ? 0 : decidedAt.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory VisitorApprovalRequest.fromJson(Map<String, dynamic> json) => _$VisitorApprovalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorApprovalRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum VisitorApprovalRequestStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'approved')
approved(r'approved'),
@JsonValue(r'denied')
denied(r'denied'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const VisitorApprovalRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


