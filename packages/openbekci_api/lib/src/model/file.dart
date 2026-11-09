//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/file_variant.dart';
import 'package:openbekci_api/src/model/file_links.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class File {
  /// Returns a new [File] instance.
  File({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.name,

    required  this.size,

    required  this.mime,

    required  this.sha256,

    required  this.status,

    required  this.source_,

    required  this.uploadedBy,

    required  this.scope,

    required  this.hasVariants,

    required  this.retentionUntil,

    required  this.variants,

    required  this.links,

    required  this.createdAt,

    required  this.updatedAt,
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
    includeIfNull: true,
  )


  final String? siteId;



      /// The file name. A re-encoded image gets the extension of its stored type.
  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// Bytes of the stored original (for images, after metadata stripping and downscaling).
  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;



      /// The stored type, from sniffing the content.
  @JsonKey(
    
    name: r'mime',
    required: true,
    includeIfNull: false,
  )


  final String mime;



      /// Hex SHA-256 of the stored original.
  @JsonKey(
    
    name: r'sha256',
    required: true,
    includeIfNull: false,
  )


  final String sha256;



      /// Open enum: `ready`, `quarantined` (the virus scan flagged it: it has no downloadable content and only administrators see it). `pending` and `deleted` files are never returned. 
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: FileStatusEnum.unknownDefaultOpenApi,
  )


  final FileStatusEnum status;



      /// Open enum: `uploaded`, `generated` (statements, receipts and minutes the server produced).
  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  unknownEnumValue: FileSource_Enum.unknownDefaultOpenApi,
  )


  final FileSource_Enum source_;



      /// The user id of the uploader. Shown to the uploader and to `files.manage` only; null for everyone else and for generated files.
  @JsonKey(
    
    name: r'uploaded_by',
    required: true,
    includeIfNull: true,
  )


  final String? uploadedBy;



      /// The resource the file is attached to, `<type>:<id>` (for example `ticket:2f9c...`); null for a draft.
  @JsonKey(
    
    name: r'scope',
    required: true,
    includeIfNull: true,
  )


  final String? scope;



      /// Images: `thumb` and `medium` exist.
  @JsonKey(
    
    name: r'has_variants',
    required: true,
    includeIfNull: false,
  )


  final bool hasVariants;



      /// When the file expires. Drafts (not attached to a resource) expire after 7 days; attaching clears it.
  @JsonKey(
    
    name: r'retention_until',
    required: true,
    includeIfNull: true,
  )


  final DateTime? retentionUntil;



      /// Image variants by name (`thumb`, 256 px, and `medium`, 1600 px, on the longer side).
  @JsonKey(
    
    name: r'variants',
    required: true,
    includeIfNull: false,
  )


  final Map<String, FileVariant> variants;



  @JsonKey(
    
    name: r'links',
    required: true,
    includeIfNull: false,
  )


  final FileLinks links;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is File &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.name == name &&
      other.size == size &&
      other.mime == mime &&
      other.sha256 == sha256 &&
      other.status == status &&
      other.source_ == source_ &&
      other.uploadedBy == uploadedBy &&
      other.scope == scope &&
      other.hasVariants == hasVariants &&
      other.retentionUntil == retentionUntil &&
      other.variants == variants &&
      other.links == links &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        (siteId == null ? 0 : siteId.hashCode) +
        name.hashCode +
        size.hashCode +
        mime.hashCode +
        sha256.hashCode +
        status.hashCode +
        source_.hashCode +
        (uploadedBy == null ? 0 : uploadedBy.hashCode) +
        (scope == null ? 0 : scope.hashCode) +
        hasVariants.hashCode +
        (retentionUntil == null ? 0 : retentionUntil.hashCode) +
        variants.hashCode +
        links.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum: `ready`, `quarantined` (the virus scan flagged it: it has no downloadable content and only administrators see it). `pending` and `deleted` files are never returned. 
enum FileStatusEnum {
@JsonValue(r'ready')
ready(r'ready'),
@JsonValue(r'quarantined')
quarantined(r'quarantined'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const FileStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum: `uploaded`, `generated` (statements, receipts and minutes the server produced).
enum FileSource_Enum {
@JsonValue(r'uploaded')
uploaded(r'uploaded'),
@JsonValue(r'generated')
generated(r'generated'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const FileSource_Enum(this.value);

final String value;

@override
String toString() => value;
}


