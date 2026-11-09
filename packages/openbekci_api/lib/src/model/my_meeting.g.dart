// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_meeting.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MyMeetingCWProxy {
  MyMeeting meeting(Meeting meeting);

  MyMeeting eligibleUnitIds(List<String> eligibleUnitIds);

  MyMeeting notice(MeetingNotice? notice);

  MyMeeting attendanceToken(String? attendanceToken);

  MyMeeting attendanceQr(String? attendanceQr);

  MyMeeting checkedIn(bool checkedIn);

  MyMeeting polls(List<MyPoll> polls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyMeeting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyMeeting(...).copyWith(id: 12, name: "My name")
  /// ````
  MyMeeting call({
    Meeting meeting,
    List<String> eligibleUnitIds,
    MeetingNotice? notice,
    String? attendanceToken,
    String? attendanceQr,
    bool checkedIn,
    List<MyPoll> polls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMyMeeting.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMyMeeting.copyWith.fieldName(...)`
class _$MyMeetingCWProxyImpl implements _$MyMeetingCWProxy {
  const _$MyMeetingCWProxyImpl(this._value);

  final MyMeeting _value;

  @override
  MyMeeting meeting(Meeting meeting) => this(meeting: meeting);

  @override
  MyMeeting eligibleUnitIds(List<String> eligibleUnitIds) =>
      this(eligibleUnitIds: eligibleUnitIds);

  @override
  MyMeeting notice(MeetingNotice? notice) => this(notice: notice);

  @override
  MyMeeting attendanceToken(String? attendanceToken) =>
      this(attendanceToken: attendanceToken);

  @override
  MyMeeting attendanceQr(String? attendanceQr) =>
      this(attendanceQr: attendanceQr);

  @override
  MyMeeting checkedIn(bool checkedIn) => this(checkedIn: checkedIn);

  @override
  MyMeeting polls(List<MyPoll> polls) => this(polls: polls);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyMeeting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyMeeting(...).copyWith(id: 12, name: "My name")
  /// ````
  MyMeeting call({
    Object? meeting = const $CopyWithPlaceholder(),
    Object? eligibleUnitIds = const $CopyWithPlaceholder(),
    Object? notice = const $CopyWithPlaceholder(),
    Object? attendanceToken = const $CopyWithPlaceholder(),
    Object? attendanceQr = const $CopyWithPlaceholder(),
    Object? checkedIn = const $CopyWithPlaceholder(),
    Object? polls = const $CopyWithPlaceholder(),
  }) {
    return MyMeeting(
      meeting: meeting == const $CopyWithPlaceholder()
          ? _value.meeting
          // ignore: cast_nullable_to_non_nullable
          : meeting as Meeting,
      eligibleUnitIds: eligibleUnitIds == const $CopyWithPlaceholder()
          ? _value.eligibleUnitIds
          // ignore: cast_nullable_to_non_nullable
          : eligibleUnitIds as List<String>,
      notice: notice == const $CopyWithPlaceholder()
          ? _value.notice
          // ignore: cast_nullable_to_non_nullable
          : notice as MeetingNotice?,
      attendanceToken: attendanceToken == const $CopyWithPlaceholder()
          ? _value.attendanceToken
          // ignore: cast_nullable_to_non_nullable
          : attendanceToken as String?,
      attendanceQr: attendanceQr == const $CopyWithPlaceholder()
          ? _value.attendanceQr
          // ignore: cast_nullable_to_non_nullable
          : attendanceQr as String?,
      checkedIn: checkedIn == const $CopyWithPlaceholder()
          ? _value.checkedIn
          // ignore: cast_nullable_to_non_nullable
          : checkedIn as bool,
      polls: polls == const $CopyWithPlaceholder()
          ? _value.polls
          // ignore: cast_nullable_to_non_nullable
          : polls as List<MyPoll>,
    );
  }
}

extension $MyMeetingCopyWith on MyMeeting {
  /// Returns a callable class that can be used as follows: `instanceOfMyMeeting.copyWith(...)` or like so:`instanceOfMyMeeting.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MyMeetingCWProxy get copyWith => _$MyMeetingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyMeeting _$MyMeetingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MyMeeting',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'meeting',
        'eligible_unit_ids',
        'notice',
        'attendance_token',
        'attendance_qr',
        'checked_in',
        'polls',
      ],
    );
    final val = MyMeeting(
      meeting: $checkedConvert(
        'meeting',
        (v) => Meeting.fromJson(v as Map<String, dynamic>),
      ),
      eligibleUnitIds: $checkedConvert(
        'eligible_unit_ids',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      notice: $checkedConvert(
        'notice',
        (v) => v == null
            ? null
            : MeetingNotice.fromJson(v as Map<String, dynamic>),
      ),
      attendanceToken: $checkedConvert('attendance_token', (v) => v as String?),
      attendanceQr: $checkedConvert('attendance_qr', (v) => v as String?),
      checkedIn: $checkedConvert('checked_in', (v) => v as bool),
      polls: $checkedConvert(
        'polls',
        (v) => (v as List<dynamic>)
            .map((e) => MyPoll.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'eligibleUnitIds': 'eligible_unit_ids',
    'attendanceToken': 'attendance_token',
    'attendanceQr': 'attendance_qr',
    'checkedIn': 'checked_in',
  },
);

Map<String, dynamic> _$MyMeetingToJson(MyMeeting instance) => <String, dynamic>{
  'meeting': instance.meeting.toJson(),
  'eligible_unit_ids': instance.eligibleUnitIds,
  'notice': instance.notice?.toJson(),
  'attendance_token': instance.attendanceToken,
  'attendance_qr': instance.attendanceQr,
  'checked_in': instance.checkedIn,
  'polls': instance.polls.map((e) => e.toJson()).toList(),
};
