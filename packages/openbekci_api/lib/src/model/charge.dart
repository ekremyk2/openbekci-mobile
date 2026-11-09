//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/allocation_basis.dart';
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/effective_debtor.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'charge.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Charge {
  /// Returns a new [Charge] instance.
  Charge({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.planId,

    required  this.unitId,

    required  this.unitDoorNumber,

    required  this.debtorKind,

    required  this.debtorPersonId,

    required  this.debtorDisplayName,

    required  this.chargeType,

    required  this.period,

    required  this.amount,

    required  this.paid,

    required  this.balance,

    required  this.dueDate,

    required  this.description,

    required  this.allocationBasis,

    required  this.journalEntryId,

    required  this.status,

    required  this.cancelledReason,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.effectiveDebtor,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'plan_id',
    required: true,
    includeIfNull: true,
  )


  final String? planId;



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
  unknownEnumValue: ChargeDebtorKindEnum.unknownDefaultOpenApi,
  )


  final ChargeDebtorKindEnum debtorKind;



      /// Snapshot of the occupant on the due date; becomes the holder when open charges are carried to a person on move-out.
  @JsonKey(
    
    name: r'debtor_person_id',
    required: true,
    includeIfNull: true,
  )


  final String? debtorPersonId;



  @JsonKey(
    
    name: r'debtor_display_name',
    required: true,
    includeIfNull: true,
  )


  final String? debtorDisplayName;



      /// Open enum.
  @JsonKey(
    
    name: r'charge_type',
    required: true,
    includeIfNull: false,
  unknownEnumValue: ChargeChargeTypeEnum.unknownDefaultOpenApi,
  )


  final ChargeChargeTypeEnum chargeType;



      /// The accrual month, `YYYY-MM` (pattern `^\\d{4}-(0[1-9]|1[0-2])$`), for every plan frequency: a quarterly plan carries the first month of each quarter counted from its `start`, a yearly plan the month of its `start`, a one-off charge the month of its due date. There are no `YYYY-Qn` or `YYYY` period strings in the API; ranges use dates.
  @JsonKey(
    
    name: r'period',
    required: true,
    includeIfNull: true,
  )


  final String? period;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final Money amount;



  @JsonKey(
    
    name: r'paid',
    required: true,
    includeIfNull: false,
  )


  final Money paid;



  @JsonKey(
    
    name: r'balance',
    required: true,
    includeIfNull: false,
  )


  final Money balance;



  @JsonKey(
    
    name: r'due_date',
    required: true,
    includeIfNull: false,
  )


  final DateTime dueDate;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: true,
  )


  final String? description;



  @JsonKey(
    
    name: r'allocation_basis',
    required: true,
    includeIfNull: true,
  )


  final AllocationBasis? allocationBasis;



  @JsonKey(
    
    name: r'journal_entry_id',
    required: true,
    includeIfNull: false,
  )


  final String journalEntryId;



      /// Derived and rebuildable. Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: ChargeStatusEnum.unknownDefaultOpenApi,
  )


  final ChargeStatusEnum status;



  @JsonKey(
    
    name: r'cancelled_reason',
    required: true,
    includeIfNull: true,
  )


  final String? cancelledReason;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



  @JsonKey(
    
    name: r'effective_debtor',
    required: true,
    includeIfNull: false,
  )


  final EffectiveDebtor effectiveDebtor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Charge &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.planId == planId &&
      other.unitId == unitId &&
      other.unitDoorNumber == unitDoorNumber &&
      other.debtorKind == debtorKind &&
      other.debtorPersonId == debtorPersonId &&
      other.debtorDisplayName == debtorDisplayName &&
      other.chargeType == chargeType &&
      other.period == period &&
      other.amount == amount &&
      other.paid == paid &&
      other.balance == balance &&
      other.dueDate == dueDate &&
      other.description == description &&
      other.allocationBasis == allocationBasis &&
      other.journalEntryId == journalEntryId &&
      other.status == status &&
      other.cancelledReason == cancelledReason &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.effectiveDebtor == effectiveDebtor;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        (planId == null ? 0 : planId.hashCode) +
        unitId.hashCode +
        unitDoorNumber.hashCode +
        debtorKind.hashCode +
        (debtorPersonId == null ? 0 : debtorPersonId.hashCode) +
        (debtorDisplayName == null ? 0 : debtorDisplayName.hashCode) +
        chargeType.hashCode +
        (period == null ? 0 : period.hashCode) +
        amount.hashCode +
        paid.hashCode +
        balance.hashCode +
        dueDate.hashCode +
        (description == null ? 0 : description.hashCode) +
        (allocationBasis == null ? 0 : allocationBasis.hashCode) +
        journalEntryId.hashCode +
        status.hashCode +
        (cancelledReason == null ? 0 : cancelledReason.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        effectiveDebtor.hashCode;

  factory Charge.fromJson(Map<String, dynamic> json) => _$ChargeFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum ChargeDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const ChargeDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum ChargeChargeTypeEnum {
@JsonValue(r'dues')
dues(r'dues'),
@JsonValue(r'special_assessment')
specialAssessment(r'special_assessment'),
@JsonValue(r'reserve_contribution')
reserveContribution(r'reserve_contribution'),
@JsonValue(r'utility')
utility(r'utility'),
@JsonValue(r'booking_fee')
bookingFee(r'booking_fee'),
@JsonValue(r'legal_cost')
legalCost(r'legal_cost'),
@JsonValue(r'deposit')
deposit(r'deposit'),
@JsonValue(r'adjustment')
adjustment(r'adjustment'),
@JsonValue(r'settlement')
settlement(r'settlement'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const ChargeChargeTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Derived and rebuildable. Open enum.
enum ChargeStatusEnum {
@JsonValue(r'open')
open(r'open'),
@JsonValue(r'partially_paid')
partiallyPaid(r'partially_paid'),
@JsonValue(r'paid')
paid(r'paid'),
@JsonValue(r'cancelled')
cancelled(r'cancelled'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const ChargeStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


