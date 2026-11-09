// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingListCWProxy {
  BookingList items(List<Booking> items);

  BookingList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingList(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingList call({List<Booking> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBookingList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBookingList.copyWith.fieldName(...)`
class _$BookingListCWProxyImpl implements _$BookingListCWProxy {
  const _$BookingListCWProxyImpl(this._value);

  final BookingList _value;

  @override
  BookingList items(List<Booking> items) => this(items: items);

  @override
  BookingList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingList(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return BookingList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Booking>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $BookingListCopyWith on BookingList {
  /// Returns a callable class that can be used as follows: `instanceOfBookingList.copyWith(...)` or like so:`instanceOfBookingList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingListCWProxy get copyWith => _$BookingListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingList _$BookingListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BookingList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = BookingList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Booking.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$BookingListToJson(BookingList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
