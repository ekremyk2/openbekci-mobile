//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code_label.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CodeLabel {
  /// Returns a new [CodeLabel] instance.
  CodeLabel({

    required  this.code,

    required  this.label,

     this.description,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'label',
    required: true,
    includeIfNull: false,
  )


  final String label;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CodeLabel &&
      other.code == code &&
      other.label == label &&
      other.description == description;

    @override
    int get hashCode =>
        code.hashCode +
        label.hashCode +
        description.hashCode;

  factory CodeLabel.fromJson(Map<String, dynamic> json) => _$CodeLabelFromJson(json);

  Map<String, dynamic> toJson() => _$CodeLabelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

