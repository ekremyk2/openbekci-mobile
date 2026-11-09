import 'package:flutter/foundation.dart';

/// Push notifications, the parts that need no platform (mobile plan section
/// 9): the content-free payload, the notification type vocabulary with its
/// Android channel areas, where a tap leads and when the app falls back to
/// periodic fetching.

/// Every value of the notification `type` vocabulary (backend plan section
/// 12) the server can push, plus the two unmutable types the identity module
/// sends directly. Used to prove each has a generic title and a channel.
const notificationVocabulary = <String>[
  'announcement.published',
  'charge.due_soon',
  'charge.overdue',
  'dunning.reminder',
  'payment.receipt',
  'payment.declared',
  'payment.confirmed',
  'payment.rejected',
  'statement.sent',
  'ticket.updated',
  'ticket.commented',
  'claim.requested',
  'claim.decided',
  'meeting.called',
  'meeting.decisions',
  'meeting.assembly_due',
  'delivery.waiting',
  'visitor.qr_rotated',
  'term.expiring',
  'visitor.approval_requested',
  'visitor.arrived',
  'booking.confirmed',
  'booking.cancelled',
  'delivery.received',
  'access.agent_silent',
  'access.agent_clock_skew',
  'access.agent_stopped',
  'webhook.endpoint_failing',
  'auth.sign_in_code',
  'invitation.sent',
];

/// Android notification channels are per area, so people can tune them in the
/// system settings (mobile plan section 9).
enum NotificationArea {
  announcements,
  money,
  tickets,
  community,
  assembly,
  account,
  system;

  /// Android channel id.
  String get channelId => 'obk_$name';

  /// Time-sensitive areas ring (high importance); the rest are default.
  bool get urgent => this == community;
}

/// The area a notification type belongs to; unknown types go to `system`.
NotificationArea areaOfType(String type) {
  if (type.startsWith('announcement.')) return NotificationArea.announcements;
  if (type.startsWith('charge.') ||
      type.startsWith('payment.') ||
      type.startsWith('statement.') ||
      type.startsWith('dunning.')) {
    return NotificationArea.money;
  }
  if (type.startsWith('ticket.')) return NotificationArea.tickets;
  if (type.startsWith('visitor.') ||
      type.startsWith('delivery.') ||
      type.startsWith('booking.')) {
    return NotificationArea.community;
  }
  if (type.startsWith('meeting.') || type == 'term.expiring') {
    return NotificationArea.assembly;
  }
  if (type.startsWith('claim.') ||
      type.startsWith('auth.') ||
      type.startsWith('invitation.')) {
    return NotificationArea.account;
  }
  return NotificationArea.system;
}

final _safeIdPattern = RegExp(r'^[A-Za-z0-9_-]{1,64}$');

/// An id that is safe to put in a route path (no separators, no query).
String? safeId(Object? v) =>
    v is String && _safeIdPattern.hasMatch(v) ? v : null;

/// The content-free push payload (backend plan section 12): exactly these six
/// keys, never a title, body, name or address.
@immutable
class PushPayload {
  const new({
    required this.instanceId,
    required this.orgId,
    required this.notificationId,
    required this.type,
    required this.collapseKey,
    required this.badge,
  });

  /// Reads the `data` map of a push message. FCM data values are strings
  /// (`badge` arrives as `"3"`); UnifiedPush posts JSON (numbers stay
  /// numbers). Returns `null` for anything that is not a well-formed payload,
  /// including a missing id, so a malformed message is ignored rather than
  /// shown.
  static PushPayload? tryParse(Map<Object?, Object?> data) {
    final instance = data['instance_id'];
    final org = safeId(data['org_id']);
    final notification = safeId(data['notification_id']);
    final type = data['type'];
    final collapse = data['collapse_key'];
    final badge = data['badge'];
    if (instance is! String || instance.isEmpty) return null;
    if (org == null || notification == null) return null;
    if (type is! String || type.isEmpty || type.length > 80) return null;
    final count = switch (badge) {
      final int n => n,
      final num n => n.toInt(),
      final String s => int.tryParse(s),
      null => 0,
      _ => null,
    };
    if (count == null || count < 0) return null;
    return PushPayload(
      instanceId: instance,
      orgId: org,
      notificationId: notification,
      type: type,
      collapseKey: collapse is String ? collapse : '',
      badge: count,
    );
  }

