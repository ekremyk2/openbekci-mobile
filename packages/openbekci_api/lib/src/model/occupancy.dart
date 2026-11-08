//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'occupancy.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Occupancy {
  /// Returns a new [Occupancy] instance.
  Occupancy({

    required  this.id,

    required  this.orgId,

    required  this.personId,

    required  this.personDisplayName,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.kind,

    required  this.side,

    required  this.sharePct,

    required  this.isCorrespondent,

    required  this.maySeeMoney,

    required  this.validFrom,

    required  this.validTo,

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
    
    name: r'person_id',
    required: true,
    includeIfNull: false,
  )


  final String personId;



  @JsonKey(
    
    name: r'person_display_name',
    required: true,
    includeIfNull: false,
  )


  final String personDisplayName;



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
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: OccupancyKindEnum.unknownDefaultOpenApi,
  )


  final OccupancyKindEnum kind;



      /// Debtor side: owner for owners, tenant for tenants; for a household member the side whose money they may see. Open enum.
  @JsonKey(
    
    name: r'side',
    required: true,
    includeIfNull: false,
  unknownEnumValue: OccupancySideEnum.unknownDefaultOpenApi,
  )


  final OccupancySideEnum side;



      /// Co-owner share.
  @JsonKey(
    
    name: r'share_pct',
    required: true,
    includeIfNull: true,
  )


  final num? sharePct;



      /// One per unit side.
  @JsonKey(
    
    name: r'is_correspondent',
    required: true,
    includeIfNull: false,
  )


  final bool isCorrespondent;



      /// Household only; default false.
  @JsonKey(
    
    name: r'may_see_money',
    required: true,
    includeIfNull: false,
  )


  final bool maySeeMoney;



  @JsonKey(
    
    name: r'valid_from',
    required: true,
    includeIfNull: false,
  )


  final DateTime validFrom;



  @JsonKey(
    
    name: r'valid_to',
    required: true,
    includeIfNull: true,
  )


  final DateTime? validTo;



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
    bool operator ==(Object other) => identical(this, other) || other is Occupancy &&
      other.id == id &&
      other.orgId == orgId &&
      other.personId == personId &&
      other.personDisplayName == personDisplayName &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.kind == kind &&
      other.side == side &&
      other.sharePct == sharePct &&
      other.isCorrespondent == isCorrespondent &&
      other.maySeeMoney == maySeeMoney &&
      other.validFrom == validFrom &&
      other.validTo == validTo &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        personId.hashCode +
        personDisplayName.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        kind.hashCode +
        side.hashCode +
        (sharePct == null ? 0 : sharePct.hashCode) +
        isCorrespondent.hashCode +
        maySeeMoney.hashCode +
        validFrom.hashCode +
        (validTo == null ? 0 : validTo.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Occupancy.fromJson(Map<String, dynamic> json) => _$OccupancyFromJson(json);

  Map<String, dynamic> toJson() => _$OccupancyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum OccupancyKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const OccupancyKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Debtor side: owner for owners, tenant for tenants; for a household member the side whose money they may see. Open enum.
enum OccupancySideEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const OccupancySideEnum(this.value);

final String value;

@override
String toString() => value;
}


