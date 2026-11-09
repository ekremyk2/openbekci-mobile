// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_approval_request_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorApprovalRequestListCWProxy {
  VisitorApprovalRequestList items(List<VisitorApprovalRequest> items);

  VisitorApprovalRequestList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorApprovalRequestList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorApprovalRequestList(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorApprovalRequestList call({
    List<VisitorApprovalRequest> items,
    String? nextCursor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorApprovalRequestList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVisitorApprovalRequestList.copyWith.fieldName(...)`
class _$VisitorApprovalRequestListCWProxyImpl
    implements _$VisitorApprovalRequestListCWProxy {
  const _$VisitorApprovalRequestListCWProxyImpl(this._value);

  final VisitorApprovalRequestList _value;

  @override
  VisitorApprovalRequestList items(List<VisitorApprovalRequest> items) =>
      this(items: items);

  @override
  VisitorApprovalRequestList nextCursor(String? nextCursor) =>
      this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorApprovalRequestList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorApprovalRequestList(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorApprovalRequestList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return VisitorApprovalRequestList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<VisitorApprovalRequest>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $VisitorApprovalRequestListCopyWith on VisitorApprovalRequestList {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorApprovalRequestList.copyWith(...)` or like so:`instanceOfVisitorApprovalRequestList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorApprovalRequestListCWProxy get copyWith =>
      _$VisitorApprovalRequestListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorApprovalRequestList _$VisitorApprovalRequestListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VisitorApprovalRequestList',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
    final val = VisitorApprovalRequestList(
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map(
              (e) => VisitorApprovalRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'nextCursor': 'next_cursor'},
);

Map<String, dynamic> _$VisitorApprovalRequestListToJson(
  VisitorApprovalRequestList instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'next_cursor': instance.nextCursor,
};
