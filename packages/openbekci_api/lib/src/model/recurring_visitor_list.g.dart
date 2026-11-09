// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_visitor_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RecurringVisitorListCWProxy {
  RecurringVisitorList items(List<RecurringVisitor> items);

  RecurringVisitorList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecurringVisitorList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecurringVisitorList(...).copyWith(id: 12, name: "My name")
  /// ````
  RecurringVisitorList call({List<RecurringVisitor> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRecurringVisitorList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRecurringVisitorList.copyWith.fieldName(...)`
class _$RecurringVisitorListCWProxyImpl
    implements _$RecurringVisitorListCWProxy {
  const _$RecurringVisitorListCWProxyImpl(this._value);

  final RecurringVisitorList _value;

  @override
  RecurringVisitorList items(List<RecurringVisitor> items) =>
      this(items: items);

  @override
  RecurringVisitorList nextCursor(String? nextCursor) =>
      this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecurringVisitorList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecurringVisitorList(...).copyWith(id: 12, name: "My name")
  /// ````
  RecurringVisitorList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return RecurringVisitorList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<RecurringVisitor>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $RecurringVisitorListCopyWith on RecurringVisitorList {
  /// Returns a callable class that can be used as follows: `instanceOfRecurringVisitorList.copyWith(...)` or like so:`instanceOfRecurringVisitorList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RecurringVisitorListCWProxy get copyWith =>
      _$RecurringVisitorListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecurringVisitorList _$RecurringVisitorListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RecurringVisitorList', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
  final val = RecurringVisitorList(
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => RecurringVisitor.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$RecurringVisitorListToJson(
  RecurringVisitorList instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'next_cursor': instance.nextCursor,
};
