//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/document_visibility.dart';
import 'package:openbekci_api/src/model/generated_from.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Document {
  /// Returns a new [Document] instance.
  Document({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.folderId,

    required  this.title,

    required  this.fileId,

    required  this.mime,

    required  this.size,

    required  this.visibility,

    required  this.source_,

    required  this.generatedFrom,

    required  this.uploadedBy,

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
    
    name: r'folder_id',
    required: true,
    includeIfNull: false,
  )


  final String folderId;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'file_id',
    required: true,
    includeIfNull: false,
  )


  final String fileId;



  @JsonKey(
    
    name: r'mime',
    required: true,
    includeIfNull: false,
  )


  final String mime;



  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;



      /// Null: inherits the folder.
  @JsonKey(
    
    name: r'visibility',
    required: true,
    includeIfNull: true,
  )


  final DocumentVisibility? visibility;



      /// Open enum.
  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  unknownEnumValue: DocumentSource_Enum.unknownDefaultOpenApi,
  )


  final DocumentSource_Enum source_;



  @JsonKey(
    
    name: r'generated_from',
    required: true,
    includeIfNull: true,
  )


  final GeneratedFrom? generatedFrom;



  @JsonKey(
    
    name: r'uploaded_by',
    required: true,
    includeIfNull: true,
  )


  final String? uploadedBy;



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
    bool operator ==(Object other) => identical(this, other) || other is Document &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.folderId == folderId &&
      other.title == title &&
      other.fileId == fileId &&
      other.mime == mime &&
      other.size == size &&
      other.visibility == visibility &&
      other.source_ == source_ &&
      other.generatedFrom == generatedFrom &&
      other.uploadedBy == uploadedBy &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        folderId.hashCode +
        title.hashCode +
        fileId.hashCode +
        mime.hashCode +
        size.hashCode +
        (visibility == null ? 0 : visibility.hashCode) +
        source_.hashCode +
        (generatedFrom == null ? 0 : generatedFrom.hashCode) +
        (uploadedBy == null ? 0 : uploadedBy.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum DocumentSource_Enum {
@JsonValue(r'uploaded')
uploaded(r'uploaded'),
@JsonValue(r'generated')
generated(r'generated'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DocumentSource_Enum(this.value);

final String value;

@override
String toString() => value;
}


