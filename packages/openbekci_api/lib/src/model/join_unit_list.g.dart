// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_unit_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinUnitListCWProxy {
  JoinUnitList items(List<JoinUnit> items);

  JoinUnitList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinUnitList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinUnitList(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinUnitList call({List<JoinUnit> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinUnitList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJoinUnitList.copyWith.fieldName(...)`
class _$JoinUnitListCWProxyImpl implements _$JoinUnitListCWProxy {
  const _$JoinUnitListCWProxyImpl(this._value);

  final JoinUnitList _value;

  @override
  JoinUnitList items(List<JoinUnit> items) => this(items: items);

  @override
  JoinUnitList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinUnitList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinUnitList(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinUnitList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return JoinUnitList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<JoinUnit>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $JoinUnitListCopyWith on JoinUnitList {
  /// Returns a callable class that can be used as follows: `instanceOfJoinUnitList.copyWith(...)` or like so:`instanceOfJoinUnitList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinUnitListCWProxy get copyWith => _$JoinUnitListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinUnitList _$JoinUnitListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('JoinUnitList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = JoinUnitList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => JoinUnit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$JoinUnitListToJson(JoinUnitList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
