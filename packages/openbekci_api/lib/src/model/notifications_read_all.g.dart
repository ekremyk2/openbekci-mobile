// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_read_all.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationsReadAllCWProxy {
  NotificationsReadAll siteId(String? siteId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationsReadAll(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationsReadAll(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationsReadAll call({String? siteId});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationsReadAll.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotificationsReadAll.copyWith.fieldName(...)`
class _$NotificationsReadAllCWProxyImpl
    implements _$NotificationsReadAllCWProxy {
  const _$NotificationsReadAllCWProxyImpl(this._value);

  final NotificationsReadAll _value;

  @override
  NotificationsReadAll siteId(String? siteId) => this(siteId: siteId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationsReadAll(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationsReadAll(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationsReadAll call({Object? siteId = const $CopyWithPlaceholder()}) {
    return NotificationsReadAll(
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String?,
    );
  }
}

extension $NotificationsReadAllCopyWith on NotificationsReadAll {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationsReadAll.copyWith(...)` or like so:`instanceOfNotificationsReadAll.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationsReadAllCWProxy get copyWith =>
      _$NotificationsReadAllCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsReadAll _$NotificationsReadAllFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('NotificationsReadAll', json, ($checkedConvert) {
  final val = NotificationsReadAll(
    siteId: $checkedConvert('site_id', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'siteId': 'site_id'});

Map<String, dynamic> _$NotificationsReadAllToJson(
  NotificationsReadAll instance,
) => <String, dynamic>{'site_id': ?instance.siteId};
