// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeetingListCWProxy {
  MeetingList items(List<Meeting> items);

  MeetingList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeetingList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeetingList(...).copyWith(id: 12, name: "My name")
  /// ````
  MeetingList call({List<Meeting> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeetingList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeetingList.copyWith.fieldName(...)`
class _$MeetingListCWProxyImpl implements _$MeetingListCWProxy {
  const _$MeetingListCWProxyImpl(this._value);

  final MeetingList _value;

  @override
  MeetingList items(List<Meeting> items) => this(items: items);

  @override
  MeetingList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeetingList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeetingList(...).copyWith(id: 12, name: "My name")
  /// ````
  MeetingList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return MeetingList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Meeting>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $MeetingListCopyWith on MeetingList {
  /// Returns a callable class that can be used as follows: `instanceOfMeetingList.copyWith(...)` or like so:`instanceOfMeetingList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeetingListCWProxy get copyWith => _$MeetingListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingList _$MeetingListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MeetingList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = MeetingList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Meeting.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$MeetingListToJson(MeetingList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
