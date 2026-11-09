//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'agenda_item.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AgendaItem {
  /// Returns a new [AgendaItem] instance.
  AgendaItem({

    required  this.id,

    required  this.orgId,

    required  this.meetingId,

    required  this.position,

    required  this.title,

    required  this.description,

    required  this.willBeVoted,

    required  this.topic,

    required  this.decisionId,

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
    
    name: r'meeting_id',
    required: true,
    includeIfNull: false,
  )


  final String meetingId;



  @JsonKey(
    
    name: r'position',
    required: true,
    includeIfNull: false,
  )


  final int position;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: true,
  )


  final String? description;



  @JsonKey(
    
    name: r'will_be_voted',
    required: true,
    includeIfNull: false,
  )


  final bool willBeVoted;



      /// Key into the threshold table.
  @JsonKey(
    
    name: r'topic',
    required: true,
    includeIfNull: true,
  )


  final String? topic;



  @JsonKey(
    
    name: r'decision_id',
    required: true,
    includeIfNull: true,
  )


  final String? decisionId;



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
    bool operator ==(Object other) => identical(this, other) || other is AgendaItem &&
      other.id == id &&
      other.orgId == orgId &&
      other.meetingId == meetingId &&
      other.position == position &&
      other.title == title &&
      other.description == description &&
      other.willBeVoted == willBeVoted &&
      other.topic == topic &&
      other.decisionId == decisionId &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        meetingId.hashCode +
        position.hashCode +
        title.hashCode +
        (description == null ? 0 : description.hashCode) +
        willBeVoted.hashCode +
        (topic == null ? 0 : topic.hashCode) +
        (decisionId == null ? 0 : decisionId.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory AgendaItem.fromJson(Map<String, dynamic> json) => _$AgendaItemFromJson(json);

  Map<String, dynamic> toJson() => _$AgendaItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

