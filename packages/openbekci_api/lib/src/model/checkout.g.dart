// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckoutCWProxy {
  Checkout id(String id);

  Checkout orgId(String orgId);

  Checkout siteId(String siteId);

  Checkout unitId(String unitId);

  Checkout debtorKind(CheckoutDebtorKindEnum debtorKind);

  Checkout chargeIds(List<String> chargeIds);

  Checkout provider(String provider);

  Checkout merchantOfRecord(CheckoutMerchantOfRecordEnum merchantOfRecord);

  Checkout amount(Money amount);

  Checkout status(CheckoutStatusEnum status);

  Checkout checkoutUrl(String? checkoutUrl);

  Checkout returnUrl(String returnUrl);

  Checkout expiresAt(DateTime expiresAt);

  Checkout paymentId(String? paymentId);

  Checkout failureCode(String? failureCode);

  Checkout createdBy(String? createdBy);

  Checkout createdAt(DateTime createdAt);

  Checkout completedAt(DateTime? completedAt);

  Checkout amountMismatch(bool? amountMismatch);

  Checkout confirmedAmount(Money? confirmedAmount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Checkout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Checkout(...).copyWith(id: 12, name: "My name")
  /// ````
  Checkout call({
    String id,
    String orgId,
    String siteId,
    String unitId,
    CheckoutDebtorKindEnum debtorKind,
    List<String> chargeIds,
    String provider,
    CheckoutMerchantOfRecordEnum merchantOfRecord,
    Money amount,
    CheckoutStatusEnum status,
    String? checkoutUrl,
    String returnUrl,
    DateTime expiresAt,
    String? paymentId,
    String? failureCode,
    String? createdBy,
    DateTime createdAt,
    DateTime? completedAt,
    bool? amountMismatch,
    Money? confirmedAmount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCheckout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCheckout.copyWith.fieldName(...)`
class _$CheckoutCWProxyImpl implements _$CheckoutCWProxy {
  const _$CheckoutCWProxyImpl(this._value);

  final Checkout _value;

  @override
  Checkout id(String id) => this(id: id);

  @override
  Checkout orgId(String orgId) => this(orgId: orgId);

  @override
  Checkout siteId(String siteId) => this(siteId: siteId);

  @override
  Checkout unitId(String unitId) => this(unitId: unitId);

  @override
  Checkout debtorKind(CheckoutDebtorKindEnum debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  Checkout chargeIds(List<String> chargeIds) => this(chargeIds: chargeIds);

  @override
  Checkout provider(String provider) => this(provider: provider);

  @override
  Checkout merchantOfRecord(CheckoutMerchantOfRecordEnum merchantOfRecord) =>
      this(merchantOfRecord: merchantOfRecord);

  @override
  Checkout amount(Money amount) => this(amount: amount);

  @override
  Checkout status(CheckoutStatusEnum status) => this(status: status);

  @override
  Checkout checkoutUrl(String? checkoutUrl) => this(checkoutUrl: checkoutUrl);

  @override
  Checkout returnUrl(String returnUrl) => this(returnUrl: returnUrl);

  @override
  Checkout expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  Checkout paymentId(String? paymentId) => this(paymentId: paymentId);

  @override
  Checkout failureCode(String? failureCode) => this(failureCode: failureCode);

  @override
  Checkout createdBy(String? createdBy) => this(createdBy: createdBy);

  @override
  Checkout createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Checkout completedAt(DateTime? completedAt) => this(completedAt: completedAt);

  @override
  Checkout amountMismatch(bool? amountMismatch) =>
      this(amountMismatch: amountMismatch);

  @override
  Checkout confirmedAmount(Money? confirmedAmount) =>
      this(confirmedAmount: confirmedAmount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Checkout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Checkout(...).copyWith(id: 12, name: "My name")
  /// ````
  Checkout call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? chargeIds = const $CopyWithPlaceholder(),
    Object? provider = const $CopyWithPlaceholder(),
    Object? merchantOfRecord = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? checkoutUrl = const $CopyWithPlaceholder(),
    Object? returnUrl = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? paymentId = const $CopyWithPlaceholder(),
    Object? failureCode = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? completedAt = const $CopyWithPlaceholder(),
    Object? amountMismatch = const $CopyWithPlaceholder(),
    Object? confirmedAmount = const $CopyWithPlaceholder(),
  }) {
    return Checkout(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as CheckoutDebtorKindEnum,
      chargeIds: chargeIds == const $CopyWithPlaceholder()
          ? _value.chargeIds
          // ignore: cast_nullable_to_non_nullable
          : chargeIds as List<String>,
      provider: provider == const $CopyWithPlaceholder()
          ? _value.provider
          // ignore: cast_nullable_to_non_nullable
          : provider as String,
      merchantOfRecord: merchantOfRecord == const $CopyWithPlaceholder()
          ? _value.merchantOfRecord
          // ignore: cast_nullable_to_non_nullable
          : merchantOfRecord as CheckoutMerchantOfRecordEnum,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as Money,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CheckoutStatusEnum,
      checkoutUrl: checkoutUrl == const $CopyWithPlaceholder()
          ? _value.checkoutUrl
          // ignore: cast_nullable_to_non_nullable
          : checkoutUrl as String?,
      returnUrl: returnUrl == const $CopyWithPlaceholder()
          ? _value.returnUrl
          // ignore: cast_nullable_to_non_nullable
          : returnUrl as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      paymentId: paymentId == const $CopyWithPlaceholder()
          ? _value.paymentId
          // ignore: cast_nullable_to_non_nullable
          : paymentId as String?,
      failureCode: failureCode == const $CopyWithPlaceholder()
          ? _value.failureCode
          // ignore: cast_nullable_to_non_nullable
          : failureCode as String?,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      completedAt: completedAt == const $CopyWithPlaceholder()
          ? _value.completedAt
          // ignore: cast_nullable_to_non_nullable
          : completedAt as DateTime?,
      amountMismatch: amountMismatch == const $CopyWithPlaceholder()
          ? _value.amountMismatch
          // ignore: cast_nullable_to_non_nullable
          : amountMismatch as bool?,
      confirmedAmount: confirmedAmount == const $CopyWithPlaceholder()
          ? _value.confirmedAmount
          // ignore: cast_nullable_to_non_nullable
          : confirmedAmount as Money?,
    );
  }
}

extension $CheckoutCopyWith on Checkout {
  /// Returns a callable class that can be used as follows: `instanceOfCheckout.copyWith(...)` or like so:`instanceOfCheckout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckoutCWProxy get copyWith => _$CheckoutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkout _$CheckoutFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Checkout',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'unit_id',
        'debtor_kind',
        'charge_ids',
        'provider',
        'merchant_of_record',
        'amount',
        'status',
        'checkout_url',
        'return_url',
        'expires_at',
        'payment_id',
        'failure_code',
        'created_by',
        'created_at',
        'completed_at',
      ],
    );
    final val = Checkout(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      debtorKind: $checkedConvert(
        'debtor_kind',
        (v) => $enumDecode(
          _$CheckoutDebtorKindEnumEnumMap,
          v,
          unknownValue: CheckoutDebtorKindEnum.unknownDefaultOpenApi,
        ),
      ),
      chargeIds: $checkedConvert(
        'charge_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      provider: $checkedConvert('provider', (v) => v as String),
      merchantOfRecord: $checkedConvert(
        'merchant_of_record',
        (v) => $enumDecode(
          _$CheckoutMerchantOfRecordEnumEnumMap,
          v,
          unknownValue: CheckoutMerchantOfRecordEnum.unknownDefaultOpenApi,
        ),
      ),
      amount: $checkedConvert(
        'amount',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$CheckoutStatusEnumEnumMap,
          v,
          unknownValue: CheckoutStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      checkoutUrl: $checkedConvert('checkout_url', (v) => v as String?),
      returnUrl: $checkedConvert('return_url', (v) => v as String),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      paymentId: $checkedConvert('payment_id', (v) => v as String?),
      failureCode: $checkedConvert('failure_code', (v) => v as String?),
      createdBy: $checkedConvert('created_by', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      completedAt: $checkedConvert(
        'completed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      amountMismatch: $checkedConvert('amount_mismatch', (v) => v as bool?),
      confirmedAmount: $checkedConvert(
        'confirmed_amount',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'unitId': 'unit_id',
    'debtorKind': 'debtor_kind',
    'chargeIds': 'charge_ids',
    'merchantOfRecord': 'merchant_of_record',
    'checkoutUrl': 'checkout_url',
    'returnUrl': 'return_url',
    'expiresAt': 'expires_at',
    'paymentId': 'payment_id',
    'failureCode': 'failure_code',
    'createdBy': 'created_by',
    'createdAt': 'created_at',
    'completedAt': 'completed_at',
    'amountMismatch': 'amount_mismatch',
    'confirmedAmount': 'confirmed_amount',
  },
);

Map<String, dynamic> _$CheckoutToJson(Checkout instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'unit_id': instance.unitId,
  'debtor_kind': _$CheckoutDebtorKindEnumEnumMap[instance.debtorKind]!,
  'charge_ids': instance.chargeIds,
  'provider': instance.provider,
  'merchant_of_record':
      _$CheckoutMerchantOfRecordEnumEnumMap[instance.merchantOfRecord]!,
  'amount': instance.amount.toJson(),
  'status': _$CheckoutStatusEnumEnumMap[instance.status]!,
  'checkout_url': instance.checkoutUrl,
  'return_url': instance.returnUrl,
  'expires_at': instance.expiresAt.toIso8601String(),
  'payment_id': instance.paymentId,
  'failure_code': instance.failureCode,
  'created_by': instance.createdBy,
  'created_at': instance.createdAt.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'amount_mismatch': ?instance.amountMismatch,
  'confirmed_amount': ?instance.confirmedAmount?.toJson(),
};

const _$CheckoutDebtorKindEnumEnumMap = {
  CheckoutDebtorKindEnum.owner: 'owner',
  CheckoutDebtorKindEnum.tenant: 'tenant',
  CheckoutDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$CheckoutMerchantOfRecordEnumEnumMap = {
  CheckoutMerchantOfRecordEnum.site: 'site',
  CheckoutMerchantOfRecordEnum.organization: 'organization',
  CheckoutMerchantOfRecordEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$CheckoutStatusEnumEnumMap = {
  CheckoutStatusEnum.pending: 'pending',
  CheckoutStatusEnum.paid: 'paid',
  CheckoutStatusEnum.failed: 'failed',
  CheckoutStatusEnum.expired: 'expired',
  CheckoutStatusEnum.refunded: 'refunded',
  CheckoutStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
