//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/debtor_ref.dart';
import 'package:openbekci_api/src/model/statement_line.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statement.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Statement {
  /// Returns a new [Statement] instance.
  Statement({

    required  this.debtor,

    required  this.from,

    required  this.to,

    required  this.openingBalance,

    required  this.lines,

    required  this.closingBalance,

    required  this.accruedLateFee,

    required  this.totalDue,

    required  this.credit,
  });

      /// Whose statement this is: a unit side or a person.
  @JsonKey(
    
    name: r'debtor',
    required: true,
    includeIfNull: false,
  )


  final DebtorRef debtor;



  @JsonKey(
    
    name: r'from',
    required: true,
    includeIfNull: false,
  )


  final DateTime from;



  @JsonKey(
    
    name: r'to',
    required: true,
    includeIfNull: false,
  )


  final DateTime to;



  @JsonKey(
    
    name: r'opening_balance',
    required: true,
    includeIfNull: false,
  )


  final Money openingBalance;



  @JsonKey(
    
    name: r'lines',
    required: true,
    includeIfNull: false,
  )


  final List<StatementLine> lines;



  @JsonKey(
    
    name: r'closing_balance',
    required: true,
    includeIfNull: false,
  )


  final Money closingBalance;



      /// Fee accrued to date and not yet booked; included in `total_due`.
  @JsonKey(
    
    name: r'accrued_late_fee',
    required: true,
    includeIfNull: false,
  )


  final Money accruedLateFee;



  @JsonKey(
    
    name: r'total_due',
    required: true,
    includeIfNull: false,
  )


  final Money totalDue;



  @JsonKey(
    
    name: r'credit',
    required: true,
    includeIfNull: false,
  )


  final Money credit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Statement &&
      other.debtor == debtor &&
      other.from == from &&
      other.to == to &&
      other.openingBalance == openingBalance &&
      other.lines == lines &&
      other.closingBalance == closingBalance &&
      other.accruedLateFee == accruedLateFee &&
      other.totalDue == totalDue &&
      other.credit == credit;

    @override
    int get hashCode =>
        debtor.hashCode +
        from.hashCode +
        to.hashCode +
        openingBalance.hashCode +
        lines.hashCode +
        closingBalance.hashCode +
        accruedLateFee.hashCode +
        totalDue.hashCode +
        credit.hashCode;

  factory Statement.fromJson(Map<String, dynamic> json) => _$StatementFromJson(json);

  Map<String, dynamic> toJson() => _$StatementToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

