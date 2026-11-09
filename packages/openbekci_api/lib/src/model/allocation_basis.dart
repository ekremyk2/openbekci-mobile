//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'allocation_basis.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AllocationBasis {
  /// Returns a new [AllocationBasis] instance.
  AllocationBasis({

    required  this.keyCode,

    required  this.weight,

    required  this.totalWeight,

    required  this.remainderAdjusted,
  });

  @JsonKey(
    
    name: r'key_code',
    required: true,
    includeIfNull: false,
  )


  final String keyCode;



  @JsonKey(
    
    name: r'weight',
    required: true,
    includeIfNull: false,
  )


  final num weight;



  @JsonKey(
    
    name: r'total_weight',
    required: true,
    includeIfNull: false,
  )


  final num totalWeight;



  @JsonKey(
    
    name: r'remainder_adjusted',
    required: true,
    includeIfNull: false,
  )


  final bool remainderAdjusted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AllocationBasis &&
      other.keyCode == keyCode &&
      other.weight == weight &&
      other.totalWeight == totalWeight &&
      other.remainderAdjusted == remainderAdjusted;

    @override
    int get hashCode =>
        keyCode.hashCode +
        weight.hashCode +
        totalWeight.hashCode +
        remainderAdjusted.hashCode;

  factory AllocationBasis.fromJson(Map<String, dynamic> json) => _$AllocationBasisFromJson(json);

  Map<String, dynamic> toJson() => _$AllocationBasisToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

