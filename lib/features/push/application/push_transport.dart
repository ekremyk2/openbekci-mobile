// The relay sends to FCM registration tokens (`getToken`); the newer
// installation-id API is not what `POST /v1/me/devices` takes.
// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:unifiedpush/unifiedpush.dart';

/// The wire the push messages arrive on. The app is written against this
/// seam: Firebase Cloud Messaging in the store build, UnifiedPush in the
/// `foss` build and in development, a fake in tests (the dev flavor has no
/// Firebase project). Mobile plan section 9.
abstract interface class PushTransport {
  /// `fcm` or `unifiedpush`: the `push_kind` sent to `POST /v1/me/devices`.
  String get kind;

  /// Prepares the platform and returns the current token (FCM registration
  /// token) or endpoint URL (UnifiedPush), or `null` when push is not
  /// available on this device (no Firebase configuration, no distributor, no
  /// permission). Never throws.
  Future<String?> start();

  /// A new token or endpoint after [start] (token rotation, distributor
  /// change).
  Stream<String> get tokenChanges;

  /// The `data` map of every message that arrives while the app runs
  /// (content-free: the six payload keys).
  Stream<Map<Object?, Object?>> get messages;

  /// Forgets the token (sign-out): the next account must not receive this
  /// account's notifications.
  Future<void> stop();
}

/// No push: the dev build without a distributor, or a device without Google
/// services. The app then degrades to periodic fetching.
class NoPushTransport implements PushTransport {
  const new();

  @override
  String get kind => 'fcm';

  @override
  Future<String?> start() async => null;

  @override
  Stream<String> get tokenChanges => const Stream.empty();

  @override
  Stream<Map<Object?, Object?>> get messages => const Stream.empty();

  @override
  Future<void> stop() async {}
}

/// Firebase Cloud Messaging through the relay (store build). Needs the
/// `google-services.json` of the build (see the README); without it
/// `Firebase.initializeApp` fails and [start] answers `null`.
class FcmTransport implements PushTransport {
  new();

  final _tokens = StreamController<String>.broadcast();
  final _messages = StreamController<Map<Object?, Object?>>.broadcast();
  StreamSubscription<String>? _tokenSub;
  StreamSubscription<RemoteMessage>? _messageSub;

  @override
  String get kind => 'fcm';

  @override
  Future<String?> start() async {
    try {
      if (Firebase.apps.isEmpty) await Firebase.initializeApp();
      final messaging = FirebaseMessaging.instance;
      await messaging.requestPermission();
      final token = await messaging.getToken();
      await _tokenSub?.cancel();
      await _messageSub?.cancel();
      _tokenSub = messaging.onTokenRefresh.listen(_tokens.add);
      _messageSub = FirebaseMessaging.onMessage.listen(
        (m) => _messages.add(m.data),
      );
      return token;
    } on Object {
      return null;
    }
  }

  @override
  Stream<String> get tokenChanges => _tokens.stream;

  @override
  Stream<Map<Object?, Object?>> get messages => _messages.stream;

  @override
  Future<void> stop() async {
    await _tokenSub?.cancel();
    await _messageSub?.cancel();
    _tokenSub = null;
    _messageSub = null;
    try {
      await FirebaseMessaging.instance.deleteToken();
    } on Object {
      // Not initialized or offline: nothing to forget.
    }
  }
}

/// UnifiedPush: the distributor app (ntfy, NextPush, ...) hands the app an
/// endpoint URL; the server POSTs the content-free JSON payload straight to it
/// (backend plan section 12), no relay and no Google services.
class UnifiedPushTransport implements PushTransport {
  new({this.instance = 'default'});

  final String instance;
  final _tokens = StreamController<String>.broadcast();
  final _messages = StreamController<Map<Object?, Object?>>.broadcast();
  Completer<String?>? _first;
  bool _initialized = false;

  @override
  String get kind => 'unifiedpush';

  @override
  Future<String?> start() async {
    try {
      final first = _first = Completer<String?>();
      if (!_initialized) {
        _initialized = true;
        await UnifiedPush.initialize(
          onNewEndpoint: (endpoint, i) {
            if (endpoint.temporary) return;
            final waiting = _first;
            if (waiting != null && !waiting.isCompleted) {
              waiting.complete(endpoint.url);
            } else {
              _tokens.add(endpoint.url);
            }
          },
          onRegistrationFailed: (reason, i) {
            final waiting = _first;
            if (waiting != null && !waiting.isCompleted) waiting.complete(null);
          },
          onUnregistered: (i) {},
          onMessage: (message, i) {
            try {
              final decoded = json.decode(utf8.decode(message.content));
              if (decoded is Map) {
                _messages.add(decoded.cast<Object?, Object?>());
              }
            } on Object {
              // Not a payload of ours: ignored.
            }
          },
        );
      }
      if (!await UnifiedPush.tryUseCurrentOrDefaultDistributor()) return null;
      await UnifiedPush.register(instance: instance);
      return await first.future.timeout(
        const Duration(seconds: 15),
        onTimeout: () => null,
      );
    } on Object {
      return null;
    }
  }

  @override
  Stream<String> get tokenChanges => _tokens.stream;

  @override
  Stream<Map<Object?, Object?>> get messages => _messages.stream;

  @override
  Future<void> stop() async {
    try {
      await UnifiedPush.unregister(instance);
    } on Object {
      // No distributor: nothing to unregister.
    }
  }
}
