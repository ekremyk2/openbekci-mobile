//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Checkout {
  /// Returns a new [Checkout] instance.
  Checkout({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.unitId,

    required  this.debtorKind,

    required  this.chargeIds,

    required  this.provider,

    required  this.merchantOfRecord,

    required  this.amount,

    required  this.status,

    required  this.checkoutUrl,

    required  this.returnUrl,

    required  this.expiresAt,

    required  this.paymentId,

    required  this.failureCode,

    required  this.createdBy,

    required  this.createdAt,

    required  this.completedAt,

     this.amountMismatch,

     this.confirmedAmount,
  });

      /// The checkout id (`checkout_id`).
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
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



      /// The unit side that pays. Open enum.
  @JsonKey(
    
    name: r'debtor_kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: CheckoutDebtorKindEnum.unknownDefaultOpenApi,
  )


  final CheckoutDebtorKindEnum debtorKind;



      /// The charges the payment is applied to; empty means oldest first.
  @JsonKey(
    
    name: r'charge_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> chargeIds;



      /// Id of the payment provider (`<packid>` or `<packid>.<name>`).
  @JsonKey(
    
    name: r'provider',
    required: true,
    includeIfNull: false,
  )


  final String provider;



      /// Whose provider account the checkout was created on (core setting `payments.merchant_of_record`). Open enum.
  @JsonKey(
    
    name: r'merchant_of_record',
    required: true,
    includeIfNull: false,
  unknownEnumValue: CheckoutMerchantOfRecordEnum.unknownDefaultOpenApi,
  )


  final CheckoutMerchantOfRecordEnum merchantOfRecord;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final Money amount;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: CheckoutStatusEnum.unknownDefaultOpenApi,
  )


  final CheckoutStatusEnum status;



      /// The provider's hosted page; null only when creation failed.
  @JsonKey(
    
    name: r'checkout_url',
    required: true,
    includeIfNull: true,
  )


  final String? checkoutUrl;



      /// Where the provider sends the payer back to, `{BASE_URL}/orgs/{org}/pay/return?checkout_id=...` or, for `client=mobile`, `openbekci://pay/return?org_id=...&checkout_id=...`.
  @JsonKey(
    
    name: r'return_url',
    required: true,
    includeIfNull: false,
  )


  final String returnUrl;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



      /// The payment once the checkout is `paid` (or `refunded`).
  @JsonKey(
    
    name: r'payment_id',
    required: true,
    includeIfNull: true,
  )


  final String? paymentId;



      /// `provider_error` or `provider_declined` when the checkout failed.
  @JsonKey(
    
    name: r'failure_code',
    required: true,
    includeIfNull: true,
  )


  final String? failureCode;



  @JsonKey(
    
    name: r'created_by',
    required: true,
    includeIfNull: true,
  )


  final String? createdBy;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'completed_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? completedAt;



      /// True when the provider confirmed another gross amount than `amount` (a partial capture, an adjustment at the provider). The payment holds `confirmed_amount`, never `amount`; the difference is audited (`checkout.amount_mismatch`). Absent or false otherwise.
  @JsonKey(
    
    name: r'amount_mismatch',
    required: false,
    includeIfNull: false,
  )


  final bool? amountMismatch;



      /// The gross amount the provider confirmed, set only when it differs from `amount`.
  @JsonKey(
    
    name: r'confirmed_amount',
    required: false,
    includeIfNull: false,
  )


  final Money? confirmedAmount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Checkout &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.debtorKind == debtorKind &&
      other.chargeIds == chargeIds &&
      other.provider == provider &&
      other.merchantOfRecord == merchantOfRecord &&
      other.amount == amount &&
      other.status == status &&
      other.checkoutUrl == checkoutUrl &&
      other.returnUrl == returnUrl &&
      other.expiresAt == expiresAt &&
      other.paymentId == paymentId &&
      other.failureCode == failureCode &&
      other.createdBy == createdBy &&
      other.createdAt == createdAt &&
      other.completedAt == completedAt &&
      other.amountMismatch == amountMismatch &&
      other.confirmedAmount == confirmedAmount;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        unitId.hashCode +
        debtorKind.hashCode +
        chargeIds.hashCode +
        provider.hashCode +
        merchantOfRecord.hashCode +
        amount.hashCode +
        status.hashCode +
        (checkoutUrl == null ? 0 : checkoutUrl.hashCode) +
        returnUrl.hashCode +
        expiresAt.hashCode +
        (paymentId == null ? 0 : paymentId.hashCode) +
        (failureCode == null ? 0 : failureCode.hashCode) +
        (createdBy == null ? 0 : createdBy.hashCode) +
        createdAt.hashCode +
        (completedAt == null ? 0 : completedAt.hashCode) +
        amountMismatch.hashCode +
        (confirmedAmount == null ? 0 : confirmedAmount.hashCode);

  factory Checkout.fromJson(Map<String, dynamic> json) => _$CheckoutFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// The unit side that pays. Open enum.
enum CheckoutDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const CheckoutDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Whose provider account the checkout was created on (core setting `payments.merchant_of_record`). Open enum.
enum CheckoutMerchantOfRecordEnum {
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'organization')
organization(r'organization'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const CheckoutMerchantOfRecordEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum CheckoutStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'paid')
paid(r'paid'),
@JsonValue(r'failed')
failed(r'failed'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'refunded')
refunded(r'refunded'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const CheckoutStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


