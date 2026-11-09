//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_attachment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketAttachment {
  /// Returns a new [TicketAttachment] instance.
  TicketAttachment({

    required  this.id,

    required  this.orgId,

    required  this.ticketId,

    required  this.commentId,

    required  this.fileId,

    required  this.mime,

    required  this.size,

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
    
    name: r'ticket_id',
    required: true,
    includeIfNull: false,
  )


  final String ticketId;



  @JsonKey(
    
    name: r'comment_id',
    required: true,
    includeIfNull: true,
  )


  final String? commentId;



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
    bool operator ==(Object other) => identical(this, other) || other is TicketAttachment &&
      other.id == id &&
      other.orgId == orgId &&
      other.ticketId == ticketId &&
      other.commentId == commentId &&
      other.fileId == fileId &&
      other.mime == mime &&
      other.size == size &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        ticketId.hashCode +
        (commentId == null ? 0 : commentId.hashCode) +
        fileId.hashCode +
        mime.hashCode +
        size.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory TicketAttachment.fromJson(Map<String, dynamic> json) => _$TicketAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$TicketAttachmentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

