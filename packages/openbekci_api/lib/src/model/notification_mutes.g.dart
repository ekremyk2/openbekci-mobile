// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_mutes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationMutesCWProxy {
  NotificationMutes mutedTypes(List<String> mutedTypes);

  NotificationMutes unmutableTypes(List<String> unmutableTypes);

  NotificationMutes availableTypes(List<String> availableTypes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationMutes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationMutes(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationMutes call({
    List<String> mutedTypes,
    List<String> unmutableTypes,
    List<String> availableTypes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotificationMutes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotificationMutes.copyWith.fieldName(...)`
class _$NotificationMutesCWProxyImpl implements _$NotificationMutesCWProxy {
  const _$NotificationMutesCWProxyImpl(this._value);

  final NotificationMutes _value;

  @override
  NotificationMutes mutedTypes(List<String> mutedTypes) =>
      this(mutedTypes: mutedTypes);

  @override
  NotificationMutes unmutableTypes(List<String> unmutableTypes) =>
      this(unmutableTypes: unmutableTypes);

  @override
  NotificationMutes availableTypes(List<String> availableTypes) =>
      this(availableTypes: availableTypes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NotificationMutes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NotificationMutes(...).copyWith(id: 12, name: "My name")
  /// ````
  NotificationMutes call({
    Object? mutedTypes = const $CopyWithPlaceholder(),
    Object? unmutableTypes = const $CopyWithPlaceholder(),
    Object? availableTypes = const $CopyWithPlaceholder(),
  }) {
    return NotificationMutes(
      mutedTypes: mutedTypes == const $CopyWithPlaceholder()
          ? _value.mutedTypes
          // ignore: cast_nullable_to_non_nullable
          : mutedTypes as List<String>,
      unmutableTypes: unmutableTypes == const $CopyWithPlaceholder()
          ? _value.unmutableTypes
          // ignore: cast_nullable_to_non_nullable
          : unmutableTypes as List<String>,
      availableTypes: availableTypes == const $CopyWithPlaceholder()
          ? _value.availableTypes
          // ignore: cast_nullable_to_non_nullable
          : availableTypes as List<String>,
    );
  }
}

extension $NotificationMutesCopyWith on NotificationMutes {
  /// Returns a callable class that can be used as follows: `instanceOfNotificationMutes.copyWith(...)` or like so:`instanceOfNotificationMutes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationMutesCWProxy get copyWith =>
      _$NotificationMutesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationMutes _$NotificationMutesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NotificationMutes',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'muted_types',
            'unmutable_types',
            'available_types',
          ],
        );
        final val = NotificationMutes(
          mutedTypes: $checkedConvert(
            'muted_types',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          unmutableTypes: $checkedConvert(
            'unmutable_types',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          availableTypes: $checkedConvert(
            'available_types',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'mutedTypes': 'muted_types',
        'unmutableTypes': 'unmutable_types',
        'availableTypes': 'available_types',
      },
    );

Map<String, dynamic> _$NotificationMutesToJson(NotificationMutes instance) =>
    <String, dynamic>{
      'muted_types': instance.mutedTypes,
      'unmutable_types': instance.unmutableTypes,
      'available_types': instance.availableTypes,
    };
