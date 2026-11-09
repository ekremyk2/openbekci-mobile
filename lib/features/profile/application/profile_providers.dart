import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// My person record in the organization: contacts, gate contact phone,
/// directory consent per site.
final myPersonProvider = StreamProvider<CacheState<Person>>((ref) {
  final scope = ref.watch(scopeProvider);
  if (scope == null) return const Stream.empty();
  return watchCached<Person>(
    ref,
    key: 'org/${scope.orgId}/my-person',
    fetch: (api) async =>
        (await unwrap(() => api.people.peopleGetMyPerson(orgId: scope.orgId)))
            .toJson(),
    decode: (j) => Person.fromJson((j! as Map).cast<String, dynamic>()),
  );
});

/// Updates my display name, contact phone and gate contact phone. The
/// person's `version` goes into `If-Match` (`412 version_conflict` reloads).
Future<void> updateMyPerson(
  WidgetRef ref, {
  required Person current,
  String? displayName,
  String? gateContactPhone,
  bool clearGatePhone = false,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) return;
  await unwrap(
    () => api.people.peopleUpdateMyPerson(
      orgId: scope.orgId,
      ifMatch: '"${current.version}"',
      myPersonUpdate: MyPersonUpdate(
        displayName: displayName,
        gateContactPhone: clearGatePhone ? null : gateContactPhone,
      ),
    ),
  );
  ref
    ..invalidate(myPersonProvider)
    ..invalidate(meProvider);
}

/// Directory opt-in of one site (S8).
Future<void> setDirectoryConsent(
  WidgetRef ref, {
  required String siteId,
  required bool consent,
  required bool showPhone,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) return;
  await unwrap(
    () => api.people.peopleSetMyDirectoryConsent(
      orgId: scope.orgId,
      directoryConsent: DirectoryConsent(
        siteId: siteId,
        consent: consent,
        showPhone: consent && showPhone,
      ),
    ),
  );
  ref.invalidate(myPersonProvider);
}

/// Devices signed in to my account.
final sessionsProvider = StreamProvider<CacheState<List<Session>>>((ref) {
  return watchCached<List<Session>>(
    ref,
    key: 'sessions',
    fetch: (api) async => [
      for (final s in (await unwrap(api.me.meListSessions)).items) s.toJson(),
    ],
    decode: (j) => decodeList(j, Session.fromJson),
  );
});

Future<void> revokeSession(WidgetRef ref, String id) async {
  final api = ref.read(apiProvider);
  if (api == null) return;
  await unwrapVoid(() => api.me.meRevokeSession(id: id));
  ref.invalidate(sessionsProvider);
}

// ---------------------------------------------------------------------------
// App lock (mobile plan section 13): biometric or device credential.
// ---------------------------------------------------------------------------

const _lockPref = 'app_lock_enabled';

/// The lock setting and its runtime state.
@immutable
class AppLockState {
  const new({this.enabled = false, this.locked = false, this.loaded = false});

  final bool enabled;

  /// The lock screen is up.
  final bool locked;
  final bool loaded;

  AppLockState copyWith({bool? enabled, bool? locked, bool? loaded}) =>
      AppLockState(
        enabled: enabled ?? this.enabled,
        locked: locked ?? this.locked,
        loaded: loaded ?? this.loaded,
      );
}

class AppLockController extends Notifier<AppLockState> {
  DateTime? _pausedAt;

  /// Re-lock after this long in the background.
  static const grace = Duration(seconds: 30);

  @override
  AppLockState build() {
    unawaited(_load());
    return const AppLockState();
  }

  Future<void> _load() async {
    var enabled = false;
    try {
      enabled =
          (await SharedPreferences.getInstance()).getBool(_lockPref) ?? false;
    } on Object {
      // Default: off.
    }
    state = AppLockState(enabled: enabled, locked: enabled, loaded: true);
  }

  /// Turns the lock on or off after proving presence once.
  Future<LockResult> setEnabled({
    required bool enable,
    required String reason,
  }) async {
    final auth = ref.read(lockAuthenticatorProvider);
    if (enable && !await auth.isAvailable()) return LockResult.unavailable;
    final result = await auth.authenticate(reason);
    if (result != LockResult.success) return result;
    state = state.copyWith(enabled: enable, locked: false);
    try {
      await (await SharedPreferences.getInstance()).setBool(_lockPref, enable);
    } on Object {
      // In-memory only.
    }
    return LockResult.success;
  }

  Future<LockResult> unlock(String reason) async {
    final result = await ref
        .read(lockAuthenticatorProvider)
        .authenticate(reason);
    if (result == LockResult.success) state = state.copyWith(locked: false);
    // The device lost its credentials: do not lock the user out of the app.
    if (result == LockResult.unavailable) {
      state = state.copyWith(locked: false);
    }
    return result;
  }

  void lifecycle(AppLifecycleState s) {
    if (!state.enabled) return;
    if (s == AppLifecycleState.paused) {
      _pausedAt = DateTime.now();
    } else if (s == AppLifecycleState.resumed) {
      final at = _pausedAt;
      _pausedAt = null;
      if (at != null && DateTime.now().difference(at) >= grace) {
        state = state.copyWith(locked: true);
      }
    }
  }
}

final appLockProvider = NotifierProvider<AppLockController, AppLockState>(
  AppLockController.new,
);

// ---------------------------------------------------------------------------
// Language setting.
// ---------------------------------------------------------------------------

const _localePref = 'locale';

/// Loads the saved language and applies it; `null` follows the device.
Future<void> restoreLocale(WidgetRef ref) async {
  try {
    final code = (await SharedPreferences.getInstance()).getString(_localePref);
    if (code != null) ref.read(localeProvider.notifier).set(Locale(code));
  } on Object {
    // Device language.
  }
}

Future<void> saveLocale(WidgetRef ref, Locale? locale) async {
  ref.read(localeProvider.notifier).set(locale);
  try {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_localePref);
    } else {
      await prefs.setString(_localePref, locale.languageCode);
    }
  } on Object {
    // Applied for this run only.
  }
}
