// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupancy_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OccupancyListCWProxy {
  OccupancyList items(List<Occupancy> items);

  OccupancyList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OccupancyList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OccupancyList(...).copyWith(id: 12, name: "My name")
  /// ````
  OccupancyList call({List<Occupancy> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOccupancyList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOccupancyList.copyWith.fieldName(...)`
class _$OccupancyListCWProxyImpl implements _$OccupancyListCWProxy {
  const _$OccupancyListCWProxyImpl(this._value);

  final OccupancyList _value;

  @override
  OccupancyList items(List<Occupancy> items) => this(items: items);

  @override
  OccupancyList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OccupancyList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OccupancyList(...).copyWith(id: 12, name: "My name")
  /// ````
  OccupancyList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return OccupancyList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Occupancy>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $OccupancyListCopyWith on OccupancyList {
  /// Returns a callable class that can be used as follows: `instanceOfOccupancyList.copyWith(...)` or like so:`instanceOfOccupancyList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OccupancyListCWProxy get copyWith => _$OccupancyListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccupancyList _$OccupancyListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OccupancyList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = OccupancyList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Occupancy.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$OccupancyListToJson(OccupancyList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
