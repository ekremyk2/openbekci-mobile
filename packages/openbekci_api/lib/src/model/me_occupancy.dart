//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me_occupancy.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeOccupancy {
  /// Returns a new [MeOccupancy] instance.
  MeOccupancy({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.unitId,

    required  this.unitLabel,

    required  this.kind,

    required  this.side,

    required  this.maySeeMoney,

    required  this.validFrom,

    required  this.validTo,
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



      /// What people say, for example `A Blok D:12`.
  @JsonKey(
    
    name: r'unit_label',
    required: true,
    includeIfNull: false,
  )


  final String unitLabel;



      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeOccupancyKindEnum.unknownDefaultOpenApi,
  )


  final MeOccupancyKindEnum kind;



      /// The debtor side the occupant belongs to (`owner` or `tenant`); null for household members. Open enum.
  @JsonKey(
    
    name: r'side',
    required: true,
    includeIfNull: true,
  unknownEnumValue: MeOccupancySideEnum.unknownDefaultOpenApi,
  )


  final MeOccupancySideEnum? side;



      /// Always true for owners and tenants; for household members whether the owner or tenant granted money visibility (S3).
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



      /// Exclusive end date, the first day the person no longer holds the occupancy (the move-out day); null while the occupancy is current. A former occupant's money window ends the day before.
  @JsonKey(
    
    name: r'valid_to',
    required: true,
    includeIfNull: true,
  )


  final DateTime? validTo;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MeOccupancy &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.unitLabel == unitLabel &&
      other.kind == kind &&
      other.side == side &&
      other.maySeeMoney == maySeeMoney &&
      other.validFrom == validFrom &&
      other.validTo == validTo;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        unitId.hashCode +
        unitLabel.hashCode +
        kind.hashCode +
        (side == null ? 0 : side.hashCode) +
        maySeeMoney.hashCode +
        validFrom.hashCode +
        (validTo == null ? 0 : validTo.hashCode);

  factory MeOccupancy.fromJson(Map<String, dynamic> json) => _$MeOccupancyFromJson(json);

  Map<String, dynamic> toJson() => _$MeOccupancyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum MeOccupancyKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'former_occupant')
formerOccupant(r'former_occupant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeOccupancyKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// The debtor side the occupant belongs to (`owner` or `tenant`); null for household members. Open enum.
enum MeOccupancySideEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeOccupancySideEnum(this.value);

final String value;

@override
String toString() => value;
}


