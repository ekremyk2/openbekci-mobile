// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_comment_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCommentListCWProxy {
  TicketCommentList items(List<TicketComment> items);

  TicketCommentList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCommentList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCommentList(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCommentList call({List<TicketComment> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketCommentList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketCommentList.copyWith.fieldName(...)`
class _$TicketCommentListCWProxyImpl implements _$TicketCommentListCWProxy {
  const _$TicketCommentListCWProxyImpl(this._value);

  final TicketCommentList _value;

  @override
  TicketCommentList items(List<TicketComment> items) => this(items: items);

  @override
  TicketCommentList nextCursor(String? nextCursor) =>
      this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCommentList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCommentList(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCommentList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return TicketCommentList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<TicketComment>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $TicketCommentListCopyWith on TicketCommentList {
  /// Returns a callable class that can be used as follows: `instanceOfTicketCommentList.copyWith(...)` or like so:`instanceOfTicketCommentList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCommentListCWProxy get copyWith =>
      _$TicketCommentListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCommentList _$TicketCommentListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TicketCommentList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = TicketCommentList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => TicketComment.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$TicketCommentListToJson(TicketCommentList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
