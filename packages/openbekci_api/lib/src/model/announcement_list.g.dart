// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementListCWProxy {
  AnnouncementList items(List<Announcement> items);

  AnnouncementList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementList(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementList call({List<Announcement> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncementList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncementList.copyWith.fieldName(...)`
class _$AnnouncementListCWProxyImpl implements _$AnnouncementListCWProxy {
  const _$AnnouncementListCWProxyImpl(this._value);

  final AnnouncementList _value;

  @override
  AnnouncementList items(List<Announcement> items) => this(items: items);

  @override
  AnnouncementList nextCursor(String? nextCursor) =>
      this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementList(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return AnnouncementList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Announcement>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $AnnouncementListCopyWith on AnnouncementList {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncementList.copyWith(...)` or like so:`instanceOfAnnouncementList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementListCWProxy get copyWith => _$AnnouncementListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementList _$AnnouncementListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AnnouncementList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = AnnouncementList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Announcement.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$AnnouncementListToJson(AnnouncementList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
