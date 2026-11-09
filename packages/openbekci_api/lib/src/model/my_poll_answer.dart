//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_poll_answer.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MyPollAnswer {
  /// Returns a new [MyPollAnswer] instance.
  MyPollAnswer({

    required  this.unitId,

    required  this.answer,

    required  this.answeredAt,
  });

  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



      /// Open enum.
  @JsonKey(
    
    name: r'answer',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MyPollAnswerAnswerEnum.unknownDefaultOpenApi,
  )


  final MyPollAnswerAnswerEnum answer;



  @JsonKey(
    
    name: r'answered_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime answeredAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MyPollAnswer &&
      other.unitId == unitId &&
      other.answer == answer &&
      other.answeredAt == answeredAt;

    @override
    int get hashCode =>
        unitId.hashCode +
        answer.hashCode +
        answeredAt.hashCode;

  factory MyPollAnswer.fromJson(Map<String, dynamic> json) => _$MyPollAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$MyPollAnswerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum MyPollAnswerAnswerEnum {
@JsonValue(r'yes')
yes(r'yes'),
@JsonValue(r'no')
no(r'no'),
@JsonValue(r'abstain')
abstain(r'abstain'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MyPollAnswerAnswerEnum(this.value);

final String value;

@override
String toString() => value;
}


