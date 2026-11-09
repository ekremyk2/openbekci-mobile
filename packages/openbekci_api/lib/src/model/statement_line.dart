//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statement_line.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StatementLine {
  /// Returns a new [StatementLine] instance.
  StatementLine({

    required  this.date,

    required  this.kind,

    required  this.description,

    required  this.refType,

    required  this.refId,

    required  this.debtorKind,

    required  this.debtorDisplayName,

    required  this.principal,

    required  this.lateFee,

    required  this.debit,

    required  this.credit,

    required  this.balance,
  });

  @JsonKey(
    
    name: r'date',
    required: true,
    includeIfNull: false,
  )


  final DateTime date;



      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: StatementLineKindEnum.unknownDefaultOpenApi,
  )


  final StatementLineKindEnum kind;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



  @JsonKey(
    
    name: r'ref_type',
    required: true,
    includeIfNull: true,
  )


  final String? refType;



  @JsonKey(
    
    name: r'ref_id',
    required: true,
    includeIfNull: true,
  )


  final String? refId;



      /// Open enum.
  @JsonKey(
    
    name: r'debtor_kind',
    required: true,
    includeIfNull: true,
  unknownEnumValue: StatementLineDebtorKindEnum.unknownDefaultOpenApi,
  )


  final StatementLineDebtorKindEnum? debtorKind;



  @JsonKey(
    
    name: r'debtor_display_name',
    required: true,
    includeIfNull: true,
  )


  final String? debtorDisplayName;



  @JsonKey(
    
    name: r'principal',
    required: true,
    includeIfNull: false,
  )


  final Money principal;



  @JsonKey(
    
    name: r'late_fee',
    required: true,
    includeIfNull: false,
  )


  final Money lateFee;



  @JsonKey(
    
    name: r'debit',
    required: true,
    includeIfNull: false,
  )


  final Money debit;



  @JsonKey(
    
    name: r'credit',
    required: true,
    includeIfNull: false,
  )


  final Money credit;



      /// Running balance.
  @JsonKey(
    
    name: r'balance',
    required: true,
    includeIfNull: false,
  )


  final Money balance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StatementLine &&
      other.date == date &&
      other.kind == kind &&
      other.description == description &&
      other.refType == refType &&
      other.refId == refId &&
      other.debtorKind == debtorKind &&
      other.debtorDisplayName == debtorDisplayName &&
      other.principal == principal &&
      other.lateFee == lateFee &&
      other.debit == debit &&
      other.credit == credit &&
      other.balance == balance;

    @override
    int get hashCode =>
        date.hashCode +
        kind.hashCode +
        description.hashCode +
        (refType == null ? 0 : refType.hashCode) +
        (refId == null ? 0 : refId.hashCode) +
        (debtorKind == null ? 0 : debtorKind.hashCode) +
        (debtorDisplayName == null ? 0 : debtorDisplayName.hashCode) +
        principal.hashCode +
        lateFee.hashCode +
        debit.hashCode +
        credit.hashCode +
        balance.hashCode;

  factory StatementLine.fromJson(Map<String, dynamic> json) => _$StatementLineFromJson(json);

  Map<String, dynamic> toJson() => _$StatementLineToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum StatementLineKindEnum {
@JsonValue(r'opening')
opening(r'opening'),
@JsonValue(r'charge')
charge(r'charge'),
@JsonValue(r'payment')
payment(r'payment'),
@JsonValue(r'late_fee')
lateFee(r'late_fee'),
@JsonValue(r'credit')
credit(r'credit'),
@JsonValue(r'refund')
refund(r'refund'),
@JsonValue(r'adjustment')
adjustment(r'adjustment'),
@JsonValue(r'reversal')
reversal(r'reversal'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const StatementLineKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum StatementLineDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const StatementLineDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


