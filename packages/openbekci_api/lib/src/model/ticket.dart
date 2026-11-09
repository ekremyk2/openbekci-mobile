//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/ticket_attachment.dart';
import 'package:openbekci_api/src/model/ticket_semantic.dart';
import 'package:openbekci_api/src/model/ticket_assignee.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Ticket {
  /// Returns a new [Ticket] instance.
  Ticket({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.reporterPersonId,

    required  this.reporterDisplayName,

    required  this.categoryId,

    required  this.title,

    required  this.description,

    required  this.statusId,

    required  this.statusName,

    required  this.statusSemantic,

    required  this.visibility,

    required  this.assignee,

    required  this.voteCount,

    required  this.votedByMe,

    required  this.mergedIntoId,

    required  this.commentCount,

    required  this.attachments,

    required  this.closedAt,

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
    
    name: r'unit_id',
    required: true,
    includeIfNull: true,
  )


  final String? unitId;



  @JsonKey(
    
    name: r'unit_door_number',
    required: true,
    includeIfNull: true,
  )


  final String? unitDoorNumber;



  @JsonKey(
    
    name: r'reporter_person_id',
    required: true,
    includeIfNull: false,
  )


  final String reporterPersonId;



  @JsonKey(
    
    name: r'reporter_display_name',
    required: true,
    includeIfNull: false,
  )


  final String reporterDisplayName;



  @JsonKey(
    
    name: r'category_id',
    required: true,
    includeIfNull: false,
  )


  final String categoryId;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



  @JsonKey(
    
    name: r'status_id',
    required: true,
    includeIfNull: false,
  )


  final String statusId;



  @JsonKey(
    
    name: r'status_name',
    required: true,
    includeIfNull: false,
  )


  final String statusName;



  @JsonKey(
    
    name: r'status_semantic',
    required: true,
    includeIfNull: false,
  unknownEnumValue: TicketSemantic.unknownDefaultOpenApi,
  )


  final TicketSemantic statusSemantic;



      /// Private: that unit and management. Common: the whole site or block. Open enum.
  @JsonKey(
    
    name: r'visibility',
    required: true,
    includeIfNull: false,
  unknownEnumValue: TicketVisibilityEnum.unknownDefaultOpenApi,
  )


  final TicketVisibilityEnum visibility;



  @JsonKey(
    
    name: r'assignee',
    required: true,
    includeIfNull: true,
  )


  final TicketAssignee? assignee;



      /// \"+1\" count; visible to residents.
  @JsonKey(
    
    name: r'vote_count',
    required: true,
    includeIfNull: false,
  )


  final int voteCount;



  @JsonKey(
    
    name: r'voted_by_me',
    required: true,
    includeIfNull: false,
  )


  final bool votedByMe;



  @JsonKey(
    
    name: r'merged_into_id',
    required: true,
    includeIfNull: true,
  )


  final String? mergedIntoId;



  @JsonKey(
    
    name: r'comment_count',
    required: true,
    includeIfNull: false,
  )


  final int commentCount;



  @JsonKey(
    
    name: r'attachments',
    required: true,
    includeIfNull: false,
  )


  final List<TicketAttachment> attachments;



  @JsonKey(
    
    name: r'closed_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? closedAt;



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
    bool operator ==(Object other) => identical(this, other) || other is Ticket &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.reporterPersonId == reporterPersonId &&
      other.reporterDisplayName == reporterDisplayName &&
      other.categoryId == categoryId &&
      other.title == title &&
      other.description == description &&
      other.statusId == statusId &&
      other.statusName == statusName &&
      other.statusSemantic == statusSemantic &&
      other.visibility == visibility &&
      other.assignee == assignee &&
      other.voteCount == voteCount &&
      other.votedByMe == votedByMe &&
      other.mergedIntoId == mergedIntoId &&
      other.commentCount == commentCount &&
      other.attachments == attachments &&
      other.closedAt == closedAt &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        (unitId == null ? 0 : unitId.hashCode) +
        (unitDoorNumber == null ? 0 : unitDoorNumber.hashCode) +
        reporterPersonId.hashCode +
        reporterDisplayName.hashCode +
        categoryId.hashCode +
        title.hashCode +
        description.hashCode +
        statusId.hashCode +
        statusName.hashCode +
        statusSemantic.hashCode +
        visibility.hashCode +
        (assignee == null ? 0 : assignee.hashCode) +
        voteCount.hashCode +
        votedByMe.hashCode +
        (mergedIntoId == null ? 0 : mergedIntoId.hashCode) +
        commentCount.hashCode +
        attachments.hashCode +
        (closedAt == null ? 0 : closedAt.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Private: that unit and management. Common: the whole site or block. Open enum.
enum TicketVisibilityEnum {
@JsonValue(r'private')
private(r'private'),
@JsonValue(r'common')
common(r'common'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketVisibilityEnum(this.value);

final String value;

@override
String toString() => value;
}


