//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit_claim_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UnitClaimCreate {
  /// Returns a new [UnitClaimCreate] instance.
  UnitClaimCreate({

    required  this.unitId,

    required  this.claimedRole,

     this.note,
  });

  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'claimed_role',
    required: true,
    includeIfNull: false,
  unknownEnumValue: UnitClaimCreateClaimedRoleEnum.unknownDefaultOpenApi,
  )


  final UnitClaimCreateClaimedRoleEnum claimedRole;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UnitClaimCreate &&
      other.unitId == unitId &&
      other.claimedRole == claimedRole &&
      other.note == note;

    @override
    int get hashCode =>
        unitId.hashCode +
        claimedRole.hashCode +
        note.hashCode;

  factory UnitClaimCreate.fromJson(Map<String, dynamic> json) => _$UnitClaimCreateFromJson(json);

  Map<String, dynamic> toJson() => _$UnitClaimCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum UnitClaimCreateClaimedRoleEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const UnitClaimCreateClaimedRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


