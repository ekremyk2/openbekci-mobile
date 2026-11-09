//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/facility_rules.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Facility {
  /// Returns a new [Facility] instance.
  Facility({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.name,

    required  this.description,

    required  this.rules,

    required  this.enabled,

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
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: true,
  )


  final String? description;



  @JsonKey(
    
    name: r'rules',
    required: true,
    includeIfNull: false,
  )


  final FacilityRules rules;



  @JsonKey(
    
    name: r'enabled',
    required: true,
    includeIfNull: false,
  )


  final bool enabled;



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
    bool operator ==(Object other) => identical(this, other) || other is Facility &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.name == name &&
      other.description == description &&
      other.rules == rules &&
      other.enabled == enabled &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        name.hashCode +
        (description == null ? 0 : description.hashCode) +
        rules.hashCode +
        enabled.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

