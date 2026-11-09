// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_mutes_set.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationMutesSetCWProxy {
  NotificationMutesSet mutedTypes(List<String> mutedTypes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationMutesSet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationMutesSet(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationMutesSet call({List<String> mutedTypes});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationMutesSet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotificationMutesSet.copyWith.fieldName(...)`
class _$NotificationMutesSetCWProxyImpl
    implements _$NotificationMutesSetCWProxy {
  const _$NotificationMutesSetCWProxyImpl(this._value);

  final NotificationMutesSet _value;

  @override
  NotificationMutesSet mutedTypes(List<String> mutedTypes) =>
      this(mutedTypes: mutedTypes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationMutesSet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationMutesSet(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationMutesSet call({
    Object? mutedTypes = const $CopyWithPlaceholder(),
  }) {
    return NotificationMutesSet(
      mutedTypes: mutedTypes == const $CopyWithPlaceholder()
          ? _value.mutedTypes
          // ignore: cast_nullable_to_non_nullable
          : mutedTypes as List<String>,
    );
  }
}

extension $NotificationMutesSetCopyWith on NotificationMutesSet {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationMutesSet.copyWith(...)` or like so:`instanceOfNotificationMutesSet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationMutesSetCWProxy get copyWith =>
      _$NotificationMutesSetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationMutesSet _$NotificationMutesSetFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('NotificationMutesSet', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['muted_types']);
  final val = NotificationMutesSet(
    mutedTypes: $checkedConvert(
      'muted_types',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'mutedTypes': 'muted_types'});

Map<String, dynamic> _$NotificationMutesSetToJson(
  NotificationMutesSet instance,
) => <String, dynamic>{'muted_types': instance.mutedTypes};
