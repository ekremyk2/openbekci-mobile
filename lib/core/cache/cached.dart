import 'dart:async';

import 'package:dio/dio.dart' show Response;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/providers.dart';

/// A cached, refreshing read: stale-while-revalidate over the drift cache
/// (mobile plan section 8). [fetch] returns a JSON-encodable value (model
/// `toJson()` or a list of them); [decode] rebuilds it.
Stream<CacheState<T>> watchCached<T>(
  Ref ref, {
  required String key,
  required Future<Object?> Function(ApiClient api) fetch,
  required T Function(Object? json) decode,
}) {
  final api = ref.watch(apiProvider);
  final cache = ref.watch(cachePolicyProvider);
  if (api == null || cache == null) return const Stream.empty();
  return cache.watch<T>(key: key, fetch: () => fetch(api), decode: decode);
}

/// Refreshes [provider] (re-running its stale-while-revalidate stream) and
/// completes when the refetch finished, for `RefreshIndicator.onRefresh`.
Future<void> refreshCached<T>(
  WidgetRef ref,
  StreamProvider<CacheState<T>> provider,
) async {
  ref.invalidate(provider);
  final done = Completer<void>();
  final sub = ref.listenManual<AsyncValue<CacheState<T>>>(provider, (_, next) {
    final v = next.value;
    if (v != null && !v.refreshing && !done.isCompleted) done.complete();
  }, fireImmediately: false);
  try {
    await done.future.timeout(const Duration(seconds: 40));
  } on TimeoutException {
    // The indicator stops; the screen keeps showing what it has.
  } finally {
    sub.close();
  }
}

/// Follows `next_cursor` for up to [maxPages] pages of a list endpoint
/// (refreshing means refetching the first page(s), mobile plan section 8).
Future<List<E>> fetchPages<E>(
  Future<({List<E> items, String? next})> Function(String? cursor) page, {
  int maxPages = 4,
}) async {
  final all = <E>[];
  String? cursor;
  for (var i = 0; i < maxPages; i++) {
    final p = await page(cursor);
    all.addAll(p.items);
    cursor = p.next;
    if (cursor == null || cursor.isEmpty) break;
  }
  return all;
}

/// Decodes a JSON list with [fromJson].
List<E> decodeList<E>(
  Object? json,
  E Function(Map<String, dynamic>) fromJson,
) => [
  for (final e in (json as List? ?? const <Object?>[]))
    fromJson((e! as Map).cast<String, dynamic>()),
];

/// Unwraps a generated call (see [unwrap]) for [fetchPages].
Future<T> call<T>(Future<Response<T>> Function() request) => unwrap(request);

/// Follows `next_cursor` to the end, for figures that must be computed over
/// the whole list (a balance). Never returns a partial list: more than
/// [maxPages] pages fail with an `incomplete` error instead.
Future<List<E>> fetchAllPages<E>(
  Future<({List<E> items, String? next})> Function(String? cursor) page, {
  int maxPages = 200,
}) async {
  final all = <E>[];
  String? cursor;
  for (var i = 0; i < maxPages; i++) {
    final p = await page(cursor);
    all.addAll(p.items);
    cursor = p.next;
    if (cursor == null || cursor.isEmpty) return all;
  }
  throw const AppError(code: 'incomplete_list');
}
