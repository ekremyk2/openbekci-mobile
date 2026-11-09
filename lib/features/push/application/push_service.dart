import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/notifications/application/notifications_providers.dart';
import 'package:openbekci_mobile/features/push/application/local_notifier.dart';
import 'package:openbekci_mobile/features/push/application/push_transport.dart';
import 'package:openbekci_mobile/features/push/domain/push_domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Timing of the push layer; tests shorten it.
class PushConfig {
  const new({
    this.quietPeriod = pushQuietPeriod,
    this.fetchInterval = periodicFetchInterval,
    this.tickInterval = const Duration(minutes: 1),
  });

  /// No push for this long although registered: fall back to polling.
  final Duration quietPeriod;

  /// How often the fallback polls the unread count.
  final Duration fetchInterval;

  /// How often the controller re-evaluates its health.
  final Duration tickInterval;
}

final pushConfigProvider = Provider<PushConfig>((ref) => const PushConfig());

/// The wire: FCM (prod), UnifiedPush (foss, dev) or nothing; overridden in
/// the entry points and in tests.
final pushTransportProvider = Provider<PushTransport>(
  (ref) => const NoPushTransport(),
);

final localNotifierProvider = Provider<LocalNotifier>(
  (ref) => const NoLocalNotifier(),
);

/// False in widget tests that do not exercise push (no timers, no platform).
final pushEnabledProvider = Provider<bool>((ref) => true);

final pushClockProvider = Provider<DateTime Function()>((ref) => DateTime.now);

/// What the controller knows about push right now.
class PushStatus {
  const new({required this.health, this.delayed = false});

  final PushHealth health;

  /// The fallback runs: the center shows "notifications may be delayed".
  final bool delayed;

  PushStatus copyWith({PushHealth? health, bool? delayed}) => PushStatus(
    health: health ?? this.health,
    delayed: delayed ?? this.delayed,
  );
}

/// The unread count the last push carried (`badge`), shown until the next
/// fetch of the real count completes.
class PushBadge extends Notifier<int?> {
  @override
  int? build() => null;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void set(int? value) => state = value;
}

final pushBadgeProvider = NotifierProvider<PushBadge, int?>(PushBadge.new);

/// The unread count for badges: the push's `badge` while it is fresher than
/// the last fetch, else the fetched count.
final displayUnreadProvider = Provider<int>((ref) {
  final badge = ref.watch(pushBadgeProvider);
  if (badge != null) return badge;
  return ref.watch(unreadCountProvider).value?.data ?? 0;
});

final pushDelayedHintProvider = Provider<bool>(
  (ref) => ref.watch(pushControllerProvider.select((s) => s.delayed)),
);

/// Prefix of the stored device id: `push_device_v1/<user id>`.
const pushDevicePrefPrefix = 'push_device_v1';

/// Registers this device for push after sign-in and on token change, handles
/// incoming messages and taps, deletes the registration on sign-out, and
/// falls back to polling the unread count when push does not work (mobile
/// plan section 9).
class PushController extends Notifier<PushStatus> {
  Timer? _ticker;
  StreamSubscription<String>? _tokenSub;
  StreamSubscription<Map<Object?, Object?>>? _messageSub;
  StreamSubscription<LocalTap>? _tapSub;
  String? _userId;
  DateTime? _lastFetch;
  DateTime? _lastAttempt;
  int? _lastSeenUnread;
  bool _connecting = false;
  int _generation = 0;

  PushTransport get _transport => ref.read(pushTransportProvider);
  LocalNotifier get _notifier => ref.read(localNotifierProvider);
  DateTime _now() => ref.read(pushClockProvider)();

  @override
  PushStatus build() {
    final userId = ref.watch(accountProvider.select((a) => a.value?.userId));
    ref.onDispose(_cancelListeners);
    if (!ref.read(pushEnabledProvider) || userId == null) {
      _cancelListeners();
      return const PushStatus(health: PushHealth.unknown);
    }
    _userId = userId;
    ref.read(signOutHooksProvider).add('push', unregister);
    final gen = ++_generation;
    unawaited(Future<void>.microtask(() => _start(gen)));
    return const PushStatus(health: PushHealth.unknown);
  }

  void _cancelListeners() {
    _ticker?.cancel();
    _ticker = null;
    unawaited(_tokenSub?.cancel());
    unawaited(_messageSub?.cancel());
    unawaited(_tapSub?.cancel());
    _tokenSub = _messageSub = _tapSub = null;
  }

  Future<void> _start(int gen) async {
    if (gen != _generation) return;
    final l = localizationsForDevice(ref.read(localeProvider));
    try {
      await _notifier.init(l);
      await _notifier.requestPermission();
    } on Object {
      // Notifications unavailable: registration and the fallback still run.
    }
    if (gen != _generation) return;
    _tapSub = _notifier.taps.listen((t) => unawaited(_onTap(t)));
    _messageSub = _transport.messages.listen((m) => unawaited(_onMessage(m)));
    _tokenSub = _transport.tokenChanges.listen((t) => unawaited(_register(t)));
    final launch = await _notifier.launchTap();
    if (launch != null) unawaited(_onTap(launch));
    await _connect();
    _ticker = Timer.periodic(
      ref.read(pushConfigProvider).tickInterval,
      (_) => unawaited(_tick()),
    );
  }

