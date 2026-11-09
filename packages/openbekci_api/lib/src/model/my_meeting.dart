//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/meeting.dart';
import 'package:openbekci_api/src/model/meeting_notice.dart';
import 'package:openbekci_api/src/model/my_poll.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_meeting.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MyMeeting {
  /// Returns a new [MyMeeting] instance.
  MyMeeting({

    required  this.meeting,

    required  this.eligibleUnitIds,

    required  this.notice,

    required  this.attendanceToken,

    required  this.attendanceQr,

    required  this.checkedIn,

    required  this.polls,
  });

  @JsonKey(
    
    name: r'meeting',
    required: true,
    includeIfNull: false,
  )


  final Meeting meeting;



  @JsonKey(
    
    name: r'eligible_unit_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> eligibleUnitIds;



  @JsonKey(
    
    name: r'notice',
    required: true,
    includeIfNull: true,
  )


  final MeetingNotice? notice;



      /// The per-person check-in token; the QR encodes `attendance_qr`.
  @JsonKey(
    
    name: r'attendance_token',
    required: true,
    includeIfNull: true,
  )


  final String? attendanceToken;



  @JsonKey(
    
    name: r'attendance_qr',
    required: true,
    includeIfNull: true,
  )


  final String? attendanceQr;



  @JsonKey(
    
    name: r'checked_in',
    required: true,
    includeIfNull: false,
  )


  final bool checkedIn;



  @JsonKey(
    
    name: r'polls',
    required: true,
    includeIfNull: false,
  )


  final List<MyPoll> polls;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MyMeeting &&
      other.meeting == meeting &&
      other.eligibleUnitIds == eligibleUnitIds &&
      other.notice == notice &&
      other.attendanceToken == attendanceToken &&
      other.attendanceQr == attendanceQr &&
      other.checkedIn == checkedIn &&
      other.polls == polls;

    @override
    int get hashCode =>
        meeting.hashCode +
        eligibleUnitIds.hashCode +
        (notice == null ? 0 : notice.hashCode) +
        (attendanceToken == null ? 0 : attendanceToken.hashCode) +
        (attendanceQr == null ? 0 : attendanceQr.hashCode) +
        checkedIn.hashCode +
        polls.hashCode;

  factory MyMeeting.fromJson(Map<String, dynamic> json) => _$MyMeetingFromJson(json);

  Map<String, dynamic> toJson() => _$MyMeetingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

