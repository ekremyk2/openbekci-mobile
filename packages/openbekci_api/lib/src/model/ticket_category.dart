//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_category.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketCategory {
  /// Returns a new [TicketCategory] instance.
  TicketCategory({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.name,

    required  this.defaultVisibility,

    required  this.defaultAssigneeRole,

    required  this.position,

    required  this.archived,

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



      /// Open enum.
  @JsonKey(
    
    name: r'default_visibility',
    required: true,
    includeIfNull: false,
  unknownEnumValue: TicketCategoryDefaultVisibilityEnum.unknownDefaultOpenApi,
  )


  final TicketCategoryDefaultVisibilityEnum defaultVisibility;



      /// Open enum.
  @JsonKey(
    
    name: r'default_assignee_role',
    required: true,
    includeIfNull: true,
  unknownEnumValue: TicketCategoryDefaultAssigneeRoleEnum.unknownDefaultOpenApi,
  )


  final TicketCategoryDefaultAssigneeRoleEnum? defaultAssigneeRole;



  @JsonKey(
    
    name: r'position',
    required: true,
    includeIfNull: false,
  )


  final int position;



  @JsonKey(
    
    name: r'archived',
    required: true,
    includeIfNull: false,
  )


  final bool archived;



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
    bool operator ==(Object other) => identical(this, other) || other is TicketCategory &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.name == name &&
      other.defaultVisibility == defaultVisibility &&
      other.defaultAssigneeRole == defaultAssigneeRole &&
      other.position == position &&
      other.archived == archived &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        name.hashCode +
        defaultVisibility.hashCode +
        (defaultAssigneeRole == null ? 0 : defaultAssigneeRole.hashCode) +
        position.hashCode +
        archived.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory TicketCategory.fromJson(Map<String, dynamic> json) => _$TicketCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$TicketCategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum TicketCategoryDefaultVisibilityEnum {
@JsonValue(r'private')
private(r'private'),
@JsonValue(r'common')
common(r'common'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketCategoryDefaultVisibilityEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum TicketCategoryDefaultAssigneeRoleEnum {
@JsonValue(r'site_manager')
siteManager(r'site_manager'),
@JsonValue(r'staff')
staff(r'staff'),
@JsonValue(r'board_member')
boardMember(r'board_member'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketCategoryDefaultAssigneeRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


