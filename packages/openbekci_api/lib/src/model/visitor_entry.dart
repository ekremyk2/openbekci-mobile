//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_entry.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VisitorEntry {
  /// Returns a new [VisitorEntry] instance.
  VisitorEntry({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.name,

    required  this.plate,

    required  this.windowFrom,

    required  this.windowTo,

    required  this.approvalStatus,

    required  this.source_,

    required  this.qrToken,

    required  this.decidedBy,

    required  this.decidedAt,

    required  this.arrivedAt,

    required  this.leftAt,

    required  this.cancelled,

    required  this.recurringVisitorId,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.version,
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
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'plate',
    required: true,
    includeIfNull: true,
  )


  final String? plate;



  @JsonKey(
    
    name: r'window_from',
    required: true,
    includeIfNull: false,
  )


  final DateTime windowFrom;



  @JsonKey(
    
    name: r'window_to',
    required: true,
    includeIfNull: false,
  )


  final DateTime windowTo;



      /// Open enum.
  @JsonKey(
    
    name: r'approval_status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: VisitorEntryApprovalStatusEnum.unknownDefaultOpenApi,
  )


  final VisitorEntryApprovalStatusEnum approvalStatus;



      /// Open enum.
  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  unknownEnumValue: VisitorEntrySource_Enum.unknownDefaultOpenApi,
  )


  final VisitorEntrySource_Enum source_;



      /// The QR token, always including the `obk1.` prefix (the value is `obk1.<token>`, exactly what the QR encodes and what `community.scanGateVisitor` takes). Returned only to the unit's current occupants (owner, tenant, household), never to managers, board members, auditors or guards (`null` for them); a manager issues a new one to the occupants with the `rotate-qr` operation. It is also served by the `.../qr` operations.
  @JsonKey(
    
    name: r'qr_token',
    required: true,
    includeIfNull: true,
  )


  final String? qrToken;



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
    
    name: r'arrived_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? arrivedAt;



  @JsonKey(
    
    name: r'left_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? leftAt;



  @JsonKey(
    
    name: r'cancelled',
    required: true,
    includeIfNull: false,
  )


  final bool cancelled;



  @JsonKey(
    
    name: r'recurring_visitor_id',
    required: true,
    includeIfNull: true,
  )


  final String? recurringVisitorId;



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



      /// Optimistic-lock counter; send it back as If-Match on updates.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VisitorEntry &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.name == name &&
      other.plate == plate &&
      other.windowFrom == windowFrom &&
      other.windowTo == windowTo &&
      other.approvalStatus == approvalStatus &&
      other.source_ == source_ &&
      other.qrToken == qrToken &&
      other.decidedBy == decidedBy &&
      other.decidedAt == decidedAt &&
      other.arrivedAt == arrivedAt &&
      other.leftAt == leftAt &&
      other.cancelled == cancelled &&
      other.recurringVisitorId == recurringVisitorId &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        name.hashCode +
        (plate == null ? 0 : plate.hashCode) +
        windowFrom.hashCode +
        windowTo.hashCode +
        approvalStatus.hashCode +
        source_.hashCode +
        (qrToken == null ? 0 : qrToken.hashCode) +
        (decidedBy == null ? 0 : decidedBy.hashCode) +
        (decidedAt == null ? 0 : decidedAt.hashCode) +
        (arrivedAt == null ? 0 : arrivedAt.hashCode) +
        (leftAt == null ? 0 : leftAt.hashCode) +
        cancelled.hashCode +
        (recurringVisitorId == null ? 0 : recurringVisitorId.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory VisitorEntry.fromJson(Map<String, dynamic> json) => _$VisitorEntryFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum VisitorEntryApprovalStatusEnum {
@JsonValue(r'pre_approved')
preApproved(r'pre_approved'),
@JsonValue(r'requested')
requested(r'requested'),
@JsonValue(r'approved')
approved(r'approved'),
@JsonValue(r'denied')
denied(r'denied'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const VisitorEntryApprovalStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum VisitorEntrySource_Enum {
@JsonValue(r'pre_registered')
preRegistered(r'pre_registered'),
@JsonValue(r'walk_in')
walkIn(r'walk_in'),
@JsonValue(r'recurring')
recurring(r'recurring'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const VisitorEntrySource_Enum(this.value);

final String value;

@override
String toString() => value;
}


