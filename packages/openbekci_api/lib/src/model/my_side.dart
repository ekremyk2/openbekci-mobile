//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/bank_details.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_side.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MySide {
  /// Returns a new [MySide] instance.
  MySide({

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.debtorKind,

    required  this.principal,

    required  this.accruedLateFee,

    required  this.total,

    required  this.credit,

    required  this.nextDueDate,

    required  this.bankDetails,
  });

  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'unit_door_number',
    required: true,
    includeIfNull: false,
  )


  final String unitDoorNumber;



      /// Open enum.
  @JsonKey(
    
    name: r'debtor_kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MySideDebtorKindEnum.unknownDefaultOpenApi,
  )


  final MySideDebtorKindEnum debtorKind;



  @JsonKey(
    
    name: r'principal',
    required: true,
    includeIfNull: false,
  )


  final Money principal;



  @JsonKey(
    
    name: r'accrued_late_fee',
    required: true,
    includeIfNull: false,
  )


  final Money accruedLateFee;



      /// What do I owe today.
  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final Money total;



  @JsonKey(
    
    name: r'credit',
    required: true,
    includeIfNull: false,
  )


  final Money credit;



  @JsonKey(
    
    name: r'next_due_date',
    required: true,
    includeIfNull: true,
  )


  final DateTime? nextDueDate;



  @JsonKey(
    
    name: r'bank_details',
    required: true,
    includeIfNull: true,
  )


  final BankDetails? bankDetails;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MySide &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.debtorKind == debtorKind &&
      other.principal == principal &&
      other.accruedLateFee == accruedLateFee &&
      other.total == total &&
      other.credit == credit &&
      other.nextDueDate == nextDueDate &&
      other.bankDetails == bankDetails;

    @override
    int get hashCode =>
        unitId.hashCode +
        unitDoorNumber.hashCode +
        debtorKind.hashCode +
        principal.hashCode +
        accruedLateFee.hashCode +
        total.hashCode +
        credit.hashCode +
        (nextDueDate == null ? 0 : nextDueDate.hashCode) +
        (bankDetails == null ? 0 : bankDetails.hashCode);

  factory MySide.fromJson(Map<String, dynamic> json) => _$MySideFromJson(json);

  Map<String, dynamic> toJson() => _$MySideToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum MySideDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MySideDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


