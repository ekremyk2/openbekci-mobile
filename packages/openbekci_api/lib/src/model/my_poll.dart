//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/my_poll_answer.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_poll.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MyPoll {
  /// Returns a new [MyPoll] instance.
  MyPoll({

    required  this.agendaItemId,

    required  this.title,

    required  this.answeredUnits,

     this.answers,
  });

  @JsonKey(
    
    name: r'agenda_item_id',
    required: true,
    includeIfNull: false,
  )


  final String agendaItemId;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'answered_units',
    required: true,
    includeIfNull: false,
  )


  final List<String> answeredUnits;



      /// What the caller answered, per unit (their own answers only, never another owner's).
  @JsonKey(
    
    name: r'answers',
    required: false,
    includeIfNull: false,
  )


  final List<MyPollAnswer>? answers;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MyPoll &&
      other.agendaItemId == agendaItemId &&
      other.title == title &&
      other.answeredUnits == answeredUnits &&
      other.answers == answers;

    @override
    int get hashCode =>
        agendaItemId.hashCode +
        title.hashCode +
        answeredUnits.hashCode +
        answers.hashCode;

  factory MyPoll.fromJson(Map<String, dynamic> json) => _$MyPollFromJson(json);

  Map<String, dynamic> toJson() => _$MyPollToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

