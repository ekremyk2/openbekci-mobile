//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/ticket_attachment.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_comment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketComment {
  /// Returns a new [TicketComment] instance.
  TicketComment({

    required  this.id,

    required  this.orgId,

    required  this.ticketId,

    required  this.authorPersonId,

    required  this.authorDisplayName,

    required  this.body,

    required  this.visibility,

    required  this.attachments,

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
    
    name: r'author_person_id',
    required: true,
    includeIfNull: false,
  )


  final String authorPersonId;



  @JsonKey(
    
    name: r'author_display_name',
    required: true,
    includeIfNull: false,
  )


  final String authorDisplayName;



  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;



      /// Open enum.
  @JsonKey(
    
    name: r'visibility',
    required: true,
    includeIfNull: false,
  unknownEnumValue: TicketCommentVisibilityEnum.unknownDefaultOpenApi,
  )


  final TicketCommentVisibilityEnum visibility;



  @JsonKey(
    
    name: r'attachments',
    required: true,
    includeIfNull: false,
  )


  final List<TicketAttachment> attachments;



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
    bool operator ==(Object other) => identical(this, other) || other is TicketComment &&
      other.id == id &&
      other.orgId == orgId &&
      other.ticketId == ticketId &&
      other.authorPersonId == authorPersonId &&
      other.authorDisplayName == authorDisplayName &&
      other.body == body &&
      other.visibility == visibility &&
      other.attachments == attachments &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        ticketId.hashCode +
        authorPersonId.hashCode +
        authorDisplayName.hashCode +
        body.hashCode +
        visibility.hashCode +
        attachments.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory TicketComment.fromJson(Map<String, dynamic> json) => _$TicketCommentFromJson(json);

  Map<String, dynamic> toJson() => _$TicketCommentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum TicketCommentVisibilityEnum {
@JsonValue(r'public')
public(r'public'),
@JsonValue(r'internal')
internal(r'internal'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketCommentVisibilityEnum(this.value);

final String value;

@override
String toString() => value;
}


