//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'join_unit.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JoinUnit {
  /// Returns a new [JoinUnit] instance.
  JoinUnit({

    required  this.id,

    required  this.doorNumber,

    required  this.blockName,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'door_number',
    required: true,
    includeIfNull: false,
  )


  final String doorNumber;



  @JsonKey(
    
    name: r'block_name',
    required: true,
    includeIfNull: false,
  )


  final String blockName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JoinUnit &&
      other.id == id &&
      other.doorNumber == doorNumber &&
      other.blockName == blockName;

    @override
    int get hashCode =>
        id.hashCode +
        doorNumber.hashCode +
        blockName.hashCode;

  factory JoinUnit.fromJson(Map<String, dynamic> json) => _$JoinUnitFromJson(json);

  Map<String, dynamic> toJson() => _$JoinUnitToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