  final String instanceId;
  final String orgId;
  final String notificationId;
  final String type;
  final String collapseKey;
  final int badge;

  NotificationArea get area => areaOfType(type);

  /// The map as a push message carries it (FCM: all values are strings).
  Map<String, String> toData() => {
    'instance_id': instanceId,
    'org_id': orgId,
    'notification_id': notificationId,
    'type': type,
    'collapse_key': collapseKey,
    'badge': '$badge',
  };

  /// Opaque string that travels through the local notification and comes
  /// back on a tap (no new information: the same six keys).
  String get tapPayload => toData().entries
      .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
      .join('&');

  static PushPayload? fromTapPayload(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      return tryParse(Uri.splitQueryString(raw));
    } on Object {
      return null;
    }
  }

  @override
  bool operator ==(Object other) =>
      other is PushPayload &&
      other.instanceId == instanceId &&
      other.orgId == orgId &&
      other.notificationId == notificationId &&
      other.type == type &&
      other.collapseKey == collapseKey &&
      other.badge == badge;

  @override
  int get hashCode =>
      Object.hash(instanceId, orgId, notificationId, type, collapseKey, badge);
}

/// The screen a push of [type] leads to without any further information
/// (offline, or before the notification row is fetched). Never navigates to a
/// screen that needs an id.
String fallbackRouteForType(String type) {
  if (type.startsWith('announcement.')) return '/more/announcements';
  if (type.startsWith('ticket.')) return '/tickets';
  if (type.startsWith('charge.') ||
      type.startsWith('payment.') ||
      type.startsWith('statement.') ||
      type.startsWith('dunning.')) {
    return '/money';
  }
  if (type.startsWith('visitor.')) return '/more/visitors';
  if (type.startsWith('delivery.')) return '/more/parcels';
  if (type.startsWith('booking.')) return '/more/bookings';
  if (type.startsWith('meeting.') || type == 'term.expiring') {
    return '/more/assembly';
  }
  return '/more/notifications';
}

/// What decides whether the app polls the unread count itself (mobile plan
/// section 9, "Degradation"). The relay is a shared dependency: when push
/// registration failed, the instance has no relay, or nothing arrived for the
/// configured quiet period although push is registered, the app falls back
/// to periodic fetch and tells the user notifications may be delayed.
@immutable
class PushHealth {
  const new({
    required this.registered,
    required this.registrationFailed,
    this.lastPushAt,
    this.registeredAt,
  });

  /// A token is registered with the server.
  final bool registered;

  /// The last registration attempt failed, or there is no transport.
  final bool registrationFailed;
  final DateTime? lastPushAt;
  final DateTime? registeredAt;

  static const unknown = PushHealth(
    registered: false,
    registrationFailed: false,
  );
}

/// How long without any push before the fallback starts.
const pushQuietPeriod = Duration(hours: 6);

/// How often the fallback polls the unread count.
const periodicFetchInterval = Duration(minutes: 15);

/// True when the app should poll the unread count itself.
bool shouldFetchPeriodically(
  PushHealth health,
  DateTime now, {
  Duration quietPeriod = pushQuietPeriod,
}) {
  if (health.registrationFailed) return true;
  if (!health.registered) return false;
  final since = health.lastPushAt ?? health.registeredAt;
  if (since == null) return false;
  return now.difference(since) >= quietPeriod;
}

/// Show the "notifications may be delayed" hint: exactly when the fallback is
/// running.
bool showDelayedHint(
  PushHealth health,
  DateTime now, {
  Duration quietPeriod = pushQuietPeriod,
}) => shouldFetchPeriodically(health, now, quietPeriod: quietPeriod);

/// Whether a fetched unread count is news worth a local notification: the
/// count rose above what the user last saw.
bool unreadRose({required int previous, required int current}) =>
    current > previous;