  void _setHealth(PushHealth health) {
    final delayed = showDelayedHint(
      health,
      _now(),
      quietPeriod: ref.read(pushConfigProvider).quietPeriod,
    );
    state = PushStatus(health: health, delayed: delayed);
  }

  /// Checks that the instance can push to this device, starts the transport
  /// and registers the token it gives.
  Future<void> _connect() async {
    if (_connecting) return;
    _connecting = true;
    _lastAttempt = _now();
    try {
      final kind = _transport.kind;
      final account = ref.read(accountProvider).value;
      if (account != null) {
        try {
          final server = await fetchDiscovery(
            ref.read(anonymousApiProvider(account.serverOrigin)),
          );
          final push = server.document.push;
          final relay = ref.read(appConfigProvider).relayId;
          final usable = kind == 'unifiedpush'
              ? push.unifiedPush
              : push.relayIds.contains(relay);
          if (!usable) {
            _setHealth(
              const PushHealth(registered: false, registrationFailed: true),
            );
            return;
          }
        } on Object {
          // Discovery unreachable: try anyway, the server decides.
        }
      }
      final token = await _transport.start();
      if (token == null) {
        _setHealth(
          PushHealth(
            registered: false,
            registrationFailed: true,
            lastPushAt: state.health.lastPushAt,
          ),
        );
        return;
      }
      await _register(token);
    } finally {
      _connecting = false;
    }
  }

  Future<void> _register(String token) async {
    final api = ref.read(apiProvider);
    final userId = _userId;
    if (api == null || userId == null) return;
    final info = ref.read(appInfoProvider);
    final locale =
        ref.read(localeProvider) ?? PlatformDispatcher.instance.locale;
    try {
      final device = await unwrap(
        () => api.me.meRegisterDevice(
          deviceRegister: DeviceRegister(
            pushKind: _transport.kind,
            token: token,
            relayId: _transport.kind == 'fcm'
                ? ref.read(appConfigProvider).relayId
                : null,
            appVersion: info.version,
            locale: locale.toLanguageTag(),
          ),
        ),
      );
      try {
        final prefs = await SharedPreferences.getInstance();
        final key = '$pushDevicePrefPrefix/$userId';
        final previous = prefs.getString(key);
        await prefs.setString(key, device.id);
        if (previous != null && previous != device.id) {
          try {
            await unwrapVoid(() => api.me.meDeleteDevice(id: previous));
          } on Object {
            // The old row goes with its session or when the relay rejects it.
          }
        }
      } on Object {
        // Preferences are a convenience: the device is registered anyway.
      }
      final now = _now();
      _setHealth(
        PushHealth(
          registered: true,
          registrationFailed: false,
          lastPushAt: state.health.lastPushAt,
          registeredAt: now,
        ),
      );
    } on Object {
      _setHealth(
        PushHealth(
          registered: false,
          registrationFailed: true,
          lastPushAt: state.health.lastPushAt,
        ),
      );
    }
  }

  /// Deletes the registration on the server and forgets the token (sign-out,
  /// called while the session still works).
  Future<void> unregister() async {
    final userId = _userId;
    _cancelListeners();
    _generation++;
    final api = ref.read(apiProvider);
    if (userId != null) {
      try {
        final prefs = await SharedPreferences.getInstance();
        final key = '$pushDevicePrefPrefix/$userId';
        final id = prefs.getString(key);
        if (id != null && api != null) {
          try {
            await unwrapVoid(() => api.me.meDeleteDevice(id: id));
          } on Object {
            // Offline: the server drops it with the session.
          }
        }
        await prefs.remove(key);
      } on Object {
        // Preferences are a convenience.
      }
    }
    try {
      await _transport.stop();
      await _notifier.cancelAll();
    } on Object {
      // Nothing to forget.
    }
    ref.read(pushBadgeProvider.notifier).set(null);
  }

  /// A push arrived while the app runs: show it, update the counters and, when
  /// online, replace the generic text with the server's.
  Future<void> _onMessage(Map<Object?, Object?> data) async {
    final payload = PushPayload.tryParse(data);
    if (payload == null) return;
    final account = ref.read(accountProvider).value;
    // Not ours: another instance's message never shows (and never routes).
    if (account == null || payload.instanceId != account.instanceId) return;
    final now = _now();
    _setHealth(
      PushHealth(
        registered: true,
        registrationFailed: false,
        lastPushAt: now,
        registeredAt: state.health.registeredAt,
      ),
    );
    final l = localizationsForDevice(ref.read(localeProvider));
    final generic = genericNotice(payload, l);
    await _notifier.show(generic);
    ref.read(pushBadgeProvider.notifier).set(payload.badge);
    _refreshCounters();
    final api = ref.read(apiProvider);
    if (api == null) return;
    try {
      final n = await unwrap(
        () => api.operations.operationsGetNotification(
          orgId: payload.orgId,
          notificationId: payload.notificationId,
        ),
      );
      final body = notificationBodyOf(n.payload);
      if (body != null) {
        await _notifier.show(
          LocalNotice(
            tag: generic.tag,
            title: generic.title,
            body: body,
            area: generic.area,
            payload: generic.payload,
            actions: generic.actions,
          ),
        );
      }
    } on Object {
      // Offline: the generic title stays.
    }
  }

