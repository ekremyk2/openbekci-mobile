//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poll_answer.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PollAnswer {
  /// Returns a new [PollAnswer] instance.
  PollAnswer({

    required  this.agendaItemId,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.answer,

    required  this.answeredBy,

    required  this.answeredAt,
  });

  @JsonKey(
    
    name: r'agenda_item_id',
    required: true,
    includeIfNull: false,
  )


  final String agendaItemId;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'unit_door_number',
    required: true,
    includeIfNull: false,
  )


  final String unitDoorNumber;



      /// Open enum.
  @JsonKey(
    
    name: r'answer',
    required: true,
    includeIfNull: false,
  unknownEnumValue: PollAnswerAnswerEnum.unknownDefaultOpenApi,
  )


  final PollAnswerAnswerEnum answer;



  @JsonKey(
    
    name: r'answered_by',
    required: true,
    includeIfNull: false,
  )


  final String answeredBy;



  @JsonKey(
    
    name: r'answered_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime answeredAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PollAnswer &&
      other.agendaItemId == agendaItemId &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.answer == answer &&
      other.answeredBy == answeredBy &&
      other.answeredAt == answeredAt;

    @override
    int get hashCode =>
        agendaItemId.hashCode +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        answer.hashCode +
        answeredBy.hashCode +
        answeredAt.hashCode;

  factory PollAnswer.fromJson(Map<String, dynamic> json) => _$PollAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$PollAnswerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum PollAnswerAnswerEnum {
@JsonValue(r'yes')
yes(r'yes'),
@JsonValue(r'no')
no(r'no'),
@JsonValue(r'abstain')
abstain(r'abstain'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PollAnswerAnswerEnum(this.value);

final String value;

@override
String toString() => value;
}


