//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/site_settings_payments_card.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_settings_payments.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SiteSettingsPayments {
  /// Returns a new [SiteSettingsPayments] instance.
  SiteSettingsPayments({

    required  this.card,

    required  this.merchantOfRecord,

    required  this.merchantOfRecordOverride,
  });

  @JsonKey(
    
    name: r'card',
    required: true,
    includeIfNull: false,
  )


  final SiteSettingsPaymentsCard card;



      /// The effective merchant of record (the site override, else the organization setting, else `site`). Open enum.
  @JsonKey(
    
    name: r'merchant_of_record',
    required: true,
    includeIfNull: false,
  unknownEnumValue: SiteSettingsPaymentsMerchantOfRecordEnum.unknownDefaultOpenApi,
  )


  final SiteSettingsPaymentsMerchantOfRecordEnum merchantOfRecord;



      /// The site's own override of the organization setting, null when it follows the organization. Open enum.
  @JsonKey(
    
    name: r'merchant_of_record_override',
    required: true,
    includeIfNull: true,
  unknownEnumValue: SiteSettingsPaymentsMerchantOfRecordOverrideEnum.unknownDefaultOpenApi,
  )


  final SiteSettingsPaymentsMerchantOfRecordOverrideEnum? merchantOfRecordOverride;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SiteSettingsPayments &&
      other.card == card &&
      other.merchantOfRecord == merchantOfRecord &&
      other.merchantOfRecordOverride == merchantOfRecordOverride;

    @override
    int get hashCode =>
        card.hashCode +
        merchantOfRecord.hashCode +
        (merchantOfRecordOverride == null ? 0 : merchantOfRecordOverride.hashCode);

  factory SiteSettingsPayments.fromJson(Map<String, dynamic> json) => _$SiteSettingsPaymentsFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSettingsPaymentsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// The effective merchant of record (the site override, else the organization setting, else `site`). Open enum.
enum SiteSettingsPaymentsMerchantOfRecordEnum {
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'organization')
organization(r'organization'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const SiteSettingsPaymentsMerchantOfRecordEnum(this.value);

final String value;

@override
String toString() => value;
}


/// The site's own override of the organization setting, null when it follows the organization. Open enum.
enum SiteSettingsPaymentsMerchantOfRecordOverrideEnum {
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'organization')
organization(r'organization'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const SiteSettingsPaymentsMerchantOfRecordOverrideEnum(this.value);

final String value;

@override
String toString() => value;
}


