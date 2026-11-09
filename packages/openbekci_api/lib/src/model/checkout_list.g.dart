// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckoutListCWProxy {
  CheckoutList items(List<Checkout> items);

  CheckoutList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckoutList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckoutList(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckoutList call({List<Checkout> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCheckoutList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCheckoutList.copyWith.fieldName(...)`
class _$CheckoutListCWProxyImpl implements _$CheckoutListCWProxy {
  const _$CheckoutListCWProxyImpl(this._value);

  final CheckoutList _value;

  @override
  CheckoutList items(List<Checkout> items) => this(items: items);

  @override
  CheckoutList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckoutList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckoutList(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckoutList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return CheckoutList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Checkout>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $CheckoutListCopyWith on CheckoutList {
  /// Returns a callable class that can be used as follows: `instanceOfCheckoutList.copyWith(...)` or like so:`instanceOfCheckoutList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckoutListCWProxy get copyWith => _$CheckoutListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutList _$CheckoutListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CheckoutList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = CheckoutList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Checkout.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$CheckoutListToJson(CheckoutList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
