import 'dart:typed_data';

import 'package:dio/dio.dart' show DioMediaType, MultipartFile;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';

/// Files flow shared by tickets (and later bookings and visitors): the app
/// uploads through the server (`POST /files`), then references the ids.
class FilesRepository {
  const new(this.api);

  final ApiClient api;

  /// Uploads [bytes] as a draft file of [siteId] with its own idempotency
  /// key, so a retry after a lost response returns the first file. The
  /// multipart body is rebuilt on every attempt (a sent one is consumed).
  Future<File> upload({
    required String orgId,
    required String siteId,
    required Uint8List bytes,
    required String name,
    required String mime,
    required String idempotencyKey,
  }) async {
    AppError? last;
    for (var attempt = 0; attempt < 2; attempt++) {
      try {
        return await unwrap(
          () => api.operations.operationsUploadFile(
            orgId: orgId,
            siteId: siteId,
            name: name,
            idempotencyKey: idempotencyKey,
            file: MultipartFile.fromBytes(
              bytes,
              filename: name,
              contentType: DioMediaType.parse(mime),
            ),
          ),
        );
      } on AppError catch (e) {
        last = e;
        if (!e.retryable) rethrow;
      }
    }
    throw last!;
  }

  /// The content of a file (`variant` is `thumb` or `medium` for images).
  Future<Uint8List> content({
    required String orgId,
    required String fileId,
    String? variant,
  }) => api.getBytes(
    '/v1/orgs/$orgId/files/$fileId',
    query: {'variant': ?variant},
  );
}

final filesRepositoryProvider = Provider<FilesRepository?>((ref) {
  final api = ref.watch(apiProvider);
  return api == null ? null : FilesRepository(api);
});

/// Bytes of a file (an image variant or the original), fetched through the
/// authenticated client and kept for the session.
final fileBytesProvider =
    FutureProvider.family<Uint8List, ({String fileId, String? variant})>((
      ref,
      q,
    ) async {
      final scope = ref.watch(scopeProvider);
      final repo = ref.watch(filesRepositoryProvider);
      if (scope == null || repo == null) {
        throw const AppError(code: 'unauthenticated');
      }
      return await repo.content(
        orgId: scope.orgId,
        fileId: q.fileId,
        variant: q.variant,
      );
    });
