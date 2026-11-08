// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PushInfoCWProxy {
  PushInfo relayIds(List<String> relayIds);

  PushInfo unifiedPush(bool unifiedPush);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PushInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PushInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  PushInfo call({List<String> relayIds, bool unifiedPush});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPushInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPushInfo.copyWith.fieldName(...)`
class _$PushInfoCWProxyImpl implements _$PushInfoCWProxy {
  const _$PushInfoCWProxyImpl(this._value);

  final PushInfo _value;

  @override
  PushInfo relayIds(List<String> relayIds) => this(relayIds: relayIds);

  @override
  PushInfo unifiedPush(bool unifiedPush) => this(unifiedPush: unifiedPush);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PushInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PushInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  PushInfo call({
    Object? relayIds = const $CopyWithPlaceholder(),
    Object? unifiedPush = const $CopyWithPlaceholder(),
  }) {
    return PushInfo(
      relayIds: relayIds == const $CopyWithPlaceholder()
          ? _value.relayIds
          // ignore: cast_nullable_to_non_nullable
          : relayIds as List<String>,
      unifiedPush: unifiedPush == const $CopyWithPlaceholder()
          ? _value.unifiedPush
          // ignore: cast_nullable_to_non_nullable
          : unifiedPush as bool,
    );
  }
}

extension $PushInfoCopyWith on PushInfo {
  /// Returns a callable class that can be used as follows: `instanceOfPushInfo.copyWith(...)` or like so:`instanceOfPushInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PushInfoCWProxy get copyWith => _$PushInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushInfo _$PushInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PushInfo',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['relay_ids', 'unified_push']);
    final val = PushInfo(
      relayIds: $checkedConvert(
        'relay_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      unifiedPush: $checkedConvert('unified_push', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {'relayIds': 'relay_ids', 'unifiedPush': 'unified_push'},
);

Map<String, dynamic> _$PushInfoToJson(PushInfo instance) => <String, dynamic>{
  'relay_ids': instance.relayIds,
  'unified_push': instance.unifiedPush,
};
