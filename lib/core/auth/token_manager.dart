import 'dart:async';

import 'package:dio/dio.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';

/// Holds the short-lived access token in memory and the rotating refresh token
/// in the [AccountStore] (mobile plan section 6). Tokens are opaque strings:
/// nothing here parses them.
///
/// Refreshing is **single flight**: concurrent callers share one in-flight
/// request, and a caller whose token was already replaced by a finished
/// refresh does not trigger another one. That matters because the refresh
/// token is single use; a second concurrent refresh would present a rotated
/// token and make the server revoke the whole session.
class TokenManager {
  new({
    required this._store,
    required Dio refreshDio,
    DateTime Function()? now,
    this.onSessionLost,
    this.expirySkew = const Duration(seconds: 30),
  }) : _auth = AuthApi(refreshDio),
       _now = now ?? DateTime.now;

  final AccountStore _store;
  final AuthApi _auth;
  final DateTime Function() _now;
  final Duration expirySkew;

  /// Called once when the server rejected the refresh token (`invalid_grant`)
  /// or no refresh token exists: the account must be signed out.
  final Future<void> Function()? onSessionLost;

  String? _access;
  DateTime? _accessExpiresAt;
  Future<String>? _inflight;

  /// Bumped by [clearMemory]: a refresh that started before a sign-out must
  /// not write its tokens back afterwards.
  int _epoch = 0;

  /// Number of refresh requests actually sent (for tests and diagnostics).
  int refreshCount = 0;

  /// The current access token, if any (may be expired).
  String? get currentAccessToken => _access;

  /// Installs a freshly issued token pair (sign-in or refresh).
  Future<void> setTokens({
    required String accessToken,
    required DateTime accessExpiresAt,
    required String refreshToken,
  }) async {
    // Persist the rotated refresh token first: losing it would strand the
    // session even though the server already moved on.
    await _store.writeRefreshToken(refreshToken);
    _access = accessToken;
    _accessExpiresAt = accessExpiresAt;
  }

  /// Forgets the in-memory token (sign-out).
  void clearMemory() {
    _epoch++;
    _access = null;
    _accessExpiresAt = null;
  }

  bool get _isFresh {
    final exp = _accessExpiresAt;
    if (_access == null || exp == null) return false;
    return exp.isAfter(_now().add(expirySkew));
  }

  /// A token that is valid now, refreshing first if it is about to expire.
  /// Null when there is no session at all.
  Future<String?> validAccessToken() async {
    if (_isFresh) return _access;
    if (_inflight != null) return await _inflight;
    final hasRefresh = await _store.readRefreshToken() != null;
    if (!hasRefresh) return _access;
    return await refresh();
  }

  /// Called after a `401` for a request that carried [usedToken]. Returns the
  /// token to retry with; throws [AppError] when the session is gone.
  Future<String> refreshAfterUnauthorized(String? usedToken) {
    final current = _access;
    if (current != null && usedToken != null && current != usedToken) {
      return Future.value(current); // someone else already refreshed
    }
    return refresh();
  }

  /// Single-flight refresh.
  Future<String> refresh() {
    return _inflight ??= _doRefresh().whenComplete(() => _inflight = null);
  }

  Future<String> _doRefresh() async {
    final epoch = _epoch;
    final refreshToken = await _store.readRefreshToken();
    if (epoch != _epoch) {
      throw const AppError(code: 'invalid_grant', status: 401);
    }
    if (refreshToken == null) {
      await _lose();
      throw const AppError(code: 'invalid_grant', status: 401);
    }
    refreshCount++;
    try {
      final response = await _auth.authRefreshToken(
        refreshRequest: RefreshRequest(refreshToken: refreshToken),
      );
      final pair = response.data!;
      if (epoch != _epoch) {
        // Signed out while the request was in flight: drop the new pair and
        // do not touch the (possibly new) session.
        throw const _Superseded();
      }
      await setTokens(
        accessToken: pair.accessToken,
        accessExpiresAt: pair.accessExpiresAt,
        refreshToken: pair.refreshToken,
      );
      return pair.accessToken;
    } on _Superseded {
      throw const AppError(code: 'invalid_grant', status: 401);
    } on Object catch (e) {
      final error = AppError.from(e);
      if (epoch == _epoch && (error.isInvalidGrant || error.status == 401)) {
        await _lose();
      }
      throw error;
    }
  }

  Future<void> _lose() async {
    clearMemory();
    await onSessionLost?.call();
  }
}

/// A refresh outlived the session that started it.
class _Superseded implements Exception {
  const new();
}
