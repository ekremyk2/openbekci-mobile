//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dissent.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Dissent {
  /// Returns a new [Dissent] instance.
  Dissent({

    required  this.personId,

    required  this.displayName,

    required  this.text,
  });

  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: false,
  )


  final String personId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: true,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'text',
    required: true,
    includeIfNull: false,
  )


  final String text;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Dissent &&
      other.personId == personId &&
      other.displayName == displayName &&
      other.text == text;

    @override
    int get hashCode =>
        personId.hashCode +
        (displayName == null ? 0 : displayName.hashCode) +
        text.hashCode;

  factory Dissent.fromJson(Map<String, dynamic> json) => _$DissentFromJson(json);

  Map<String, dynamic> toJson() => _$DissentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

