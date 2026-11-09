// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_meeting.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardMeetingCWProxy {
  DashboardMeeting id(String id);

  DashboardMeeting title(String? title);

  DashboardMeeting scheduledAt(DateTime scheduledAt);

  DashboardMeeting status(String status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardMeeting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardMeeting(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardMeeting call({
    String id,
    String? title,
    DateTime scheduledAt,
    String status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardMeeting.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardMeeting.copyWith.fieldName(...)`
class _$DashboardMeetingCWProxyImpl implements _$DashboardMeetingCWProxy {
  const _$DashboardMeetingCWProxyImpl(this._value);

  final DashboardMeeting _value;

  @override
  DashboardMeeting id(String id) => this(id: id);

  @override
  DashboardMeeting title(String? title) => this(title: title);

  @override
  DashboardMeeting scheduledAt(DateTime scheduledAt) =>
      this(scheduledAt: scheduledAt);

  @override
  DashboardMeeting status(String status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardMeeting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardMeeting(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardMeeting call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? scheduledAt = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return DashboardMeeting(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      scheduledAt: scheduledAt == const $CopyWithPlaceholder()
          ? _value.scheduledAt
          // ignore: cast_nullable_to_non_nullable
          : scheduledAt as DateTime,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
    );
  }
}

extension $DashboardMeetingCopyWith on DashboardMeeting {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardMeeting.copyWith(...)` or like so:`instanceOfDashboardMeeting.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardMeetingCWProxy get copyWith => _$DashboardMeetingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardMeeting _$DashboardMeetingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DashboardMeeting', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['id', 'title', 'scheduled_at', 'status'],
      );
      final val = DashboardMeeting(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String?),
        scheduledAt: $checkedConvert(
          'scheduled_at',
          (v) => DateTime.parse(v as String),
        ),
        status: $checkedConvert('status', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'scheduledAt': 'scheduled_at'});

Map<String, dynamic> _$DashboardMeetingToJson(DashboardMeeting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'status': instance.status,
    };
