// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentListCWProxy {
  PaymentList items(List<Payment> items);

  PaymentList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentList call({List<Payment> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentList.copyWith.fieldName(...)`
class _$PaymentListCWProxyImpl implements _$PaymentListCWProxy {
  const _$PaymentListCWProxyImpl(this._value);

  final PaymentList _value;

  @override
  PaymentList items(List<Payment> items) => this(items: items);

  @override
  PaymentList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return PaymentList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Payment>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $PaymentListCopyWith on PaymentList {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentList.copyWith(...)` or like so:`instanceOfPaymentList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentListCWProxy get copyWith => _$PaymentListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentList _$PaymentListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaymentList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = PaymentList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Payment.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$PaymentListToJson(PaymentList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
