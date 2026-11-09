import 'dart:async';
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/features/push/domain/push_domain.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// A notification to show on the device (the push itself carries no text).
class LocalNotice {
  const new({
    required this.tag,
    required this.title,
    required this.area,
    required this.payload,
    this.body,
    this.actions = const [],
  });

  /// Same tag replaces the notification on screen: the push's `collapse_key`,
  /// so a newer message of the same event takes the place of the older one,
  /// and a text fetched from the server replaces the generic title.
  final String tag;
  final String title;
  final String? body;
  final NotificationArea area;

  /// Comes back on tap (see `PushPayload.tapPayload`).
  final String payload;

  /// Buttons under the notification (Android): id and label.
  final List<({String id, String label})> actions;
}

/// A tap on a notification or on one of its buttons.
class LocalTap {
  const new({required this.payload, this.actionId});

  final String payload;
  final String? actionId;
}

/// Shows device notifications and reports taps. A seam: tests use a fake.
abstract interface class LocalNotifier {
  /// Creates the Android channels (one per [NotificationArea]) with the
  /// localized names of [l] and starts listening for taps.
  Future<void> init(AppLocalizations l);

  Future<void> show(LocalNotice notice);

  /// Removes everything the app shows (sign-out).
  Future<void> cancelAll();

  Stream<LocalTap> get taps;

  /// The tap that started the app from a terminated state, once.
  Future<LocalTap?> launchTap();

  /// Asks for the notification permission (Android 13 and later).
  Future<void> requestPermission();
}

/// Nothing is shown (tests and platforms without notifications).
class NoLocalNotifier implements LocalNotifier {
  const new();

  @override
  Future<void> init(AppLocalizations l) async {}

  @override
  Future<void> show(LocalNotice notice) async {}

  @override
  Future<void> cancelAll() async {}

  @override
  Stream<LocalTap> get taps => const Stream.empty();

  @override
  Future<LocalTap?> launchTap() async => null;

  @override
  Future<void> requestPermission() async {}
}

String _channelName(AppLocalizations l, NotificationArea a) => switch (a) {
  NotificationArea.announcements => l.channelAnnouncements,
  NotificationArea.money => l.channelMoney,
  NotificationArea.tickets => l.channelTickets,
  NotificationArea.community => l.channelCommunity,
  NotificationArea.assembly => l.channelAssembly,
  NotificationArea.account => l.channelAccount,
  NotificationArea.system => l.channelSystem,
};

/// Tap on a notification button while the app is not running: the plugin
/// calls this top-level function in a background isolate. Buttons are created
/// with `showsUserInterface`, so the app opens and handles the tap itself;
/// there is nothing to do here.
@pragma('vm:entry-point')
void localNotificationBackgroundTap(NotificationResponse response) {}

