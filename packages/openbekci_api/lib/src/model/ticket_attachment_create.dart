//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_attachment_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketAttachmentCreate {
  /// Returns a new [TicketAttachmentCreate] instance.
  TicketAttachmentCreate({

    required  this.fileId,

     this.commentId,
  });

  @JsonKey(
    
    name: r'file_id',
    required: true,
    includeIfNull: false,
  )


  final String fileId;



  @JsonKey(
    
    name: r'comment_id',
    required: false,
    includeIfNull: false,
  )


  final String? commentId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketAttachmentCreate &&
      other.fileId == fileId &&
      other.commentId == commentId;

    @override
    int get hashCode =>
        fileId.hashCode +
        commentId.hashCode;

  factory TicketAttachmentCreate.fromJson(Map<String, dynamic> json) => _$TicketAttachmentCreateFromJson(json);

  Map<String, dynamic> toJson() => _$TicketAttachmentCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

