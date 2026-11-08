//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/permission.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission_grant.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PermissionGrant {
  /// Returns a new [PermissionGrant] instance.
  PermissionGrant({

    required  this.permission,

     this.siteIds,

     this.blockIds,
  });

  @JsonKey(
    
    name: r'permission',
    required: true,
    includeIfNull: false,
  unknownEnumValue: Permission.unknownDefaultOpenApi,
  )


  final Permission permission;



  @JsonKey(
    
    name: r'site_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? siteIds;



  @JsonKey(
    
    name: r'block_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? blockIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PermissionGrant &&
      other.permission == permission &&
      other.siteIds == siteIds &&
      other.blockIds == blockIds;

    @override
    int get hashCode =>
        permission.hashCode +
        siteIds.hashCode +
        blockIds.hashCode;

  factory PermissionGrant.fromJson(Map<String, dynamic> json) => _$PermissionGrantFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionGrantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

