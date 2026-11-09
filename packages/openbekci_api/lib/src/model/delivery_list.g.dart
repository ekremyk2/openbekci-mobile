// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeliveryListCWProxy {
  DeliveryList items(List<Delivery> items);

  DeliveryList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeliveryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeliveryList(...).copyWith(id: 12, name: "My name")
  /// ````
  DeliveryList call({List<Delivery> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeliveryList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeliveryList.copyWith.fieldName(...)`
class _$DeliveryListCWProxyImpl implements _$DeliveryListCWProxy {
  const _$DeliveryListCWProxyImpl(this._value);

  final DeliveryList _value;

  @override
  DeliveryList items(List<Delivery> items) => this(items: items);

  @override
  DeliveryList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeliveryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeliveryList(...).copyWith(id: 12, name: "My name")
  /// ````
  DeliveryList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return DeliveryList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Delivery>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $DeliveryListCopyWith on DeliveryList {
  /// Returns a callable class that can be used as follows: `instanceOfDeliveryList.copyWith(...)` or like so:`instanceOfDeliveryList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeliveryListCWProxy get copyWith => _$DeliveryListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryList _$DeliveryListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeliveryList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = DeliveryList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Delivery.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$DeliveryListToJson(DeliveryList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
