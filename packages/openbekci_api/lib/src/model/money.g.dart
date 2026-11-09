// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MoneyCWProxy {
  Money amount(int amount);

  Money currency(String currency);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Money(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Money(...).copyWith(id: 12, name: "My name")
  /// ````
  Money call({int amount, String currency});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMoney.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMoney.copyWith.fieldName(...)`
class _$MoneyCWProxyImpl implements _$MoneyCWProxy {
  const _$MoneyCWProxyImpl(this._value);

  final Money _value;

  @override
  Money amount(int amount) => this(amount: amount);

  @override
  Money currency(String currency) => this(currency: currency);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Money(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Money(...).copyWith(id: 12, name: "My name")
  /// ````
  Money call({
    Object? amount = const $CopyWithPlaceholder(),
    Object? currency = const $CopyWithPlaceholder(),
  }) {
    return Money(
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as int,
      currency: currency == const $CopyWithPlaceholder()
          ? _value.currency
          // ignore: cast_nullable_to_non_nullable
          : currency as String,
    );
  }
}

extension $MoneyCopyWith on Money {
  /// Returns a callable class that can be used as follows: `instanceOfMoney.copyWith(...)` or like so:`instanceOfMoney.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MoneyCWProxy get copyWith => _$MoneyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Money _$MoneyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Money', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['amount', 'currency']);
      final val = Money(
        amount: $checkedConvert('amount', (v) => (v as num).toInt()),
        currency: $checkedConvert('currency', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MoneyToJson(Money instance) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
};
