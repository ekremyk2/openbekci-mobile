// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NotificationCWProxy {
  Notification id(String id);

  Notification siteId(String? siteId);

  Notification type(String type);

  Notification payload(Map<String, Object> payload);

  Notification readAt(DateTime? readAt);

  Notification link(String? link);

  Notification createdAt(DateTime createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Notification(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Notification(...).copyWith(id: 12, name: "My name")
  /// ````
  Notification call({
    String id,
    String? siteId,
    String type,
    Map<String, Object> payload,
    DateTime? readAt,
    String? link,
    DateTime createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNotification.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNotification.copyWith.fieldName(...)`
class _$NotificationCWProxyImpl implements _$NotificationCWProxy {
  const _$NotificationCWProxyImpl(this._value);

  final Notification _value;

  @override
  Notification id(String id) => this(id: id);

  @override
  Notification siteId(String? siteId) => this(siteId: siteId);

  @override
  Notification type(String type) => this(type: type);

  @override
  Notification payload(Map<String, Object> payload) => this(payload: payload);

  @override
  Notification readAt(DateTime? readAt) => this(readAt: readAt);

  @override
  Notification link(String? link) => this(link: link);

  @override
  Notification createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Notification(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Notification(...).copyWith(id: 12, name: "My name")
  /// ````
  Notification call({
    Object? id = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? payload = const $CopyWithPlaceholder(),
    Object? readAt = const $CopyWithPlaceholder(),
    Object? link = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return Notification(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      payload: payload == const $CopyWithPlaceholder()
          ? _value.payload
          // ignore: cast_nullable_to_non_nullable
          : payload as Map<String, Object>,
      readAt: readAt == const $CopyWithPlaceholder()
          ? _value.readAt
          // ignore: cast_nullable_to_non_nullable
          : readAt as DateTime?,
      link: link == const $CopyWithPlaceholder()
          ? _value.link
          // ignore: cast_nullable_to_non_nullable
          : link as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $NotificationCopyWith on Notification {
  /// Returns a callable class that can be used as follows: `instanceOfNotification.copyWith(...)` or like so:`instanceOfNotification.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NotificationCWProxy get copyWith => _$NotificationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'Notification',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'site_id',
            'type',
            'payload',
            'read_at',
            'link',
            'created_at',
          ],
        );
        final val = Notification(
          id: $checkedConvert('id', (v) => v as String),
          siteId: $checkedConvert('site_id', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String),
          payload: $checkedConvert(
            'payload',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            ),
          ),
          readAt: $checkedConvert(
            'read_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          link: $checkedConvert('link', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'siteId': 'site_id',
        'readAt': 'read_at',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'site_id': instance.siteId,
      'type': instance.type,
      'payload': instance.payload,
      'read_at': instance.readAt?.toIso8601String(),
      'link': instance.link,
      'created_at': instance.createdAt.toIso8601String(),
    };
