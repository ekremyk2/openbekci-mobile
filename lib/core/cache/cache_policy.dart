import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/db/database.dart';

/// What a cached read looks like to the UI.
@immutable
class CacheState<T> {
  const new({this.data, this.fetchedAt, this.refreshing = false, this.error});

  /// The newest data we have (cached or fresh); null before anything loaded.
  final T? data;
  final DateTime? fetchedAt;

  /// A background refresh is running.
  final bool refreshing;

  /// The last refresh failed; [data] (if any) is stale.
  final AppError? error;

  bool get hasData => data != null;

  /// The refresh failed because the network is unreachable: show the subtle
  /// "offline" hint, not an error page.
  bool get isOffline =>
      error != null && (error!.code == 'network' || error!.code == 'timeout');

  bool get isStale => error != null && hasData;
}

/// Stale-while-revalidate over the drift cache (mobile plan section 8):
/// emit the cached document immediately, refetch in the background, emit the
/// fresh one; if the refetch fails keep the cached data and report the error.
class CachePolicy {
  new({required this.db, required this.instanceId, DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final AppDatabase db;
  final String instanceId;
  final DateTime Function() _now;

  /// Cached JSON for [key], if any.
  Future<({Object? json, DateTime fetchedAt})?> read(String key) async {
    final row = await db.readEntry(instanceId, key);
    if (row == null) return null;
    try {
      return (json: json.decode(row.payload), fetchedAt: row.fetchedAt);
    } on FormatException {
      return null;
    }
  }

  Future<void> write(String key, Object? jsonValue) => db.writeEntry(
    instanceId: instanceId,
    key: key,
    payload: json.encode(jsonValue),
    fetchedAt: _now(),
  );

  /// Streams cached-then-fresh states for [key].
  ///
  /// [fetch] returns the fresh JSON-encodable value; [decode] turns stored
  /// JSON back into [T]. [maxAge] only decides whether the cached value is
  /// shown as fresh enough to skip the refetch (default: always refetch).
  Stream<CacheState<T>> watch<T>({
    required String key,
    required Future<Object?> Function() fetch,
    required T Function(Object? json) decode,
    Duration? maxAge,
  }) async* {
    T? data;
    DateTime? at;
    final cached = await read(key);
    if (cached != null) {
      try {
        data = decode(cached.json);
        at = cached.fetchedAt;
      } on Object {
        data = null; // schema drift: ignore the stale row
      }
    }
    if (data != null) {
      yield CacheState(data: data, fetchedAt: at, refreshing: true);
      if (maxAge != null && _now().difference(at!) < maxAge) {
        yield CacheState(data: data, fetchedAt: at);
        return;
      }
    } else {
      yield const CacheState(refreshing: true);
    }
    try {
      final fresh = await fetch();
      await write(key, fresh);
      yield CacheState(data: decode(fresh), fetchedAt: _now());
    } on Object catch (e) {
      yield CacheState(data: data, fetchedAt: at, error: AppError.from(e));
    }
  }
}
