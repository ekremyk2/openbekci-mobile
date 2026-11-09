//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit_claim.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UnitClaim {
  /// Returns a new [UnitClaim] instance.
  UnitClaim({

    required  this.id,

    required  this.orgId,

    required  this.userId,

    required  this.displayName,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.claimedRole,

    required  this.status,

    required  this.decidedBy,

    required  this.decidedAt,

    required  this.decisionNote,

    required  this.note,

    required  this.createdAt,

    required  this.updatedAt,

     this.orgName,

     this.siteId,

     this.siteName,

     this.blockName,
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
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;



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



      /// Open enum.
  @JsonKey(
    
    name: r'claimed_role',
    required: true,
    includeIfNull: false,
  unknownEnumValue: UnitClaimClaimedRoleEnum.unknownDefaultOpenApi,
  )


  final UnitClaimClaimedRoleEnum claimedRole;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: UnitClaimStatusEnum.unknownDefaultOpenApi,
  )


  final UnitClaimStatusEnum status;



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
    
    name: r'decision_note',
    required: true,
    includeIfNull: true,
  )


  final String? decisionNote;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



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



      /// Organization label; filled by `people.listMyUnitClaims`.
  @JsonKey(
    
    name: r'org_name',
    required: false,
    includeIfNull: false,
  )


  final String? orgName;



      /// Filled by `people.listMyUnitClaims`.
  @JsonKey(
    
    name: r'site_id',
    required: false,
    includeIfNull: false,
  )


  final String? siteId;



      /// Filled by `people.listMyUnitClaims`.
  @JsonKey(
    
    name: r'site_name',
    required: false,
    includeIfNull: false,
  )


  final String? siteName;



      /// Filled by `people.listMyUnitClaims`.
  @JsonKey(
    
    name: r'block_name',
    required: false,
    includeIfNull: false,
  )


  final String? blockName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UnitClaim &&
      other.id == id &&
      other.orgId == orgId &&
      other.userId == userId &&
      other.displayName == displayName &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.claimedRole == claimedRole &&
      other.status == status &&
      other.decidedBy == decidedBy &&
      other.decidedAt == decidedAt &&
      other.decisionNote == decisionNote &&
      other.note == note &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.orgName == orgName &&
      other.siteId == siteId &&
      other.siteName == siteName &&
      other.blockName == blockName;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        userId.hashCode +
        displayName.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        claimedRole.hashCode +
        status.hashCode +
        (decidedBy == null ? 0 : decidedBy.hashCode) +
        (decidedAt == null ? 0 : decidedAt.hashCode) +
        (decisionNote == null ? 0 : decisionNote.hashCode) +
        (note == null ? 0 : note.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        orgName.hashCode +
        siteId.hashCode +
        siteName.hashCode +
        blockName.hashCode;

  factory UnitClaim.fromJson(Map<String, dynamic> json) => _$UnitClaimFromJson(json);

  Map<String, dynamic> toJson() => _$UnitClaimToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum UnitClaimClaimedRoleEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const UnitClaimClaimedRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum UnitClaimStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'approved')
approved(r'approved'),
@JsonValue(r'rejected')
rejected(r'rejected'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const UnitClaimStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