/// [LocalNotifier] over `flutter_local_notifications`.
class FlutterLocalNotifier implements LocalNotifier {
  new({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  final _taps = StreamController<LocalTap>.broadcast();
  bool _ready = false;

  @override
  Future<void> init(AppLocalizations l) async {
    if (!_ready) {
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        ),
        onDidReceiveNotificationResponse: (r) {
          final payload = r.payload;
          if (payload != null) {
            _taps.add(LocalTap(payload: payload, actionId: r.actionId));
          }
        },
        onDidReceiveBackgroundNotificationResponse:
            localNotificationBackgroundTap,
      );
      _ready = true;
    }
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) return;
    for (final area in NotificationArea.values) {
      await android.createNotificationChannel(
        AndroidNotificationChannel(
          area.channelId,
          _channelName(l, area),
          importance: area.urgent
              ? Importance.high
              : Importance.defaultImportance,
        ),
      );
    }
  }

  @override
  Future<void> show(LocalNotice notice) async {
    await _plugin.show(
      id: notice.tag.hashCode & 0x7fffffff,
      title: notice.title,
      body: notice.body,
      payload: notice.payload,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          notice.area.channelId,
          notice.area.name,
          importance: notice.area.urgent
              ? Importance.high
              : Importance.defaultImportance,
          priority: notice.area.urgent
              ? Priority.high
              : Priority.defaultPriority,
          tag: notice.tag,
          actions: [
            for (final a in notice.actions)
              AndroidNotificationAction(
                a.id,
                a.label,
                showsUserInterface: true,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> cancelAll() => _plugin.cancelAll();

  @override
  Stream<LocalTap> get taps => _taps.stream;

  @override
  Future<LocalTap?> launchTap() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    final r = details?.notificationResponse;
    if (details == null ||
        !details.didNotificationLaunchApp ||
        r?.payload == null) {
      return null;
    }
    return LocalTap(payload: r!.payload!, actionId: r.actionId);
  }

  @override
  Future<void> requestPermission() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }
}

/// The localizations for a notification shown outside the widget tree (a
/// background isolate): the device locale when the app has that language,
/// else English.
AppLocalizations localizationsForDevice([Locale? locale]) {
  final wanted = locale ?? PlatformDispatcher.instance.locale;
  for (final supported in AppLocalizations.supportedLocales) {
    if (supported.languageCode == wanted.languageCode) {
      return lookupAppLocalizations(supported);
    }
  }
  return lookupAppLocalizations(const Locale('en'));
}

/// Builds the generic notice for a push: the per-type title from the ARB
/// files (readable without any network), with the Approve / Deny buttons for a
/// visitor waiting at the gate.
LocalNotice genericNotice(PushPayload payload, AppLocalizations l) =>
    LocalNotice(
      tag: payload.collapseKey.isEmpty
          ? payload.notificationId
          : payload.collapseKey,
      title: pushTitle(l, payload.type),
      area: payload.area,
      payload: payload.tapPayload,
      actions: payload.type == 'visitor.approval_requested'
          ? [
              (id: 'approve', label: l.visitorApprove),
              (id: 'deny', label: l.visitorDeny),
            ]
          : const [],
    );

/// Title shown for a push of [type]; unknown types read "New notification".
String pushTitle(AppLocalizations l, String type) => switch (type) {
  'announcement.published' => l.notifAnnouncementPublished,
  'charge.due_soon' => l.notifChargeDueSoon,
  'charge.overdue' => l.notifChargeOverdue,
  'dunning.reminder' => l.notifDunningReminder,
  'payment.receipt' => l.notifPaymentReceipt,
  'payment.declared' => l.notifPaymentDeclared,
  'payment.confirmed' => l.notifPaymentConfirmed,
  'payment.rejected' => l.notifPaymentRejected,
  'statement.sent' => l.notifStatementSent,
  'ticket.updated' => l.notifTicketUpdated,
  'ticket.commented' => l.notifTicketCommented,
  'claim.requested' => l.notifClaimRequested,
  'claim.decided' => l.notifClaimDecided,
  'meeting.called' => l.notifMeetingCalled,
  'meeting.decisions' => l.notifMeetingDecisions,
  'meeting.assembly_due' => l.notifMeetingAssemblyDue,
  'delivery.waiting' => l.notifDeliveryWaiting,
  'delivery.received' => l.notifDeliveryReceived,
  'visitor.qr_rotated' => l.notifVisitorQrRotated,
  'visitor.approval_requested' => l.notifVisitorApproval,
  'visitor.arrived' => l.notifVisitorArrived,
  'booking.confirmed' => l.notifBookingConfirmed,
  'booking.cancelled' => l.notifBookingCancelled,
  'term.expiring' => l.notifTermExpiring,
  'access.agent_silent' => l.notifAgentSilent,
  'access.agent_clock_skew' => l.notifAgentClockSkew,
  'access.agent_stopped' => l.notifAgentStopped,
  'webhook.endpoint_failing' => l.notifWebhookFailing,
  'auth.sign_in_code' => l.notifSignInCode,
  'invitation.sent' => l.notifInvitation,
  _ => l.notifGeneric,
};

/// The body of a notification from the row the server returns: the first
/// readable text of its payload (`body`, `title`, a visitor's name, a parcel
/// description), trimmed. `null` when the payload has none.
String? notificationBodyOf(Map<String, Object?> payload) {
  for (final key in const [
    'body',
    'title',
    'visitor_name',
    'name',
    'description',
    'text',
  ]) {
    final v = payload[key];
    if (v is String && v.trim().isNotEmpty) {
      final t = v.trim();
      return t.length > 200 ? '${t.substring(0, 199)}…' : t;
    }
  }
  return null;
}

/// FCM message that arrives while the app is in the background or closed:
/// runs in its own isolate, so it builds the generic notice by itself. The
/// payload is content-free, so the title is the per-type generic one.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) =>
    showBackgroundPush(message.data);

/// Shows the generic notice of a push received without the app running, but
/// only for the signed-in account's instance: with no account (signed out) or
/// another instance's id the message is dropped, as in the foreground.
/// [store] and [notifier] are seams for tests.
Future<void> showBackgroundPush(
  Map<Object?, Object?> data, {
  AccountStore? store,
  LocalNotifier? notifier,
}) async {
  final payload = PushPayload.tryParse(data);
  if (payload == null) return;
  Account? account;
  try {
    account = await (store ?? SecureAccountStore()).readAccount();
  } on Object {
    return;
  }
  if (account == null || account.instanceId != payload.instanceId) return;
  final l = localizationsForDevice();
  final out = notifier ?? FlutterLocalNotifier();
  await out.init(l);
  await out.show(genericNotice(payload, l));
}