  void _refreshCounters() {
    ref
      ..invalidate(unreadCountProvider)
      ..invalidate(notificationsProvider);
    // The badge is shown until the fetched count is in.
    late final ProviderSubscription<AsyncValue<CacheState<int>>> sub;
    sub = ref.listen(unreadCountProvider, (_, next) {
      final v = next.value;
      if (v != null && !v.refreshing && (v.data != null || v.error != null)) {
        ref.read(pushBadgeProvider.notifier).set(null);
        sub.close();
      }
    });
  }

  /// A tap on a notification (or its Approve / Deny button): open the screen
  /// the notification leads to.
  Future<void> _onTap(LocalTap tap) async {
    final payload = PushPayload.fromTapPayload(tap.payload);
    final router = ref.read(routerProvider);
    if (payload == null) {
      _open(router, '/more/notifications');
      return;
    }
    final account = ref.read(accountProvider).value;
    if (account == null || payload.instanceId != account.instanceId) return;
    final selected = ref.read(selectedOrgProvider);
    if (selected != payload.orgId) {
      unawaited(ref.read(selectedOrgProvider.notifier).select(payload.orgId));
    }
    var route = fallbackRouteForType(payload.type);
    final api = ref.read(apiProvider);
    if (api != null) {
      try {
        final n = await unwrap(
          () => api.operations.operationsGetNotification(
            orgId: payload.orgId,
            notificationId: payload.notificationId,
          ),
        );
        route =
            routeForNotification(n, orgId: payload.orgId) ??
            fallbackRouteForType(payload.type);
        if (n.readAt == null) {
          unawaited(
            unwrap(
              () => api.operations.operationsMarkNotificationRead(
                orgId: payload.orgId,
                notificationId: payload.notificationId,
              ),
            ).then<void>((_) => _refreshCounters(), onError: (Object _) {}),
          );
        }
      } on Object {
        // Offline: the list screen of the type.
      }
    }
    final decision = tap.actionId;
    if ((decision == 'approve' || decision == 'deny') &&
        route.startsWith('/more/visitors/requests/')) {
      route = '$route?decision=$decision';
    }
    _open(router, route);
  }

  void _open(GoRouter router, String route) {
    final shellRoots = {'/', '/money', '/tickets', '/more'};
    if (shellRoots.contains(route)) {
      router.go(route);
    } else {
      unawaited(router.push<void>(route));
    }
  }

  /// Re-evaluates health; retries registration; polls the unread count when
  /// push is not working.
  Future<void> _tick() async {
    final cfg = ref.read(pushConfigProvider);
    final now = _now();
    final health = state.health;
    state = state.copyWith(
      delayed: showDelayedHint(health, now, quietPeriod: cfg.quietPeriod),
    );
    if (!health.registered &&
        health.registrationFailed &&
        (_lastAttempt == null ||
            now.difference(_lastAttempt!) >= cfg.fetchInterval)) {
      await _connect();
    }
    if (shouldFetchPeriodically(
      state.health,
      now,
      quietPeriod: cfg.quietPeriod,
    )) {
      if (_lastFetch == null ||
          now.difference(_lastFetch!) >= cfg.fetchInterval) {
        await fetchUnreadNow();
      }
    }
  }

  /// Polls the unread-count endpoint (the periodic fallback); a rise is
  /// announced with a local notification.
  Future<void> fetchUnreadNow() async {
    _lastFetch = _now();
    final scope = ref.read(scopeProvider);
    final api = ref.read(apiProvider);
    if (scope == null || api == null) return;
    try {
      final count = await unwrap(
        () => api.operations.operationsGetUnreadCount(orgId: scope.orgId),
      );
      final previous =
          _lastSeenUnread ??
          ref.read(unreadCountProvider).value?.data ??
          count.unread;
      _lastSeenUnread = count.unread;
      ref
        ..invalidate(unreadCountProvider)
        ..invalidate(notificationsProvider);
      if (unreadRose(previous: previous, current: count.unread)) {
        final l = localizationsForDevice(ref.read(localeProvider));
        await _notifier.show(
          LocalNotice(
            tag: 'periodic-unread',
            title: l.notifPeriodicTitle,
            body: l.notifPeriodicBody(count.unread),
            area: NotificationArea.account,
            payload: 'periodic',
          ),
        );
      }
    } on Object {
      // Offline: tried again at the next interval.
    }
  }
}

final pushControllerProvider = NotifierProvider<PushController, PushStatus>(
  PushController.new,
);
