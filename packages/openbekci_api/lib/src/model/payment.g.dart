// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentCWProxy {
  Payment id(String id);

  Payment orgId(String orgId);

  Payment siteId(String siteId);

  Payment payerPersonId(String? payerPersonId);

  Payment payerDisplayName(String? payerDisplayName);

  Payment unitId(String? unitId);

  Payment debtorKind(PaymentDebtorKindEnum? debtorKind);

  Payment method(String method);

  Payment gross(Money gross);

  Payment fee(Money fee);

  Payment net(Money net);

  Payment receivedOn(DateTime receivedOn);

  Payment recordedBy(String? recordedBy);

  Payment assetAccountId(String assetAccountId);

  Payment reference(String? reference);

  Payment note(String? note);

  Payment status(PaymentStatusEnum status);

  Payment receiptNo(String? receiptNo);

  Payment providerTxnId(String? providerTxnId);

  Payment journalEntryId(String? journalEntryId);

  Payment allocated(Money allocated);

  Payment unallocated(Money unallocated);

  Payment allocations(List<PaymentAllocation> allocations);

  Payment bankTransactionId(String? bankTransactionId);

  Payment createdAt(DateTime createdAt);

  Payment updatedAt(DateTime updatedAt);

  Payment version(int? version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Payment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Payment(...).copyWith(id: 12, name: "My name")
  /// ````
  Payment call({
    String id,
    String orgId,
    String siteId,
    String? payerPersonId,
    String? payerDisplayName,
    String? unitId,
    PaymentDebtorKindEnum? debtorKind,
    String method,
    Money gross,
    Money fee,
    Money net,
    DateTime receivedOn,
    String? recordedBy,
    String assetAccountId,
    String? reference,
    String? note,
    PaymentStatusEnum status,
    String? receiptNo,
    String? providerTxnId,
    String? journalEntryId,
    Money allocated,
    Money unallocated,
    List<PaymentAllocation> allocations,
    String? bankTransactionId,
    DateTime createdAt,
    DateTime updatedAt,
    int? version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPayment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPayment.copyWith.fieldName(...)`
class _$PaymentCWProxyImpl implements _$PaymentCWProxy {
  const _$PaymentCWProxyImpl(this._value);

  final Payment _value;

  @override
  Payment id(String id) => this(id: id);

  @override
  Payment orgId(String orgId) => this(orgId: orgId);

  @override
  Payment siteId(String siteId) => this(siteId: siteId);

  @override
  Payment payerPersonId(String? payerPersonId) =>
      this(payerPersonId: payerPersonId);

  @override
  Payment payerDisplayName(String? payerDisplayName) =>
      this(payerDisplayName: payerDisplayName);

  @override
  Payment unitId(String? unitId) => this(unitId: unitId);

  @override
  Payment debtorKind(PaymentDebtorKindEnum? debtorKind) =>
      this(debtorKind: debtorKind);

  @override
  Payment method(String method) => this(method: method);

  @override
  Payment gross(Money gross) => this(gross: gross);

  @override
  Payment fee(Money fee) => this(fee: fee);

  @override
  Payment net(Money net) => this(net: net);

  @override
  Payment receivedOn(DateTime receivedOn) => this(receivedOn: receivedOn);

  @override
  Payment recordedBy(String? recordedBy) => this(recordedBy: recordedBy);

  @override
  Payment assetAccountId(String assetAccountId) =>
      this(assetAccountId: assetAccountId);

  @override
  Payment reference(String? reference) => this(reference: reference);

  @override
  Payment note(String? note) => this(note: note);

  @override
  Payment status(PaymentStatusEnum status) => this(status: status);

  @override
  Payment receiptNo(String? receiptNo) => this(receiptNo: receiptNo);

  @override
  Payment providerTxnId(String? providerTxnId) =>
      this(providerTxnId: providerTxnId);

  @override
  Payment journalEntryId(String? journalEntryId) =>
      this(journalEntryId: journalEntryId);

  @override
  Payment allocated(Money allocated) => this(allocated: allocated);

  @override
  Payment unallocated(Money unallocated) => this(unallocated: unallocated);

  @override
  Payment allocations(List<PaymentAllocation> allocations) =>
      this(allocations: allocations);

  @override
  Payment bankTransactionId(String? bankTransactionId) =>
      this(bankTransactionId: bankTransactionId);

  @override
  Payment createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Payment updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Payment version(int? version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Payment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Payment(...).copyWith(id: 12, name: "My name")
  /// ````
  Payment call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? payerPersonId = const $CopyWithPlaceholder(),
    Object? payerDisplayName = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? debtorKind = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? gross = const $CopyWithPlaceholder(),
    Object? fee = const $CopyWithPlaceholder(),
    Object? net = const $CopyWithPlaceholder(),
    Object? receivedOn = const $CopyWithPlaceholder(),
    Object? recordedBy = const $CopyWithPlaceholder(),
    Object? assetAccountId = const $CopyWithPlaceholder(),
    Object? reference = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? receiptNo = const $CopyWithPlaceholder(),
    Object? providerTxnId = const $CopyWithPlaceholder(),
    Object? journalEntryId = const $CopyWithPlaceholder(),
    Object? allocated = const $CopyWithPlaceholder(),
    Object? unallocated = const $CopyWithPlaceholder(),
    Object? allocations = const $CopyWithPlaceholder(),
    Object? bankTransactionId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Payment(
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
      payerPersonId: payerPersonId == const $CopyWithPlaceholder()
          ? _value.payerPersonId
          // ignore: cast_nullable_to_non_nullable
          : payerPersonId as String?,
      payerDisplayName: payerDisplayName == const $CopyWithPlaceholder()
          ? _value.payerDisplayName
          // ignore: cast_nullable_to_non_nullable
          : payerDisplayName as String?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
      debtorKind: debtorKind == const $CopyWithPlaceholder()
          ? _value.debtorKind
          // ignore: cast_nullable_to_non_nullable
          : debtorKind as PaymentDebtorKindEnum?,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      gross: gross == const $CopyWithPlaceholder()
          ? _value.gross
          // ignore: cast_nullable_to_non_nullable
          : gross as Money,
      fee: fee == const $CopyWithPlaceholder()
          ? _value.fee
          // ignore: cast_nullable_to_non_nullable
          : fee as Money,
      net: net == const $CopyWithPlaceholder()
          ? _value.net
          // ignore: cast_nullable_to_non_nullable
          : net as Money,
      receivedOn: receivedOn == const $CopyWithPlaceholder()
          ? _value.receivedOn
          // ignore: cast_nullable_to_non_nullable
          : receivedOn as DateTime,
      recordedBy: recordedBy == const $CopyWithPlaceholder()
          ? _value.recordedBy
          // ignore: cast_nullable_to_non_nullable
          : recordedBy as String?,
      assetAccountId: assetAccountId == const $CopyWithPlaceholder()
          ? _value.assetAccountId
          // ignore: cast_nullable_to_non_nullable
          : assetAccountId as String,
      reference: reference == const $CopyWithPlaceholder()
          ? _value.reference
          // ignore: cast_nullable_to_non_nullable
          : reference as String?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PaymentStatusEnum,
      receiptNo: receiptNo == const $CopyWithPlaceholder()
          ? _value.receiptNo
          // ignore: cast_nullable_to_non_nullable
          : receiptNo as String?,
      providerTxnId: providerTxnId == const $CopyWithPlaceholder()
          ? _value.providerTxnId
          // ignore: cast_nullable_to_non_nullable
          : providerTxnId as String?,
      journalEntryId: journalEntryId == const $CopyWithPlaceholder()
          ? _value.journalEntryId
          // ignore: cast_nullable_to_non_nullable
          : journalEntryId as String?,
      allocated: allocated == const $CopyWithPlaceholder()
          ? _value.allocated
          // ignore: cast_nullable_to_non_nullable
          : allocated as Money,
      unallocated: unallocated == const $CopyWithPlaceholder()
          ? _value.unallocated
          // ignore: cast_nullable_to_non_nullable
          : unallocated as Money,
      allocations: allocations == const $CopyWithPlaceholder()
          ? _value.allocations
          // ignore: cast_nullable_to_non_nullable
          : allocations as List<PaymentAllocation>,
      bankTransactionId: bankTransactionId == const $CopyWithPlaceholder()
          ? _value.bankTransactionId
          // ignore: cast_nullable_to_non_nullable
          : bankTransactionId as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int?,
    );
  }
}

extension $PaymentCopyWith on Payment {
  /// Returns a callable class that can be used as follows: `instanceOfPayment.copyWith(...)` or like so:`instanceOfPayment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentCWProxy get copyWith => _$PaymentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Payment',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'payer_person_id',
        'payer_display_name',
        'unit_id',
        'debtor_kind',
        'method',
        'gross',
        'fee',
        'net',
        'received_on',
        'recorded_by',
        'asset_account_id',
        'reference',
        'note',
        'status',
        'receipt_no',
        'provider_txn_id',
        'journal_entry_id',
        'allocated',
        'unallocated',
        'allocations',
        'bank_transaction_id',
        'created_at',
        'updated_at',
      ],
    );
    final val = Payment(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      payerPersonId: $checkedConvert('payer_person_id', (v) => v as String?),
      payerDisplayName: $checkedConvert(
        'payer_display_name',
        (v) => v as String?,
      ),
      unitId: $checkedConvert('unit_id', (v) => v as String?),
      debtorKind: $checkedConvert(
        'debtor_kind',
        (v) => $enumDecodeNullable(
          _$PaymentDebtorKindEnumEnumMap,
          v,
          unknownValue: PaymentDebtorKindEnum.unknownDefaultOpenApi,
        ),
      ),
      method: $checkedConvert('method', (v) => v as String),
      gross: $checkedConvert(
        'gross',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      fee: $checkedConvert(
        'fee',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      net: $checkedConvert(
        'net',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      receivedOn: $checkedConvert(
        'received_on',
        (v) => DateTime.parse(v as String),
      ),
      recordedBy: $checkedConvert('recorded_by', (v) => v as String?),
      assetAccountId: $checkedConvert('asset_account_id', (v) => v as String),
      reference: $checkedConvert('reference', (v) => v as String?),
      note: $checkedConvert('note', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$PaymentStatusEnumEnumMap,
          v,
          unknownValue: PaymentStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      receiptNo: $checkedConvert('receipt_no', (v) => v as String?),
      providerTxnId: $checkedConvert('provider_txn_id', (v) => v as String?),
      journalEntryId: $checkedConvert('journal_entry_id', (v) => v as String?),
      allocated: $checkedConvert(
        'allocated',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      unallocated: $checkedConvert(
        'unallocated',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      allocations: $checkedConvert(
        'allocations',
        (v) => (v as List<dynamic>)
            .map((e) => PaymentAllocation.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      bankTransactionId: $checkedConvert(
        'bank_transaction_id',
        (v) => v as String?,
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'payerPersonId': 'payer_person_id',
    'payerDisplayName': 'payer_display_name',
    'unitId': 'unit_id',
    'debtorKind': 'debtor_kind',
    'receivedOn': 'received_on',
    'recordedBy': 'recorded_by',
    'assetAccountId': 'asset_account_id',
    'receiptNo': 'receipt_no',
    'providerTxnId': 'provider_txn_id',
    'journalEntryId': 'journal_entry_id',
    'bankTransactionId': 'bank_transaction_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'payer_person_id': instance.payerPersonId,
  'payer_display_name': instance.payerDisplayName,
  'unit_id': instance.unitId,
  'debtor_kind': _$PaymentDebtorKindEnumEnumMap[instance.debtorKind],
  'method': instance.method,
  'gross': instance.gross.toJson(),
  'fee': instance.fee.toJson(),
  'net': instance.net.toJson(),
  'received_on': instance.receivedOn.toIso8601String(),
  'recorded_by': instance.recordedBy,
  'asset_account_id': instance.assetAccountId,
  'reference': instance.reference,
  'note': instance.note,
  'status': _$PaymentStatusEnumEnumMap[instance.status]!,
  'receipt_no': instance.receiptNo,
  'provider_txn_id': instance.providerTxnId,
  'journal_entry_id': instance.journalEntryId,
  'allocated': instance.allocated.toJson(),
  'unallocated': instance.unallocated.toJson(),
  'allocations': instance.allocations.map((e) => e.toJson()).toList(),
  'bank_transaction_id': instance.bankTransactionId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': ?instance.version,
};

const _$PaymentDebtorKindEnumEnumMap = {
  PaymentDebtorKindEnum.owner: 'owner',
  PaymentDebtorKindEnum.tenant: 'tenant',
  PaymentDebtorKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$PaymentStatusEnumEnumMap = {
  PaymentStatusEnum.pendingDeclared: 'pending_declared',
  PaymentStatusEnum.confirmed: 'confirmed',
  PaymentStatusEnum.refunded: 'refunded',
  PaymentStatusEnum.voided: 'voided',
  PaymentStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
