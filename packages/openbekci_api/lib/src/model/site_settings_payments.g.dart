// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_settings_payments.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SiteSettingsPaymentsCWProxy {
  SiteSettingsPayments card(SiteSettingsPaymentsCard card);

  SiteSettingsPayments merchantOfRecord(
    SiteSettingsPaymentsMerchantOfRecordEnum merchantOfRecord,
  );

  SiteSettingsPayments merchantOfRecordOverride(
    SiteSettingsPaymentsMerchantOfRecordOverrideEnum? merchantOfRecordOverride,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettingsPayments(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettingsPayments(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettingsPayments call({
    SiteSettingsPaymentsCard card,
    SiteSettingsPaymentsMerchantOfRecordEnum merchantOfRecord,
    SiteSettingsPaymentsMerchantOfRecordOverrideEnum? merchantOfRecordOverride,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSiteSettingsPayments.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSiteSettingsPayments.copyWith.fieldName(...)`
class _$SiteSettingsPaymentsCWProxyImpl
    implements _$SiteSettingsPaymentsCWProxy {
  const _$SiteSettingsPaymentsCWProxyImpl(this._value);

  final SiteSettingsPayments _value;

  @override
  SiteSettingsPayments card(SiteSettingsPaymentsCard card) => this(card: card);

  @override
  SiteSettingsPayments merchantOfRecord(
    SiteSettingsPaymentsMerchantOfRecordEnum merchantOfRecord,
  ) => this(merchantOfRecord: merchantOfRecord);

  @override
  SiteSettingsPayments merchantOfRecordOverride(
    SiteSettingsPaymentsMerchantOfRecordOverrideEnum? merchantOfRecordOverride,
  ) => this(merchantOfRecordOverride: merchantOfRecordOverride);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettingsPayments(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettingsPayments(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettingsPayments call({
    Object? card = const $CopyWithPlaceholder(),
    Object? merchantOfRecord = const $CopyWithPlaceholder(),
    Object? merchantOfRecordOverride = const $CopyWithPlaceholder(),
  }) {
    return SiteSettingsPayments(
      card: card == const $CopyWithPlaceholder()
          ? _value.card
          // ignore: cast_nullable_to_non_nullable
          : card as SiteSettingsPaymentsCard,
      merchantOfRecord: merchantOfRecord == const $CopyWithPlaceholder()
          ? _value.merchantOfRecord
          // ignore: cast_nullable_to_non_nullable
          : merchantOfRecord as SiteSettingsPaymentsMerchantOfRecordEnum,
      merchantOfRecordOverride:
          merchantOfRecordOverride == const $CopyWithPlaceholder()
          ? _value.merchantOfRecordOverride
          // ignore: cast_nullable_to_non_nullable
          : merchantOfRecordOverride
                as SiteSettingsPaymentsMerchantOfRecordOverrideEnum?,
    );
  }
}

extension $SiteSettingsPaymentsCopyWith on SiteSettingsPayments {
  /// Returns a callable class that can be used as follows: `instanceOfSiteSettingsPayments.copyWith(...)` or like so:`instanceOfSiteSettingsPayments.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SiteSettingsPaymentsCWProxy get copyWith =>
      _$SiteSettingsPaymentsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteSettingsPayments _$SiteSettingsPaymentsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SiteSettingsPayments',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'card',
        'merchant_of_record',
        'merchant_of_record_override',
      ],
    );
    final val = SiteSettingsPayments(
      card: $checkedConvert(
        'card',
        (v) => SiteSettingsPaymentsCard.fromJson(v as Map<String, dynamic>),
      ),
      merchantOfRecord: $checkedConvert(
        'merchant_of_record',
        (v) => $enumDecode(
          _$SiteSettingsPaymentsMerchantOfRecordEnumEnumMap,
          v,
          unknownValue:
              SiteSettingsPaymentsMerchantOfRecordEnum.unknownDefaultOpenApi,
        ),
      ),
      merchantOfRecordOverride: $checkedConvert(
        'merchant_of_record_override',
        (v) => $enumDecodeNullable(
          _$SiteSettingsPaymentsMerchantOfRecordOverrideEnumEnumMap,
          v,
          unknownValue: SiteSettingsPaymentsMerchantOfRecordOverrideEnum
              .unknownDefaultOpenApi,
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'merchantOfRecord': 'merchant_of_record',
    'merchantOfRecordOverride': 'merchant_of_record_override',
  },
);

Map<String, dynamic> _$SiteSettingsPaymentsToJson(
  SiteSettingsPayments instance,
) => <String, dynamic>{
  'card': instance.card.toJson(),
  'merchant_of_record':
      _$SiteSettingsPaymentsMerchantOfRecordEnumEnumMap[instance
          .merchantOfRecord]!,
  'merchant_of_record_override':
      _$SiteSettingsPaymentsMerchantOfRecordOverrideEnumEnumMap[instance
          .merchantOfRecordOverride],
};

const _$SiteSettingsPaymentsMerchantOfRecordEnumEnumMap = {
  SiteSettingsPaymentsMerchantOfRecordEnum.site: 'site',
  SiteSettingsPaymentsMerchantOfRecordEnum.organization: 'organization',
  SiteSettingsPaymentsMerchantOfRecordEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$SiteSettingsPaymentsMerchantOfRecordOverrideEnumEnumMap = {
  SiteSettingsPaymentsMerchantOfRecordOverrideEnum.site: 'site',
  SiteSettingsPaymentsMerchantOfRecordOverrideEnum.organization: 'organization',
  SiteSettingsPaymentsMerchantOfRecordOverrideEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
