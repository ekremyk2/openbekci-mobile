//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/payment_allocation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Payment {
  /// Returns a new [Payment] instance.
  Payment({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.payerPersonId,

    required  this.payerDisplayName,

    required  this.unitId,

    required  this.debtorKind,

    required  this.method,

    required  this.gross,

    required  this.fee,

    required  this.net,

    required  this.receivedOn,

    required  this.recordedBy,

    required  this.assetAccountId,

    required  this.reference,

    required  this.note,

    required  this.status,

    required  this.receiptNo,

    required  this.providerTxnId,

    required  this.journalEntryId,

    required  this.allocated,

    required  this.unallocated,

    required  this.allocations,

    required  this.bankTransactionId,

    required  this.createdAt,

    required  this.updatedAt,

     this.version,
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
    
    name: r'payer_person_id',
    required: true,
    includeIfNull: true,
  )


  final String? payerPersonId;



  @JsonKey(
    
    name: r'payer_display_name',
    required: true,
    includeIfNull: true,
  )


  final String? payerDisplayName;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: true,
  )


  final String? unitId;



      /// Open enum.
  @JsonKey(
    
    name: r'debtor_kind',
    required: true,
    includeIfNull: true,
  unknownEnumValue: PaymentDebtorKindEnum.unknownDefaultOpenApi,
  )


  final PaymentDebtorKindEnum? debtorKind;



      /// `cash`, `bank_transfer`, or `card:<provider>` for a payment made through a payment provider (for example `card:iyzico`). Open set: clients tolerate unknown values.
  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



  @JsonKey(
    
    name: r'gross',
    required: true,
    includeIfNull: false,
  )


  final Money gross;



  @JsonKey(
    
    name: r'fee',
    required: true,
    includeIfNull: false,
  )


  final Money fee;



  @JsonKey(
    
    name: r'net',
    required: true,
    includeIfNull: false,
  )


  final Money net;



  @JsonKey(
    
    name: r'received_on',
    required: true,
    includeIfNull: false,
  )


  final DateTime receivedOn;



  @JsonKey(
    
    name: r'recorded_by',
    required: true,
    includeIfNull: true,
  )


  final String? recordedBy;



  @JsonKey(
    
    name: r'asset_account_id',
    required: true,
    includeIfNull: false,
  )


  final String assetAccountId;



  @JsonKey(
    
    name: r'reference',
    required: true,
    includeIfNull: true,
  )


  final String? reference;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: PaymentStatusEnum.unknownDefaultOpenApi,
  )


  final PaymentStatusEnum status;



      /// Gap-free per site per year.
  @JsonKey(
    
    name: r'receipt_no',
    required: true,
    includeIfNull: true,
  )


  final String? receiptNo;



  @JsonKey(
    
    name: r'provider_txn_id',
    required: true,
    includeIfNull: true,
  )


  final String? providerTxnId;



  @JsonKey(
    
    name: r'journal_entry_id',
    required: true,
    includeIfNull: true,
  )


  final String? journalEntryId;



  @JsonKey(
    
    name: r'allocated',
    required: true,
    includeIfNull: false,
  )


  final Money allocated;



      /// Becomes credit.
  @JsonKey(
    
    name: r'unallocated',
    required: true,
    includeIfNull: false,
  )


  final Money unallocated;



  @JsonKey(
    
    name: r'allocations',
    required: true,
    includeIfNull: false,
  )


  final List<PaymentAllocation> allocations;



  @JsonKey(
    
    name: r'bank_transaction_id',
    required: true,
    includeIfNull: true,
  )


  final String? bankTransactionId;



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



      /// Moves whenever the payment changes status; send it as `If-Match` to refund a provider payment.
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final int? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Payment &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.payerPersonId == payerPersonId &&
      other.payerDisplayName == payerDisplayName &&
      other.unitId == unitId &&
      other.debtorKind == debtorKind &&
      other.method == method &&
      other.gross == gross &&
      other.fee == fee &&
      other.net == net &&
      other.receivedOn == receivedOn &&
      other.recordedBy == recordedBy &&
      other.assetAccountId == assetAccountId &&
      other.reference == reference &&
      other.note == note &&
      other.status == status &&
      other.receiptNo == receiptNo &&
      other.providerTxnId == providerTxnId &&
      other.journalEntryId == journalEntryId &&
      other.allocated == allocated &&
      other.unallocated == unallocated &&
      other.allocations == allocations &&
      other.bankTransactionId == bankTransactionId &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        (payerPersonId == null ? 0 : payerPersonId.hashCode) +
        (payerDisplayName == null ? 0 : payerDisplayName.hashCode) +
        (unitId == null ? 0 : unitId.hashCode) +
        (debtorKind == null ? 0 : debtorKind.hashCode) +
        method.hashCode +
        gross.hashCode +
        fee.hashCode +
        net.hashCode +
        receivedOn.hashCode +
        (recordedBy == null ? 0 : recordedBy.hashCode) +
        assetAccountId.hashCode +
        (reference == null ? 0 : reference.hashCode) +
        (note == null ? 0 : note.hashCode) +
        status.hashCode +
        (receiptNo == null ? 0 : receiptNo.hashCode) +
        (providerTxnId == null ? 0 : providerTxnId.hashCode) +
        (journalEntryId == null ? 0 : journalEntryId.hashCode) +
        allocated.hashCode +
        unallocated.hashCode +
        allocations.hashCode +
        (bankTransactionId == null ? 0 : bankTransactionId.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum PaymentDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PaymentDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum PaymentStatusEnum {
@JsonValue(r'pending_declared')
pendingDeclared(r'pending_declared'),
@JsonValue(r'confirmed')
confirmed(r'confirmed'),
@JsonValue(r'refunded')
refunded(r'refunded'),
@JsonValue(r'voided')
voided(r'voided'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PaymentStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


