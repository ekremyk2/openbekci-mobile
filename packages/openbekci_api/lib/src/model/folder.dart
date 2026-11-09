//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/document_visibility.dart';
import 'package:openbekci_api/src/model/folder_crumb.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'folder.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Folder {
  /// Returns a new [Folder] instance.
  Folder({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.parentId,

    required  this.name,

    required  this.kind,

    required  this.unitId,

    required  this.visibility,

    required  this.breadcrumb,

    required  this.isSystem,

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
    
    name: r'parent_id',
    required: true,
    includeIfNull: true,
  )


  final String? parentId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// Unit folders are private and created with the unit. Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: FolderKindEnum.unknownDefaultOpenApi,
  )


  final FolderKindEnum kind;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: true,
  )


  final String? unitId;



  @JsonKey(
    
    name: r'visibility',
    required: true,
    includeIfNull: false,
  )


  final DocumentVisibility visibility;



  @JsonKey(
    
    name: r'breadcrumb',
    required: true,
    includeIfNull: false,
  )


  final List<FolderCrumb> breadcrumb;



  @JsonKey(
    
    name: r'is_system',
    required: true,
    includeIfNull: false,
  )


  final bool isSystem;



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
    bool operator ==(Object other) => identical(this, other) || other is Folder &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.parentId == parentId &&
      other.name == name &&
      other.kind == kind &&
      other.unitId == unitId &&
      other.visibility == visibility &&
      other.breadcrumb == breadcrumb &&
      other.isSystem == isSystem &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        (parentId == null ? 0 : parentId.hashCode) +
        name.hashCode +
        kind.hashCode +
        (unitId == null ? 0 : unitId.hashCode) +
        visibility.hashCode +
        breadcrumb.hashCode +
        isSystem.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Unit folders are private and created with the unit. Open enum.
enum FolderKindEnum {
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'unit')
unit(r'unit'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const FolderKindEnum(this.value);

final String value;

@override
String toString() => value;
}


