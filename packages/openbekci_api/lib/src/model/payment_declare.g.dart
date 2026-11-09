// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_declare.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentDeclareCWProxy {
  PaymentDeclare siteId(String siteId);

  PaymentDeclare amount(Money amount);

  PaymentDeclare paidOn(String paidOn);

  PaymentDeclare reference(String? reference);

  PaymentDeclare note(String? note);

  PaymentDeclare debtor(DebtorRef debtor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentDeclare(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentDeclare(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentDeclare call({
    String siteId,
    Money amount,
    String paidOn,
    String? reference,
    String? note,
    DebtorRef debtor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentDeclare.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentDeclare.copyWith.fieldName(...)`
class _$PaymentDeclareCWProxyImpl implements _$PaymentDeclareCWProxy {
  const _$PaymentDeclareCWProxyImpl(this._value);

  final PaymentDeclare _value;

  @override
  PaymentDeclare siteId(String siteId) => this(siteId: siteId);

  @override
  PaymentDeclare amount(Money amount) => this(amount: amount);

  @override
  PaymentDeclare paidOn(String paidOn) => this(paidOn: paidOn);

  @override
  PaymentDeclare reference(String? reference) => this(reference: reference);

  @override
  PaymentDeclare note(String? note) => this(note: note);

  @override
  PaymentDeclare debtor(DebtorRef debtor) => this(debtor: debtor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentDeclare(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentDeclare(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentDeclare call({
    Object? siteId = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? paidOn = const $CopyWithPlaceholder(),
    Object? reference = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? debtor = const $CopyWithPlaceholder(),
  }) {
    return PaymentDeclare(
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as Money,
      paidOn: paidOn == const $CopyWithPlaceholder()
          ? _value.paidOn
          // ignore: cast_nullable_to_non_nullable
          : paidOn as String,
      reference: reference == const $CopyWithPlaceholder()
          ? _value.reference
          // ignore: cast_nullable_to_non_nullable
          : reference as String?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      debtor: debtor == const $CopyWithPlaceholder()
          ? _value.debtor
          // ignore: cast_nullable_to_non_nullable
          : debtor as DebtorRef,
    );
  }
}

extension $PaymentDeclareCopyWith on PaymentDeclare {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentDeclare.copyWith(...)` or like so:`instanceOfPaymentDeclare.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentDeclareCWProxy get copyWith => _$PaymentDeclareCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDeclare _$PaymentDeclareFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaymentDeclare', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['site_id', 'amount', 'paid_on', 'debtor'],
      );
      final val = PaymentDeclare(
        siteId: $checkedConvert('site_id', (v) => v as String),
        amount: $checkedConvert(
          'amount',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        paidOn: $checkedConvert('paid_on', (v) => v as String),
        reference: $checkedConvert('reference', (v) => v as String?),
        note: $checkedConvert('note', (v) => v as String?),
        debtor: $checkedConvert(
          'debtor',
          (v) => DebtorRef.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'siteId': 'site_id', 'paidOn': 'paid_on'});

Map<String, dynamic> _$PaymentDeclareToJson(PaymentDeclare instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'amount': instance.amount.toJson(),
      'paid_on': instance.paidOn,
      'reference': ?instance.reference,
      'note': ?instance.note,
      'debtor': instance.debtor.toJson(),
    };
