//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/dashboard_meeting.dart';
import 'package:openbekci_api/src/model/my_side.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me_dashboard.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeDashboard {
  /// Returns a new [MeDashboard] instance.
  MeDashboard({

    required  this.home,

    required  this.sides,

    required  this.unreadNotifications,

    required  this.unreadAnnouncements,

    required  this.myOpenTickets,

    required  this.upcomingMeetings,

    required  this.pendingVisitorApprovals,

    required  this.waitingDeliveries,
  });

      /// Which home the web app should show. Open enum.
  @JsonKey(
    
    name: r'home',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeDashboardHomeEnum.unknownDefaultOpenApi,
  )


  final MeDashboardHomeEnum home;



      /// Resident money summary (what do I owe today); empty without money visibility.
  @JsonKey(
    
    name: r'sides',
    required: true,
    includeIfNull: false,
  )


  final List<MySide> sides;



  @JsonKey(
    
    name: r'unread_notifications',
    required: true,
    includeIfNull: false,
  )


  final int unreadNotifications;



  @JsonKey(
    
    name: r'unread_announcements',
    required: true,
    includeIfNull: false,
  )


  final int unreadAnnouncements;



  @JsonKey(
    
    name: r'my_open_tickets',
    required: true,
    includeIfNull: false,
  )


  final int myOpenTickets;



  @JsonKey(
    
    name: r'upcoming_meetings',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardMeeting> upcomingMeetings;



  @JsonKey(
    
    name: r'pending_visitor_approvals',
    required: true,
    includeIfNull: false,
  )


  final int pendingVisitorApprovals;



  @JsonKey(
    
    name: r'waiting_deliveries',
    required: true,
    includeIfNull: false,
  )


  final int waitingDeliveries;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MeDashboard &&
      other.home == home &&
      other.sides == sides &&
      other.unreadNotifications == unreadNotifications &&
      other.unreadAnnouncements == unreadAnnouncements &&
      other.myOpenTickets == myOpenTickets &&
      other.upcomingMeetings == upcomingMeetings &&
      other.pendingVisitorApprovals == pendingVisitorApprovals &&
      other.waitingDeliveries == waitingDeliveries;

    @override
    int get hashCode =>
        home.hashCode +
        sides.hashCode +
        unreadNotifications.hashCode +
        unreadAnnouncements.hashCode +
        myOpenTickets.hashCode +
        upcomingMeetings.hashCode +
        pendingVisitorApprovals.hashCode +
        waitingDeliveries.hashCode;

  factory MeDashboard.fromJson(Map<String, dynamic> json) => _$MeDashboardFromJson(json);

  Map<String, dynamic> toJson() => _$MeDashboardToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Which home the web app should show. Open enum.
enum MeDashboardHomeEnum {
@JsonValue(r'portfolio')
portfolio(r'portfolio'),
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'resident')
resident(r'resident'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeDashboardHomeEnum(this.value);

final String value;

@override
String toString() => value;
}


