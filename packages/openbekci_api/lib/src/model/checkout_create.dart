//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'checkout_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CheckoutCreate {
  /// Returns a new [CheckoutCreate] instance.
  CheckoutCreate({

    required  this.unitId,

    required  this.debtorKind,

     this.chargeIds,

     this.amount,

     this.client = CheckoutCreateClientEnum.web,
  });

  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



      /// The unit side that pays. A resident may pay only a side their current occupancy reaches (an owner both sides, a tenant the tenant side, a household member their own side with `may_see_money`).
  @JsonKey(
    
    name: r'debtor_kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: CheckoutCreateDebtorKindEnum.unknownDefaultOpenApi,
  )


  final CheckoutCreateDebtorKindEnum debtorKind;



      /// Charges to pay (each must be open on that side). Omitted or empty means oldest first.
  @JsonKey(
    
    name: r'charge_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? chargeIds;



      /// The gross amount to pay, in the site currency. With `charge_ids` it defaults to what is open on them; without, to everything open on the side (an amount above what is open becomes credit).
  @JsonKey(
    
    name: r'amount',
    required: false,
    includeIfNull: false,
  )


  final Money? amount;



      /// `mobile` makes `return_url` the app's `openbekci://pay/return`; the default `web` the web app's pay return page.
  @JsonKey(
    name: r'client',
    required: false,
    includeIfNull: false,
  unknownEnumValue: CheckoutCreateClientEnum.unknownDefaultOpenApi,
  )


  final CheckoutCreateClientEnum? client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CheckoutCreate &&
      other.unitId == unitId &&
      other.debtorKind == debtorKind &&
      other.chargeIds == chargeIds &&
      other.amount == amount &&
      other.client == client;

    @override
    int get hashCode =>
        unitId.hashCode +
        debtorKind.hashCode +
        chargeIds.hashCode +
        amount.hashCode +
        client.hashCode;

  factory CheckoutCreate.fromJson(Map<String, dynamic> json) => _$CheckoutCreateFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// The unit side that pays. A resident may pay only a side their current occupancy reaches (an owner both sides, a tenant the tenant side, a household member their own side with `may_see_money`).
enum CheckoutCreateDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const CheckoutCreateDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// `mobile` makes `return_url` the app's `openbekci://pay/return`; the default `web` the web app's pay return page.
enum CheckoutCreateClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const CheckoutCreateClientEnum(this.value);

final String value;

@override
String toString() => value;
}


