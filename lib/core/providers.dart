import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/auth/auth_repository.dart';
import 'package:openbekci_mobile/core/auth/token_manager.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/db/database.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/instance/server_connector.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/org/org_context.dart'
    show selectedOrgPref, selectedOrgProvider;
import 'package:shared_preferences/shared_preferences.dart';

/// Build-time configuration; overridden in `main` after the asset is loaded.
final appConfigProvider = Provider<AppConfig>(
  (ref) => throw UnimplementedError('appConfigProvider must be overridden'),
);

/// App version and build number (from the platform), overridden in `main`.
class AppInfo {
  const new({required this.version, required this.build});
  final String version;
  final String build;
}

final appInfoProvider = Provider<AppInfo>(
  (ref) => const AppInfo(version: '1.0.0', build: '1'),
);

final accountStoreProvider = Provider<AccountStore>(
  (ref) => SecureAccountStore(),
);

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// Test seam: a fake HTTP adapter for every Dio the app builds.
final httpAdapterProvider = Provider<HttpClientAdapter?>((ref) => null);

final loggerProvider = Provider<Logger>(
  (ref) => Logger(
    level: ref.watch(appConfigProvider).flavor.isDev
        ? Level.debug
        : Level.warning,
    printer: SimplePrinter(colors: false),
  ),
);

/// The user's locale setting; `null` follows the device (locale chain of the
/// mobile plan section 12: user setting, device, organization default, en).
class LocaleController extends Notifier<Locale?> {
  @override
  Locale? build() => null;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void set(Locale? locale) => state = locale;
}

final localeProvider = NotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
);

String _acceptLanguage(Ref ref) {
  final chosen = ref.read(localeProvider);
  return (chosen ?? PlatformDispatcher.instance.locale).toLanguageTag();
}

String _userAgent(Ref ref) {
  final info = ref.read(appInfoProvider);
  return 'OpenBekci-Mobile/${info.version} (android; ${info.build})';
}

/// An anonymous client (no bearer token) for origin: discovery, sign-in,
/// public join and invitation reads.
final anonymousApiProvider = Provider.family<ApiClient, String>((ref, origin) {
  return ApiClient.create(
    origin: origin,
    userAgent: _userAgent(ref),
    locale: () => _acceptLanguage(ref),
    adapter: ref.watch(httpAdapterProvider),
    logger: ref.watch(loggerProvider),
  );
});

final serverConnectorProvider = Provider<ServerConnector>((ref) {
  return HttpServerConnector(
    allowInsecureLocal: ref.watch(appConfigProvider).flavor.isDev,
    clientFor: (origin) => ref.read(anonymousApiProvider(origin)),
  );
});

/// The server the user is connecting to (validated discovery), before or
/// while signing in. Cleared on sign-out.
class PendingServerController extends Notifier<Discovery?> {
  @override
  Discovery? build() => null;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void set(Discovery? discovery) => state = discovery;
}

final pendingServerProvider =
    NotifierProvider<PendingServerController, Discovery?>(
      PendingServerController.new,
    );

/// A link that arrived before the app could act on it (no server yet, or not
/// signed in); resumed after connecting / signing in.
class PendingLinkController extends Notifier<AppLink?> {
  @override
  AppLink? build() => null;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void set(AppLink? link) => state = link;
}

final pendingLinkProvider = NotifierProvider<PendingLinkController, AppLink?>(
  PendingLinkController.new,
);

/// The server the app is currently talking to: the signed-in account's, else
/// the pending one.
final currentOriginProvider = Provider<String?>((ref) {
  final account = ref.watch(accountProvider).value;
  return account?.serverOrigin ?? ref.watch(pendingServerProvider)?.origin;
});

/// Anonymous sign-in methods of the pending server.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final origin = ref.watch(pendingServerProvider.select((d) => d?.origin));
  if (origin == null) {
    throw StateError('authRepositoryProvider needs a pending server');
  }
  return ApiAuthRepository(
    ref.watch(anonymousApiProvider(origin)),
    deviceName: 'OpenBekci app (Android)',
  );
});

/// The single account (or null when signed out); loaded from secure storage.
/// Pure state: session orchestration lives in [SessionActions] so this
/// provider never reads providers that depend on it.
class AccountController extends AsyncNotifier<Account?> {
  @override
  Future<Account?> build() => ref.read(accountStoreProvider).readAccount();

  /// Persists and publishes [account].
  Future<void> set(Account account) async {
    await ref.read(accountStoreProvider).writeAccount(account);
    state = AsyncData(account);
  }

  /// Forgets the account (the caller wipes storage).
  void clear() => state = const AsyncData(null);

  /// Remembers the display name once `/v1/me` has it.
  Future<void> updateDisplayName(String name) async {
    final current = state.value;
    if (current == null || current.displayName == name) return;
    await set(current.copyWith(displayName: name));
  }
}

final accountProvider = AsyncNotifierProvider<AccountController, Account?>(
  AccountController.new,
);

/// Sign-in completion, sign-out and session loss (mobile plan sections 5.2
/// and 6). Reads the other providers lazily, at call time.
class SessionActions {
  new(this._ref);

