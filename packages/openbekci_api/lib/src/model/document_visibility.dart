//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_visibility.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DocumentVisibility {
  /// Returns a new [DocumentVisibility] instance.
  DocumentVisibility({

    required  this.level,

     this.unitIds,
  });

  @JsonKey(
    
    name: r'level',
    required: true,
    includeIfNull: false,
  unknownEnumValue: DocumentVisibilityLevelEnum.unknownDefaultOpenApi,
  )


  final DocumentVisibilityLevelEnum level;



      /// With `level: units`.
  @JsonKey(
    
    name: r'unit_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? unitIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DocumentVisibility &&
      other.level == level &&
      other.unitIds == unitIds;

    @override
    int get hashCode =>
        level.hashCode +
        unitIds.hashCode;

  factory DocumentVisibility.fromJson(Map<String, dynamic> json) => _$DocumentVisibilityFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentVisibilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum DocumentVisibilityLevelEnum {
@JsonValue(r'board')
board(r'board'),
@JsonValue(r'owners')
owners(r'owners'),
@JsonValue(r'everyone')
everyone(r'everyone'),
@JsonValue(r'units')
units(r'units'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DocumentVisibilityLevelEnum(this.value);

final String value;

@override
String toString() => value;
}


