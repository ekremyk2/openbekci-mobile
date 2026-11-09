// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_item_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AgendaItemListCWProxy {
  AgendaItemList items(List<AgendaItem> items);

  AgendaItemList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgendaItemList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgendaItemList(...).copyWith(id: 12, name: "My name")
  /// ````
  AgendaItemList call({List<AgendaItem> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAgendaItemList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAgendaItemList.copyWith.fieldName(...)`
class _$AgendaItemListCWProxyImpl implements _$AgendaItemListCWProxy {
  const _$AgendaItemListCWProxyImpl(this._value);

  final AgendaItemList _value;

  @override
  AgendaItemList items(List<AgendaItem> items) => this(items: items);

  @override
  AgendaItemList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgendaItemList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgendaItemList(...).copyWith(id: 12, name: "My name")
  /// ````
  AgendaItemList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return AgendaItemList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<AgendaItem>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $AgendaItemListCopyWith on AgendaItemList {
  /// Returns a callable class that can be used as follows: `instanceOfAgendaItemList.copyWith(...)` or like so:`instanceOfAgendaItemList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AgendaItemListCWProxy get copyWith => _$AgendaItemListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaItemList _$AgendaItemListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AgendaItemList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = AgendaItemList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => AgendaItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$AgendaItemListToJson(AgendaItemList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