  final Ref _ref;

  /// Stores the account and its tokens after any sign-in method succeeded.
  Future<void> completeSignIn(Discovery server, SignInResult result) async {
    // Never inherit another session's cached rows (a wipe interrupted by a
    // crash, or a different user on the same instance).
    await _ref.read(databaseProvider).clearAll();
    final store = _ref.read(accountStoreProvider);
    await store.writeRefreshToken(result.refreshToken);
    await _ref
        .read(accountProvider.notifier)
        .set(
          Account(
            serverOrigin: server.origin,
            instanceId: server.instanceId,
            instanceName: server.instanceName,
            userId: result.userId,
            displayName: result.displayName,
          ),
        );
    await _ref
        .read(tokenManagerProvider)!
        .setTokens(
          accessToken: result.accessToken,
          accessExpiresAt: result.accessExpiresAt,
          refreshToken: result.refreshToken,
        );
    _ref.read(pendingServerProvider.notifier).set(null);
  }

  /// Revokes the session server-side (best effort), then wipes everything:
  /// secure storage, in-memory token and the cache database.
  Future<void> signOut() async {
    final api = _ref.read(apiProvider);
    if (api != null) {
      try {
        await unwrapVoid(() => api.me.meRevokeSession(id: 'current'));
      } on Object {
        // Offline or already revoked: wiping locally is what matters.
      }
    }
    await _wipe();
  }

  /// The server rejected the refresh token: sign out locally.
  Future<void> sessionLost() => _wipe();

  Future<void> _wipe() async {
    _ref.read(tokenManagerProvider)?.clearMemory();
    try {
      await _ref.read(accountStoreProvider).clear();
    } finally {
      // The cache goes even if secure storage failed, and the UI always
      // leaves the signed-in state.
      try {
        await _ref.read(databaseProvider).clearAll();
        unawaited(wipeAccountPrefs());
      } finally {
        _ref.invalidate(selectedOrgProvider);
        _ref.read(pendingLinkProvider.notifier).set(null);
        _ref.read(accountProvider.notifier).clear();
      }
    }
  }
}

final sessionProvider = Provider<SessionActions>(SessionActions.new);

/// Token handling for the signed-in account; rebuilt only when the server
/// changes, so the in-memory access token survives profile updates.
final tokenManagerProvider = Provider<TokenManager?>((ref) {
  final origin = ref.watch(
    accountProvider.select((a) => a.value?.serverOrigin),
  );
  if (origin == null) return null;
  final refreshClient = ApiClient.create(
    origin: origin,
    userAgent: _userAgent(ref),
    locale: () => _acceptLanguage(ref),
    adapter: ref.watch(httpAdapterProvider),
    logger: ref.watch(loggerProvider),
  );
  return TokenManager(
    store: ref.read(accountStoreProvider),
    refreshDio: refreshClient.dio,
    onSessionLost: () => ref.read(sessionProvider).sessionLost(),
  );
});

/// Authenticated client for the signed-in account (null when signed out).
final apiProvider = Provider<ApiClient?>((ref) {
  final origin = ref.watch(
    accountProvider.select((a) => a.value?.serverOrigin),
  );
  final tokens = ref.watch(tokenManagerProvider);
  if (origin == null || tokens == null) return null;
  return ApiClient.create(
    origin: origin,
    userAgent: _userAgent(ref),
    locale: () => _acceptLanguage(ref),
    tokens: tokens,
    adapter: ref.watch(httpAdapterProvider),
    logger: ref.watch(loggerProvider),
  );
});

/// Read cache for the signed-in account, keyed by instance id.
final cachePolicyProvider = Provider<CachePolicy?>((ref) {
  final id = ref.watch(accountProvider.select((a) => a.value?.instanceId));
  if (id == null) return null;
  return CachePolicy(db: ref.watch(databaseProvider), instanceId: id);
});

/// `GET /v1/me` with stale-while-revalidate over the drift cache.
final meProvider = StreamProvider<CacheState<Me>>((ref) {
  final api = ref.watch(apiProvider);
  final cache = ref.watch(cachePolicyProvider);
  if (api == null || cache == null) return const Stream.empty();
  return cache.watch<Me>(
    key: 'me',
    fetch: () async => (await unwrap(api.me.meGet)).toJson(),
    decode: (json) => Me.fromJson(json! as Map<String, dynamic>),
  );
});

/// Saved drafts are keyed `ticket_draft_v1/<user>/<org>` (see
/// `ticketDraftPrefPrefix`).
const accountScopedPrefPrefixes = ['ticket_draft_v1'];

/// Forgets what the signed-out account left in preferences: the selected
/// organization and the saved drafts. Device settings (language, app lock)
/// stay.
Future<void> wipeAccountPrefs() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(selectedOrgPref);
    for (final key in prefs.getKeys().toList()) {
      if (accountScopedPrefPrefixes.any(key.startsWith)) {
        await prefs.remove(key);
      }
    }
  } on Object {
    // Preferences are a convenience; the secrets are wiped elsewhere.
  }
}
