//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/debtor_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_declare.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentDeclare {
  /// Returns a new [PaymentDeclare] instance.
  PaymentDeclare({

    required  this.siteId,

    required  this.amount,

    required  this.paidOn,

     this.reference,

     this.note,

    required  this.debtor,
  });

  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final Money amount;



  @JsonKey(
    
    name: r'paid_on',
    required: true,
    includeIfNull: false,
  )


  final String paidOn;



  @JsonKey(
    
    name: r'reference',
    required: false,
    includeIfNull: false,
  )


  final String? reference;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



      /// Who the declared transfer is for. Residents declare for their own side; a former occupant never declares.
  @JsonKey(
    
    name: r'debtor',
    required: true,
    includeIfNull: false,
  )


  final DebtorRef debtor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentDeclare &&
      other.siteId == siteId &&
      other.amount == amount &&
      other.paidOn == paidOn &&
      other.reference == reference &&
      other.note == note &&
      other.debtor == debtor;

    @override
    int get hashCode =>
        siteId.hashCode +
        amount.hashCode +
        paidOn.hashCode +
        reference.hashCode +
        note.hashCode +
        debtor.hashCode;

  factory PaymentDeclare.fromJson(Map<String, dynamic> json) => _$PaymentDeclareFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDeclareToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

