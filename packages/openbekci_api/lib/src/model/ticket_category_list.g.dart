// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_category_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCategoryListCWProxy {
  TicketCategoryList items(List<TicketCategory> items);

  TicketCategoryList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCategoryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCategoryList(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCategoryList call({List<TicketCategory> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketCategoryList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketCategoryList.copyWith.fieldName(...)`
class _$TicketCategoryListCWProxyImpl implements _$TicketCategoryListCWProxy {
  const _$TicketCategoryListCWProxyImpl(this._value);

  final TicketCategoryList _value;

  @override
  TicketCategoryList items(List<TicketCategory> items) => this(items: items);

  @override
  TicketCategoryList nextCursor(String? nextCursor) =>
      this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCategoryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCategoryList(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCategoryList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return TicketCategoryList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<TicketCategory>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $TicketCategoryListCopyWith on TicketCategoryList {
  /// Returns a callable class that can be used as follows: `instanceOfTicketCategoryList.copyWith(...)` or like so:`instanceOfTicketCategoryList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCategoryListCWProxy get copyWith =>
      _$TicketCategoryListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCategoryList _$TicketCategoryListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TicketCategoryList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = TicketCategoryList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => TicketCategory.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$TicketCategoryListToJson(TicketCategoryList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
