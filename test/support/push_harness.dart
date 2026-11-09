import 'dart:async';

import 'package:openbekci_mobile/features/push/application/local_notifier.dart';
import 'package:openbekci_mobile/features/push/application/push_transport.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// A push wire the test drives: it hands out a token, rotates it and delivers
/// message payloads, like FCM or a UnifiedPush distributor would.
class FakePushTransport implements PushTransport {
  new({this.kind = 'fcm', this.token = 'fcm-token-1'});

  @override
  final String kind;

  /// What [start] answers; `null` = push unavailable.
  String? token;
  int starts = 0;
  int stops = 0;
  final _tokens = StreamController<String>.broadcast();
  final _messages = StreamController<Map<Object?, Object?>>.broadcast();

  @override
  Future<String?> start() async {
    starts++;
    return token;
  }

  @override
  Stream<String> get tokenChanges => _tokens.stream;

  @override
  Stream<Map<Object?, Object?>> get messages => _messages.stream;

  @override
  Future<void> stop() async => stops++;

  /// The wire delivers [data] (the `data` map of a push message).
  void deliver(Map<Object?, Object?> data) => _messages.add(data);

  /// The token changes.
  void rotate(String newToken) => _tokens.add(newToken);
}

/// Records what would be shown on the device and lets a test tap it.
class FakeLocalNotifier implements LocalNotifier {
  final shown = <LocalNotice>[];
  final _taps = StreamController<LocalTap>.broadcast();
  LocalTap? launch;
  int cancelled = 0;
  int inits = 0;
  int permissionRequests = 0;
  AppLocalizations? initWith;

  @override
  Future<void> init(AppLocalizations l) async {
    inits++;
    initWith = l;
  }

  @override
  Future<void> show(LocalNotice notice) async => shown.add(notice);

  @override
  Future<void> cancelAll() async => cancelled++;

  @override
  Stream<LocalTap> get taps => _taps.stream;

  @override
  Future<LocalTap?> launchTap() async => launch;

  @override
  Future<void> requestPermission() async => permissionRequests++;

  /// The user taps a notification (or one of its buttons).
  void tap(LocalTap tap) => _taps.add(tap);

  /// Notices shown with [tag] (a replaced notification appears twice).
  List<LocalNotice> withTag(String tag) => [
    for (final n in shown)
      if (n.tag == tag) n,
  ];
}
