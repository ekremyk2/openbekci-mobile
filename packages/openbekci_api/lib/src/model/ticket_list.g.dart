// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketListCWProxy {
  TicketList items(List<Ticket> items);

  TicketList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketList(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketList call({List<Ticket> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketList.copyWith.fieldName(...)`
class _$TicketListCWProxyImpl implements _$TicketListCWProxy {
  const _$TicketListCWProxyImpl(this._value);

  final TicketList _value;

  @override
  TicketList items(List<Ticket> items) => this(items: items);

  @override
  TicketList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketList(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return TicketList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Ticket>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $TicketListCopyWith on TicketList {
  /// Returns a callable class that can be used as follows: `instanceOfTicketList.copyWith(...)` or like so:`instanceOfTicketList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketListCWProxy get copyWith => _$TicketListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketList _$TicketListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TicketList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = TicketList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$TicketListToJson(TicketList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
