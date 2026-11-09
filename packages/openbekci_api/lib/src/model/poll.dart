//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poll.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Poll {
  /// Returns a new [Poll] instance.
  Poll({

    required  this.agendaItemId,

    required  this.question,

    required  this.opensAt,

    required  this.closesAt,

    required  this.status,

    required  this.version,
  });

  @JsonKey(
    
    name: r'agenda_item_id',
    required: true,
    includeIfNull: false,
  )


  final String agendaItemId;



  @JsonKey(
    
    name: r'question',
    required: true,
    includeIfNull: true,
  )


  final String? question;



  @JsonKey(
    
    name: r'opens_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime opensAt;



  @JsonKey(
    
    name: r'closes_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime closesAt;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: PollStatusEnum.unknownDefaultOpenApi,
  )


  final PollStatusEnum status;



      /// Optimistic-lock counter; send it back as If-Match on the next write.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Poll &&
      other.agendaItemId == agendaItemId &&
      other.question == question &&
      other.opensAt == opensAt &&
      other.closesAt == closesAt &&
      other.status == status &&
      other.version == version;

    @override
    int get hashCode =>
        agendaItemId.hashCode +
        (question == null ? 0 : question.hashCode) +
        opensAt.hashCode +
        closesAt.hashCode +
        status.hashCode +
        version.hashCode;

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  Map<String, dynamic> toJson() => _$PollToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum PollStatusEnum {
@JsonValue(r'draft')
draft(r'draft'),
@JsonValue(r'open')
open(r'open'),
@JsonValue(r'closed')
closed(r'closed'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PollStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


