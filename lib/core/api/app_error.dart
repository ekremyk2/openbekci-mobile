import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// One field problem from `errors[]` of an RFC 9457 problem document.
@immutable
class FieldError {
  const new({required this.field, required this.code, this.params});

  factory fromJson(Map<String, Object?> json) => FieldError(
    field: (json['field'] as String?) ?? '',
    code: (json['code'] as String?) ?? 'invalid',
    params: json['params'] as Map<String, Object?>?,
  );

  final String field;
  final String code;
  final Map<String, Object?>? params;

  @override
  bool operator ==(Object other) =>
      other is FieldError && other.field == field && other.code == code;

  @override
  int get hashCode => Object.hash(field, code);
}

/// Every failed API call surfaces as an [AppError] (mobile plan section 4).
///
/// [code] is the backend's stable problem code (`validation_failed`,
/// `invalid_grant`, ...) or one of the client-side codes `network`, `timeout`,
/// `cancelled`, `unknown`, `insecure_server`, `not_openbekci`. Unknown codes
/// are kept verbatim; `errorMessage` falls back to a generic string.
@immutable
class AppError implements Exception {
  const new({
    required this.code,
    this.status,
    this.detail,
    this.title,
    this.requestId,
    this.fieldErrors = const [],
    this.retryable = false,
    this.retryAfter,
  });

  /// Builds the error from a problem+json body and its HTTP [status].
  factory fromProblem(Object? body, int? status, {Headers? headers}) {
    String? code;
    String? detail;
    String? title;
    String? requestId;
    var fields = <FieldError>[];
    if (body is Map) {
      final map = body.cast<String, Object?>();
      code = map['code'] as String?;
      detail = map['detail'] as String?;
      title = map['title'] as String?;
      requestId = (map['request_id'] ?? map['instance']) as String?;
      final errors = map['errors'];
      if (errors is List) {
        fields = [
          for (final e in errors)
            if (e is Map) FieldError.fromJson(e.cast<String, Object?>()),
        ];
      }
    }
    code ??= _codeForStatus(status);
    final retryAfterRaw = headers?.value('retry-after');
    final retryAfterSeconds = retryAfterRaw == null
        ? null
        : int.tryParse(retryAfterRaw);
    return AppError(
      code: code,
      status: status,
      detail: detail,
      title: title,
      requestId: requestId,
      fieldErrors: fields,
      retryable: _isRetryable(status, code),
      retryAfter: retryAfterSeconds == null
          ? null
          : Duration(seconds: retryAfterSeconds),
    );
  }

  /// Maps any thrown object (usually a [DioException]) to an [AppError].
  factory from(Object error) {
    if (error is AppError) return error;
    if (error is DioException) {
      final inner = error.error;
      if (inner is AppError) return inner;
      final response = error.response;
      switch (error.type) {
        case DioExceptionType.badResponse:
          return AppError.fromProblem(
            _problemBody(response?.data),
            response?.statusCode,
            headers: response?.headers,
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.transformTimeout:
          return const AppError(code: 'timeout', retryable: true);
        case DioExceptionType.cancel:
          return const AppError(code: 'cancelled');
        case DioExceptionType.connectionError:
          return const AppError(code: 'network', retryable: true);
        case DioExceptionType.badCertificate:
          return const AppError(code: 'bad_certificate');
        case DioExceptionType.unknown:
          return AppError(
            code: inner is Exception && _looksLikeNetwork(inner)
                ? 'network'
                : 'unknown',
            retryable: inner is Exception && _looksLikeNetwork(inner),
            detail: inner?.toString(),
          );
      }
    }
    return AppError(code: 'unknown', detail: error.toString());
  }

  final String code;
  final int? status;
  final String? detail;
  final String? title;
  final String? requestId;
  final List<FieldError> fieldErrors;

  /// Safe to repeat the same request (network, timeout, 429, 5xx).
  final bool retryable;
  final Duration? retryAfter;

  /// First field error for [field], if any.
  FieldError? fieldError(String field) {
    for (final e in fieldErrors) {
      if (e.field == field) return e;
    }
    return null;
  }

  bool get isUnauthenticated => status == 401 && code != 'invalid_grant';
  bool get isInvalidGrant => code == 'invalid_grant';
  bool get isReauthRequired => code == 'reauth_required';

  @override
  String toString() => 'AppError($code, status: $status, detail: $detail)';
}

/// Error bodies of binary downloads arrive as bytes; read them as JSON.
Object? _problemBody(Object? data) {
  if (data is List<int>) {
    try {
      return json.decode(utf8.decode(data));
    } on FormatException {
      return null;
    }
  }
  return data;
}

String _codeForStatus(int? status) {
  switch (status) {
    case 400:
      return 'bad_request';
    case 401:
      return 'unauthenticated';
    case 403:
      return 'insufficient_permission';
    case 404:
      return 'not_found';
    case 409:
      return 'conflict';
    case 413:
      return 'payload_too_large';
    case 422:
      return 'validation_failed';
    case 429:
      return 'rate_limited';
    case 504:
      return 'timeout';
  }
  if (status != null && status >= 500) return 'internal_error';
  return 'unknown';
}

bool _isRetryable(int? status, String code) {
  if (status == null) return false;
  if (status == 429 || status == 502 || status == 503 || status == 504) {
    return true;
  }
  if (status >= 500) return true;
  return code == 'timeout';
}

bool _looksLikeNetwork(Object e) {
  final s = e.runtimeType.toString();
  return s.contains('Socket') ||
      s.contains('Handshake') ||
      s.contains('HttpException') ||
      s.contains('ClientException');
}
