// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_allocation.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentAllocationCWProxy {
  PaymentAllocation chargeId(String chargeId);

  PaymentAllocation chargeDescription(String? chargeDescription);

  PaymentAllocation amount(Money amount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentAllocation call({
    String chargeId,
    String? chargeDescription,
    Money amount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentAllocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentAllocation.copyWith.fieldName(...)`
class _$PaymentAllocationCWProxyImpl implements _$PaymentAllocationCWProxy {
  const _$PaymentAllocationCWProxyImpl(this._value);

  final PaymentAllocation _value;

  @override
  PaymentAllocation chargeId(String chargeId) => this(chargeId: chargeId);

  @override
  PaymentAllocation chargeDescription(String? chargeDescription) =>
      this(chargeDescription: chargeDescription);

  @override
  PaymentAllocation amount(Money amount) => this(amount: amount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentAllocation call({
    Object? chargeId = const $CopyWithPlaceholder(),
    Object? chargeDescription = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
  }) {
    return PaymentAllocation(
      chargeId: chargeId == const $CopyWithPlaceholder()
          ? _value.chargeId
          // ignore: cast_nullable_to_non_nullable
          : chargeId as String,
      chargeDescription: chargeDescription == const $CopyWithPlaceholder()
          ? _value.chargeDescription
          // ignore: cast_nullable_to_non_nullable
          : chargeDescription as String?,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as Money,
    );
  }
}

extension $PaymentAllocationCopyWith on PaymentAllocation {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentAllocation.copyWith(...)` or like so:`instanceOfPaymentAllocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentAllocationCWProxy get copyWith =>
      _$PaymentAllocationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAllocation _$PaymentAllocationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PaymentAllocation',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['charge_id', 'charge_description', 'amount'],
        );
        final val = PaymentAllocation(
          chargeId: $checkedConvert('charge_id', (v) => v as String),
          chargeDescription: $checkedConvert(
            'charge_description',
            (v) => v as String?,
          ),
          amount: $checkedConvert(
            'amount',
            (v) => Money.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'chargeId': 'charge_id',
        'chargeDescription': 'charge_description',
      },
    );

Map<String, dynamic> _$PaymentAllocationToJson(PaymentAllocation instance) =>
    <String, dynamic>{
      'charge_id': instance.chargeId,
      'charge_description': instance.chargeDescription,
      'amount': instance.amount.toJson(),
    };
