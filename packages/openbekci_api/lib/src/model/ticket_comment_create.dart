//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_comment_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketCommentCreate {
  /// Returns a new [TicketCommentCreate] instance.
  TicketCommentCreate({

    required  this.body,

     this.visibility,

     this.attachmentFileIds,
  });

  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;



      /// Open enum.
  @JsonKey(
    
    name: r'visibility',
    required: false,
    includeIfNull: false,
  unknownEnumValue: TicketCommentCreateVisibilityEnum.unknownDefaultOpenApi,
  )


  final TicketCommentCreateVisibilityEnum? visibility;



  @JsonKey(
    
    name: r'attachment_file_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? attachmentFileIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketCommentCreate &&
      other.body == body &&
      other.visibility == visibility &&
      other.attachmentFileIds == attachmentFileIds;

    @override
    int get hashCode =>
        body.hashCode +
        visibility.hashCode +
        attachmentFileIds.hashCode;

  factory TicketCommentCreate.fromJson(Map<String, dynamic> json) => _$TicketCommentCreateFromJson(json);

  Map<String, dynamic> toJson() => _$TicketCommentCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum TicketCommentCreateVisibilityEnum {
@JsonValue(r'public')
public(r'public'),
@JsonValue(r'internal')
internal(r'internal'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketCommentCreateVisibilityEnum(this.value);

final String value;

@override
String toString() => value;
}


