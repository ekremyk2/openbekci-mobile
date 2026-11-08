//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'join_block.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JoinBlock {
  /// Returns a new [JoinBlock] instance.
  JoinBlock({

    required  this.id,

    required  this.name,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JoinBlock &&
      other.id == id &&
      other.name == name;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode;

  factory JoinBlock.fromJson(Map<String, dynamic> json) => _$JoinBlockFromJson(json);

  Map<String, dynamic> toJson() => _$JoinBlockToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

