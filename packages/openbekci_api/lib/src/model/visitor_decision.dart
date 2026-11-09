//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_decision.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VisitorDecision {
  /// Returns a new [VisitorDecision] instance.
  VisitorDecision({

    required  this.decision,
  });

  @JsonKey(
    
    name: r'decision',
    required: true,
    includeIfNull: false,
  unknownEnumValue: VisitorDecisionDecisionEnum.unknownDefaultOpenApi,
  )


  final VisitorDecisionDecisionEnum decision;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VisitorDecision &&
      other.decision == decision;

    @override
    int get hashCode =>
        decision.hashCode;

  factory VisitorDecision.fromJson(Map<String, dynamic> json) => _$VisitorDecisionFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorDecisionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum VisitorDecisionDecisionEnum {
@JsonValue(r'approve')
approve(r'approve'),
@JsonValue(r'deny')
deny(r'deny'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const VisitorDecisionDecisionEnum(this.value);

final String value;

@override
String toString() => value;
}


