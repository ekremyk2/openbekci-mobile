//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'problem_field_error.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ProblemFieldError {
  /// Returns a new [ProblemFieldError] instance.
  ProblemFieldError({

    required  this.field,

    required  this.code,

     this.params,
  });

      /// Dotted path of the offending request field, query or header parameter.
  @JsonKey(
    
    name: r'field',
    required: true,
    includeIfNull: false,
  )


  final String field;



      /// Field-level error code, for example `required`, `invalid`, `too_long`.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



      /// Values for the client message template, such as the maximum length.
  @JsonKey(
    
    name: r'params',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? params;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ProblemFieldError &&
      other.field == field &&
      other.code == code &&
      other.params == params;

    @override
    int get hashCode =>
        field.hashCode +
        code.hashCode +
        params.hashCode;

  factory ProblemFieldError.fromJson(Map<String, dynamic> json) => _$ProblemFieldErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemFieldErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

