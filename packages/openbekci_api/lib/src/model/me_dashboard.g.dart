// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_dashboard.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeDashboardCWProxy {
  MeDashboard home(MeDashboardHomeEnum home);

  MeDashboard sides(List<MySide> sides);

  MeDashboard unreadNotifications(int unreadNotifications);

  MeDashboard unreadAnnouncements(int unreadAnnouncements);

  MeDashboard myOpenTickets(int myOpenTickets);

  MeDashboard upcomingMeetings(List<DashboardMeeting> upcomingMeetings);

  MeDashboard pendingVisitorApprovals(int pendingVisitorApprovals);

  MeDashboard waitingDeliveries(int waitingDeliveries);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeDashboard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeDashboard(...).copyWith(id: 12, name: "My name")
  /// ````
  MeDashboard call({
    MeDashboardHomeEnum home,
    List<MySide> sides,
    int unreadNotifications,
    int unreadAnnouncements,
    int myOpenTickets,
    List<DashboardMeeting> upcomingMeetings,
    int pendingVisitorApprovals,
    int waitingDeliveries,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeDashboard.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeDashboard.copyWith.fieldName(...)`
class _$MeDashboardCWProxyImpl implements _$MeDashboardCWProxy {
  const _$MeDashboardCWProxyImpl(this._value);

  final MeDashboard _value;

  @override
  MeDashboard home(MeDashboardHomeEnum home) => this(home: home);

  @override
  MeDashboard sides(List<MySide> sides) => this(sides: sides);

  @override
  MeDashboard unreadNotifications(int unreadNotifications) =>
      this(unreadNotifications: unreadNotifications);

  @override
  MeDashboard unreadAnnouncements(int unreadAnnouncements) =>
      this(unreadAnnouncements: unreadAnnouncements);

  @override
  MeDashboard myOpenTickets(int myOpenTickets) =>
      this(myOpenTickets: myOpenTickets);

  @override
  MeDashboard upcomingMeetings(List<DashboardMeeting> upcomingMeetings) =>
      this(upcomingMeetings: upcomingMeetings);

  @override
  MeDashboard pendingVisitorApprovals(int pendingVisitorApprovals) =>
      this(pendingVisitorApprovals: pendingVisitorApprovals);

  @override
  MeDashboard waitingDeliveries(int waitingDeliveries) =>
      this(waitingDeliveries: waitingDeliveries);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeDashboard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeDashboard(...).copyWith(id: 12, name: "My name")
  /// ````
  MeDashboard call({
    Object? home = const $CopyWithPlaceholder(),
    Object? sides = const $CopyWithPlaceholder(),
    Object? unreadNotifications = const $CopyWithPlaceholder(),
    Object? unreadAnnouncements = const $CopyWithPlaceholder(),
    Object? myOpenTickets = const $CopyWithPlaceholder(),
    Object? upcomingMeetings = const $CopyWithPlaceholder(),
    Object? pendingVisitorApprovals = const $CopyWithPlaceholder(),
    Object? waitingDeliveries = const $CopyWithPlaceholder(),
  }) {
    return MeDashboard(
      home: home == const $CopyWithPlaceholder()
          ? _value.home
          // ignore: cast_nullable_to_non_nullable
          : home as MeDashboardHomeEnum,
      sides: sides == const $CopyWithPlaceholder()
          ? _value.sides
          // ignore: cast_nullable_to_non_nullable
          : sides as List<MySide>,
      unreadNotifications: unreadNotifications == const $CopyWithPlaceholder()
          ? _value.unreadNotifications
          // ignore: cast_nullable_to_non_nullable
          : unreadNotifications as int,
      unreadAnnouncements: unreadAnnouncements == const $CopyWithPlaceholder()
          ? _value.unreadAnnouncements
          // ignore: cast_nullable_to_non_nullable
          : unreadAnnouncements as int,
      myOpenTickets: myOpenTickets == const $CopyWithPlaceholder()
          ? _value.myOpenTickets
          // ignore: cast_nullable_to_non_nullable
          : myOpenTickets as int,
      upcomingMeetings: upcomingMeetings == const $CopyWithPlaceholder()
          ? _value.upcomingMeetings
          // ignore: cast_nullable_to_non_nullable
          : upcomingMeetings as List<DashboardMeeting>,
      pendingVisitorApprovals:
          pendingVisitorApprovals == const $CopyWithPlaceholder()
          ? _value.pendingVisitorApprovals
          // ignore: cast_nullable_to_non_nullable
          : pendingVisitorApprovals as int,
      waitingDeliveries: waitingDeliveries == const $CopyWithPlaceholder()
          ? _value.waitingDeliveries
          // ignore: cast_nullable_to_non_nullable
          : waitingDeliveries as int,
    );
  }
}

extension $MeDashboardCopyWith on MeDashboard {
  /// Returns a callable class that can be used as follows: `instanceOfMeDashboard.copyWith(...)` or like so:`instanceOfMeDashboard.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeDashboardCWProxy get copyWith => _$MeDashboardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeDashboard _$MeDashboardFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MeDashboard',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'home',
        'sides',
        'unread_notifications',
        'unread_announcements',
        'my_open_tickets',
        'upcoming_meetings',
        'pending_visitor_approvals',
        'waiting_deliveries',
      ],
    );
    final val = MeDashboard(
      home: $checkedConvert(
        'home',
        (v) => $enumDecode(
          _$MeDashboardHomeEnumEnumMap,
          v,
          unknownValue: MeDashboardHomeEnum.unknownDefaultOpenApi,
        ),
      ),
      sides: $checkedConvert(
        'sides',
        (v) => (v as List<dynamic>)
            .map((e) => MySide.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      unreadNotifications: $checkedConvert(
        'unread_notifications',
        (v) => (v as num).toInt(),
      ),
      unreadAnnouncements: $checkedConvert(
        'unread_announcements',
        (v) => (v as num).toInt(),
      ),
      myOpenTickets: $checkedConvert(
        'my_open_tickets',
        (v) => (v as num).toInt(),
      ),
      upcomingMeetings: $checkedConvert(
        'upcoming_meetings',
        (v) => (v as List<dynamic>)
            .map((e) => DashboardMeeting.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      pendingVisitorApprovals: $checkedConvert(
        'pending_visitor_approvals',
        (v) => (v as num).toInt(),
      ),
      waitingDeliveries: $checkedConvert(
        'waiting_deliveries',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'unreadNotifications': 'unread_notifications',
    'unreadAnnouncements': 'unread_announcements',
    'myOpenTickets': 'my_open_tickets',
    'upcomingMeetings': 'upcoming_meetings',
    'pendingVisitorApprovals': 'pending_visitor_approvals',
    'waitingDeliveries': 'waiting_deliveries',
  },
);

Map<String, dynamic> _$MeDashboardToJson(MeDashboard instance) =>
    <String, dynamic>{
      'home': _$MeDashboardHomeEnumEnumMap[instance.home]!,
      'sides': instance.sides.map((e) => e.toJson()).toList(),
      'unread_notifications': instance.unreadNotifications,
      'unread_announcements': instance.unreadAnnouncements,
      'my_open_tickets': instance.myOpenTickets,
      'upcoming_meetings': instance.upcomingMeetings
          .map((e) => e.toJson())
          .toList(),
      'pending_visitor_approvals': instance.pendingVisitorApprovals,
      'waiting_deliveries': instance.waitingDeliveries,
    };

const _$MeDashboardHomeEnumEnumMap = {
  MeDashboardHomeEnum.portfolio: 'portfolio',
  MeDashboardHomeEnum.site: 'site',
  MeDashboardHomeEnum.resident: 'resident',
  MeDashboardHomeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
