// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charge_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChargeListCWProxy {
  ChargeList items(List<Charge> items);

  ChargeList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChargeList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChargeList(...).copyWith(id: 12, name: "My name")
  /// ````
  ChargeList call({List<Charge> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChargeList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChargeList.copyWith.fieldName(...)`
class _$ChargeListCWProxyImpl implements _$ChargeListCWProxy {
  const _$ChargeListCWProxyImpl(this._value);

  final ChargeList _value;

  @override
  ChargeList items(List<Charge> items) => this(items: items);

  @override
  ChargeList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChargeList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChargeList(...).copyWith(id: 12, name: "My name")
  /// ````
  ChargeList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return ChargeList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Charge>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $ChargeListCopyWith on ChargeList {
  /// Returns a callable class that can be used as follows: `instanceOfChargeList.copyWith(...)` or like so:`instanceOfChargeList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChargeListCWProxy get copyWith => _$ChargeListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeList _$ChargeListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChargeList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = ChargeList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Charge.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$ChargeListToJson(ChargeList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
