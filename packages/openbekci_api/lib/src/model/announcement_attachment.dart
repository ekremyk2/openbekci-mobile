//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_attachment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnouncementAttachment {
  /// Returns a new [AnnouncementAttachment] instance.
  AnnouncementAttachment({

    required  this.id,

    required  this.name,

    required  this.mime,

    required  this.size,
  });

      /// The file id; download it with `files.download`.
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'mime',
    required: true,
    includeIfNull: false,
  )


  final String mime;



      /// Bytes.
  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnnouncementAttachment &&
      other.id == id &&
      other.name == name &&
      other.mime == mime &&
      other.size == size;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        mime.hashCode +
        size.hashCode;

  factory AnnouncementAttachment.fromJson(Map<String, dynamic> json) => _$AnnouncementAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementAttachmentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

