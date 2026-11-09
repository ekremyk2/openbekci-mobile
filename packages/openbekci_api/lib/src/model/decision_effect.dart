//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'decision_effect.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DecisionEffect {
  /// Returns a new [DecisionEffect] instance.
  DecisionEffect({

    required  this.kind,

    required  this.recordType,

    required  this.recordId,

    required  this.appliedAt,

    required  this.appliedBy,
  });

      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: DecisionEffectKindEnum.unknownDefaultOpenApi,
  )


  final DecisionEffectKindEnum kind;



  @JsonKey(
    
    name: r'record_type',
    required: true,
    includeIfNull: false,
  )


  final String recordType;



  @JsonKey(
    
    name: r'record_id',
    required: true,
    includeIfNull: false,
  )


  final String recordId;



  @JsonKey(
    
    name: r'applied_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime appliedAt;



  @JsonKey(
    
    name: r'applied_by',
    required: true,
    includeIfNull: false,
  )


  final String appliedBy;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DecisionEffect &&
      other.kind == kind &&
      other.recordType == recordType &&
      other.recordId == recordId &&
      other.appliedAt == appliedAt &&
      other.appliedBy == appliedBy;

    @override
    int get hashCode =>
        kind.hashCode +
        recordType.hashCode +
        recordId.hashCode +
        appliedAt.hashCode +
        appliedBy.hashCode;

  factory DecisionEffect.fromJson(Map<String, dynamic> json) => _$DecisionEffectFromJson(json);

  Map<String, dynamic> toJson() => _$DecisionEffectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum DecisionEffectKindEnum {
@JsonValue(r'dues_rate')
duesRate(r'dues_rate'),
@JsonValue(r'membership')
membership(r'membership'),
@JsonValue(r'budget_final')
budgetFinal(r'budget_final'),
@JsonValue(r'special_assessment')
specialAssessment(r'special_assessment'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DecisionEffectKindEnum(this.value);

final String value;

@override
String toString() => value;
}


