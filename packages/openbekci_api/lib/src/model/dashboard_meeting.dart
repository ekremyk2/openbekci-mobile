//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_meeting.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardMeeting {
  /// Returns a new [DashboardMeeting] instance.
  DashboardMeeting({

    required  this.id,

    required  this.title,

    required  this.scheduledAt,

    required  this.status,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: true,
  )


  final String? title;



  @JsonKey(
    
    name: r'scheduled_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime scheduledAt;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final String status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardMeeting &&
      other.id == id &&
      other.title == title &&
      other.scheduledAt == scheduledAt &&
      other.status == status;

    @override
    int get hashCode =>
        id.hashCode +
        (title == null ? 0 : title.hashCode) +
        scheduledAt.hashCode +
        status.hashCode;

  factory DashboardMeeting.fromJson(Map<String, dynamic> json) => _$DashboardMeetingFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardMeetingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

