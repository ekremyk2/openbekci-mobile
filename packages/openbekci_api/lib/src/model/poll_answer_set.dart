//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poll_answer_set.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PollAnswerSet {
  /// Returns a new [PollAnswerSet] instance.
  PollAnswerSet({

    required  this.unitId,

    required  this.answer,
  });

  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'answer',
    required: true,
    includeIfNull: false,
  unknownEnumValue: PollAnswerSetAnswerEnum.unknownDefaultOpenApi,
  )


  final PollAnswerSetAnswerEnum answer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PollAnswerSet &&
      other.unitId == unitId &&
      other.answer == answer;

    @override
    int get hashCode =>
        unitId.hashCode +
        answer.hashCode;

  factory PollAnswerSet.fromJson(Map<String, dynamic> json) => _$PollAnswerSetFromJson(json);

  Map<String, dynamic> toJson() => _$PollAnswerSetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum PollAnswerSetAnswerEnum {
@JsonValue(r'yes')
yes(r'yes'),
@JsonValue(r'no')
no(r'no'),
@JsonValue(r'abstain')
abstain(r'abstain'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PollAnswerSetAnswerEnum(this.value);

final String value;

@override
String toString() => value;
}


