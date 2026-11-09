//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/me_site.dart';
import 'package:openbekci_api/src/model/permission_grant.dart';
import 'package:openbekci_api/src/model/role_grant.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org_access.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrgAccess {
  /// Returns a new [OrgAccess] instance.
  OrgAccess({

    required  this.defaultLocale,

    required  this.id,

    required  this.slug,

    required  this.name,

    required  this.roles,

    required  this.permissions,

     this.occupantPermissions,

    required  this.sites,

    required  this.personId,
  });

  @JsonKey(
    
    name: r'default_locale',
    required: true,
    includeIfNull: false,
  )


  final String defaultLocale;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'slug',
    required: true,
    includeIfNull: false,
  )


  final String slug;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'roles',
    required: true,
    includeIfNull: false,
  )


  final List<RoleGrant> roles;



      /// Effective permissions in this organization from the caller's active role memberships and the role to permission matrix. Empty for a resident who holds no role; see `occupant_permissions`.
  @JsonKey(
    
    name: r'permissions',
    required: true,
    includeIfNull: false,
  )


  final List<PermissionGrant> permissions;



      /// Permissions the caller holds in this organization through a current unit occupancy (owner, tenant or household member, S3), as a portal user, each limited to the sites (`site_ids`) of the units they occupy. They are not role permissions and are never listed in `permissions`; a client gates resident screens (statements, declaring a payment, creating tickets) with this list and the staff screens with `permissions`. Narrowing to the caller's own unit and side still happens on the server (`occupancies[].side`, `may_see_money`). Former occupants appear in `occupancies` only; they hold the S7 read right, not these. 
  @JsonKey(
    
    name: r'occupant_permissions',
    required: false,
    includeIfNull: false,
  )


  final List<PermissionGrant>? occupantPermissions;



      /// Sites of the organization the caller can see through a membership or an occupancy.
  @JsonKey(
    
    name: r'sites',
    required: true,
    includeIfNull: false,
  )


  final List<MeSite> sites;



      /// The caller's person in this organization, null when no person is linked. Lets a client tell \"assigned to me\" without scanning queues.
  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: true,
  )


  final String? personId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrgAccess &&
      other.defaultLocale == defaultLocale &&
      other.id == id &&
      other.slug == slug &&
      other.name == name &&
      other.roles == roles &&
      other.permissions == permissions &&
      other.occupantPermissions == occupantPermissions &&
      other.sites == sites &&
      other.personId == personId;

    @override
    int get hashCode =>
        defaultLocale.hashCode +
        id.hashCode +
        slug.hashCode +
        name.hashCode +
        roles.hashCode +
        permissions.hashCode +
        occupantPermissions.hashCode +
        sites.hashCode +
        (personId == null ? 0 : personId.hashCode);

  factory OrgAccess.fromJson(Map<String, dynamic> json) => _$OrgAccessFromJson(json);

  Map<String, dynamic> toJson() => _$OrgAccessToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

