// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InvitationListCWProxy {
  InvitationList items(List<Invitation> items);

  InvitationList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvitationList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvitationList(...).copyWith(id: 12, name: "My name")
  /// ````
  InvitationList call({List<Invitation> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInvitationList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInvitationList.copyWith.fieldName(...)`
class _$InvitationListCWProxyImpl implements _$InvitationListCWProxy {
  const _$InvitationListCWProxyImpl(this._value);

  final InvitationList _value;

  @override
  InvitationList items(List<Invitation> items) => this(items: items);

  @override
  InvitationList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvitationList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvitationList(...).copyWith(id: 12, name: "My name")
  /// ````
  InvitationList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return InvitationList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Invitation>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $InvitationListCopyWith on InvitationList {
  /// Returns a callable class that can be used as follows: `instanceOfInvitationList.copyWith(...)` or like so:`instanceOfInvitationList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InvitationListCWProxy get copyWith => _$InvitationListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationList _$InvitationListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InvitationList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = InvitationList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Invitation.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$InvitationListToJson(InvitationList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
