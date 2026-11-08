//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_grant.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RoleGrant {
  /// Returns a new [RoleGrant] instance.
  RoleGrant({

    required  this.role,

    required  this.scopeType,

    required  this.scopeId,

    required  this.siteOwned,
  });

      /// Open enum: org_admin, site_manager, board_member, auditor, accountant, staff, guard.
  @JsonKey(
    
    name: r'role',
    required: true,
    includeIfNull: false,
  unknownEnumValue: RoleGrantRoleEnum.unknownDefaultOpenApi,
  )


  final RoleGrantRoleEnum role;



      /// Open enum.
  @JsonKey(
    
    name: r'scope_type',
    required: true,
    includeIfNull: false,
  unknownEnumValue: RoleGrantScopeTypeEnum.unknownDefaultOpenApi,
  )


  final RoleGrantScopeTypeEnum scopeType;



      /// The site or block id; null for `org` scope.
  @JsonKey(
    
    name: r'scope_id',
    required: true,
    includeIfNull: true,
  )


  final String? scopeId;



  @JsonKey(
    
    name: r'site_owned',
    required: true,
    includeIfNull: false,
  )


  final bool siteOwned;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RoleGrant &&
      other.role == role &&
      other.scopeType == scopeType &&
      other.scopeId == scopeId &&
      other.siteOwned == siteOwned;

    @override
    int get hashCode =>
        role.hashCode +
        scopeType.hashCode +
        (scopeId == null ? 0 : scopeId.hashCode) +
        siteOwned.hashCode;

  factory RoleGrant.fromJson(Map<String, dynamic> json) => _$RoleGrantFromJson(json);

  Map<String, dynamic> toJson() => _$RoleGrantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum: org_admin, site_manager, board_member, auditor, accountant, staff, guard.
enum RoleGrantRoleEnum {
@JsonValue(r'org_admin')
orgAdmin(r'org_admin'),
@JsonValue(r'site_manager')
siteManager(r'site_manager'),
@JsonValue(r'board_member')
boardMember(r'board_member'),
@JsonValue(r'auditor')
auditor(r'auditor'),
@JsonValue(r'accountant')
accountant(r'accountant'),
@JsonValue(r'staff')
staff(r'staff'),
@JsonValue(r'guard')
guard(r'guard'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const RoleGrantRoleEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum RoleGrantScopeTypeEnum {
@JsonValue(r'org')
org(r'org'),
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'block')
block(r'block'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const RoleGrantScopeTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


