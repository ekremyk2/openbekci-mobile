import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// The single signed-in account of the app: a server and a user on it
/// (mobile plan section 5.2). Non-secret; the refresh token is stored apart.
@immutable
class Account {
  const new({
    required this.serverOrigin,
    required this.instanceId,
    required this.instanceName,
    required this.userId,
    this.displayName,
  });

  factory fromJson(Map<String, Object?> json) => Account(
    serverOrigin: json['server_origin']! as String,
    instanceId: json['instance_id']! as String,
    instanceName: (json['instance_name'] as String?) ?? '',
    userId: json['user_id']! as String,
    displayName: json['display_name'] as String?,
  );

  /// `scheme://host[:port]` of the server, without a path.
  final String serverOrigin;

  /// Stable instance identifier from discovery; keys the read cache.
  final String instanceId;
  final String instanceName;
  final String userId;
  final String? displayName;

  Account copyWith({String? displayName}) => Account(
    serverOrigin: serverOrigin,
    instanceId: instanceId,
    instanceName: instanceName,
    userId: userId,
    displayName: displayName ?? this.displayName,
  );

  Map<String, Object?> toJson() => {
    'server_origin': serverOrigin,
    'instance_id': instanceId,
    'instance_name': instanceName,
    'user_id': userId,
    'display_name': displayName,
  };
}

/// Where the account and its refresh token live. Production uses the platform
/// keystore; tests use [MemoryAccountStore].
abstract class AccountStore {
  Future<Account?> readAccount();
  Future<void> writeAccount(Account account);
  Future<String?> readRefreshToken();
  Future<void> writeRefreshToken(String token);

  /// Removes the account and the refresh token.
  Future<void> clear();
}

/// [AccountStore] on `flutter_secure_storage` (Android Keystore / iOS Keychain).
class SecureAccountStore implements AccountStore {
  new([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  static const _accountKey = 'obk.account.v1';
  static const _refreshKey = 'obk.refresh_token.v1';
  final FlutterSecureStorage _storage;

  @override
  Future<Account?> readAccount() async {
    final raw = await _storage.read(key: _accountKey);
    if (raw == null) return null;
    try {
      return Account.fromJson(json.decode(raw) as Map<String, Object?>);
    } on Object {
      return null;
    }
  }

  @override
  Future<void> writeAccount(Account account) =>
      _storage.write(key: _accountKey, value: json.encode(account.toJson()));

  @override
  Future<String?> readRefreshToken() => _storage.read(key: _refreshKey);

  @override
  Future<void> writeRefreshToken(String token) =>
      _storage.write(key: _refreshKey, value: token);

  @override
  Future<void> clear() async {
    await _storage.delete(key: _accountKey);
    await _storage.delete(key: _refreshKey);
  }
}

/// In-memory [AccountStore] for tests.
class MemoryAccountStore implements AccountStore {
  Account? account;
  String? refreshToken;

  @override
  Future<Account?> readAccount() async => account;

  @override
  Future<void> writeAccount(Account value) async => account = value;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> writeRefreshToken(String token) async => refreshToken = token;

  @override
  Future<void> clear() async {
    account = null;
    refreshToken = null;
  }
}
