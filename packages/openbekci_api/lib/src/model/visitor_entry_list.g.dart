// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_entry_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorEntryListCWProxy {
  VisitorEntryList items(List<VisitorEntry> items);

  VisitorEntryList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorEntryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorEntryList(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorEntryList call({List<VisitorEntry> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorEntryList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVisitorEntryList.copyWith.fieldName(...)`
class _$VisitorEntryListCWProxyImpl implements _$VisitorEntryListCWProxy {
  const _$VisitorEntryListCWProxyImpl(this._value);

  final VisitorEntryList _value;

  @override
  VisitorEntryList items(List<VisitorEntry> items) => this(items: items);

  @override
  VisitorEntryList nextCursor(String? nextCursor) =>
      this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorEntryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorEntryList(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorEntryList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return VisitorEntryList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<VisitorEntry>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $VisitorEntryListCopyWith on VisitorEntryList {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorEntryList.copyWith(...)` or like so:`instanceOfVisitorEntryList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorEntryListCWProxy get copyWith => _$VisitorEntryListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorEntryList _$VisitorEntryListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VisitorEntryList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = VisitorEntryList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => VisitorEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$VisitorEntryListToJson(VisitorEntryList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
