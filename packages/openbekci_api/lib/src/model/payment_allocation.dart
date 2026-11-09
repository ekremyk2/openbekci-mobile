//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_allocation.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentAllocation {
  /// Returns a new [PaymentAllocation] instance.
  PaymentAllocation({

    required  this.chargeId,

    required  this.chargeDescription,

    required  this.amount,
  });

  @JsonKey(
    
    name: r'charge_id',
    required: true,
    includeIfNull: false,
  )


  final String chargeId;



  @JsonKey(
    
    name: r'charge_description',
    required: true,
    includeIfNull: true,
  )


  final String? chargeDescription;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final Money amount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentAllocation &&
      other.chargeId == chargeId &&
      other.chargeDescription == chargeDescription &&
      other.amount == amount;

    @override
    int get hashCode =>
        chargeId.hashCode +
        (chargeDescription == null ? 0 : chargeDescription.hashCode) +
        amount.hashCode;

  factory PaymentAllocation.fromJson(Map<String, dynamic> json) => _$PaymentAllocationFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAllocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

