import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/auth/token_manager.dart';

/// `extra` keys used between the interceptors.
abstract final class ApiExtra {
  /// Do not attach a bearer token (anonymous endpoint).
  static const skipAuth = 'obk.skipAuth';
  static const usedToken = 'obk.usedToken';
  static const authRetried = 'obk.authRetried';
  static const retryCount = 'obk.retryCount';
}

/// Endpoints that never carry a bearer token and never trigger a refresh.
const _anonymousPaths = <String>{
  '/.well-known/openbekci.json',
  '/v1/auth/token',
  '/v1/auth/token/refresh',
  '/v1/auth/otp',
  '/v1/auth/magic-link',
  '/v1/auth/magic-link/consume',
  '/v1/auth/session',
};

bool _isAnonymous(RequestOptions o) {
  if (o.extra[ApiExtra.skipAuth] == true) return true;
  if (_anonymousPaths.contains(o.path)) return true;
  // /v1/join/{code}[/units] and /v1/invitations/{token} are public reads.
  if (o.method == 'GET' &&
      (o.path.startsWith('/v1/join/') ||
          o.path.startsWith('/v1/invitations/'))) {
    return true;
  }
  return false;
}

/// Adds `User-Agent`, `Accept-Language`, `X-Request-Id` and, for mutating
/// requests outside `/v1/auth`, an `Idempotency-Key` (generated once per
/// logical request, so retries reuse it).
class HeadersInterceptor extends Interceptor {
  new({required this.userAgent, required this.locale, Random? random})
    : _random = random ?? Random.secure();

  final String userAgent;

  /// BCP 47 tag of the app's chosen locale, e.g. `tr`.
  final String Function() locale;
  final Random _random;

  static const _mutating = {'POST', 'PUT', 'PATCH', 'DELETE'};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers
      ..putIfAbsent('User-Agent', () => userAgent)
      ..putIfAbsent('Accept-Language', locale)
      ..putIfAbsent('Accept', () => 'application/json');
    options.headers['X-Request-Id'] = newId(_random);
    if (_mutating.contains(options.method) &&
        !options.path.startsWith('/v1/auth/') &&
        !options.headers.containsKey('Idempotency-Key')) {
      options.headers['Idempotency-Key'] = newId(_random);
    }
    handler.next(options);
  }

  /// A random v4-style UUID.
  static String newId(Random random) {
    final b = List<int>.generate(16, (_) => random.nextInt(256));
    b[6] = (b[6] & 0x0f) | 0x40;
    b[8] = (b[8] & 0x3f) | 0x80;
    String h(int from, int to) => b
        .sublist(from, to)
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join();
    return '${h(0, 4)}-${h(4, 6)}-${h(6, 8)}-${h(8, 10)}-${h(10, 16)}';
  }
}

/// Attaches the bearer token and runs the single-flight refresh on `401`
/// (mobile plan section 6). A request is retried at most once after a refresh.
class AuthInterceptor extends Interceptor {
  new({required this.tokens, required this.dio});

  final TokenManager tokens;

  /// The Dio this interceptor is installed on (used to replay requests).
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAnonymous(options)) return handler.next(options);
    try {
      final token = await tokens.validAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
        options.extra[ApiExtra.usedToken] = token;
      }
      handler.next(options);
    } on AppError catch (e) {
      handler.reject(DioException(requestOptions: options, error: e));
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final used = options.extra[ApiExtra.usedToken] as String?;
    if (err.response?.statusCode != 401 ||
        used == null ||
        options.extra[ApiExtra.authRetried] == true ||
        _isAnonymous(options)) {
      return handler.next(err);
    }
    final String fresh;
    try {
      fresh = await tokens.refreshAfterUnauthorized(used);
    } on AppError catch (e) {
      return handler.next(
        DioException(
          requestOptions: options,
          response: err.response,
          type: DioExceptionType.badResponse,
          error: e,
        ),
      );
    }
    options
      ..headers['Authorization'] = 'Bearer $fresh'
      ..extra[ApiExtra.authRetried] = true
      ..extra[ApiExtra.usedToken] = fresh;
    try {
      handler.resolve(await dio.fetch<Object?>(options));
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}

/// Retries transient failures (network, timeout, 429, 502-504) with backoff.
/// Only `GET`/`HEAD` and requests that carry an `Idempotency-Key` are retried,
/// so a timeout cannot double-create (mobile plan section 8).
class RetryInterceptor extends Interceptor {
  new({
    required this.dio,
    this.maxRetries = 2,
    this.baseDelay = const Duration(milliseconds: 400),
    Future<void> Function(Duration)? delay,
  }) : _delay = delay ?? Future<void>.delayed;

  final Dio dio;
  final int maxRetries;
  final Duration baseDelay;
  final Future<void> Function(Duration) _delay;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final o = err.requestOptions;
    final count = (o.extra[ApiExtra.retryCount] as int?) ?? 0;
    final safe =
        o.method == 'GET' ||
        o.method == 'HEAD' ||
        o.headers.containsKey('Idempotency-Key');
    final error = AppError.from(err);
    final transient = error.retryable && error.status != 500; // 500 is not a transient signal // 500 is not a transient signal
    if (!safe || !transient || count >= maxRetries) {
      return handler.next(err);
    }
    var wait = baseDelay * pow(2, count).toInt();
    final ra = error.retryAfter;
    if (ra != null) {
      if (ra > const Duration(seconds: 5)) return handler.next(err);
      wait = ra;
    }
    await _delay(wait);
    o.extra[ApiExtra.retryCount] = count + 1;
    try {
      handler.resolve(await dio.fetch<Object?>(o));
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}

/// Logs one line per request without bodies, query values or credentials.
class ScrubbingLogInterceptor extends Interceptor {
  new(this.logger);

  final Logger logger;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.d(
      '${response.requestOptions.method} '
      '${scrubUrl(response.requestOptions.uri)} -> ${response.statusCode}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.w(
      '${err.requestOptions.method} ${scrubUrl(err.requestOptions.uri)} '
      '-> ${err.response?.statusCode ?? err.type.name}',
    );
    handler.next(err);
  }
}

final _secretKeys = RegExp(
  '(token|code|password|secret|authorization)',
  caseSensitive: false,
);

/// A URL safe to log: query values of secret-looking keys are masked, and path
/// segments after `/invite/`, `/invitations/`, `/join/` and `/login/` are
/// hidden (they are bearer-like secrets).
String scrubUrl(Uri uri) {
  final query = <String, String>{
    for (final e in uri.queryParameters.entries)
      e.key: _secretKeys.hasMatch(e.key) ? '***' : e.value,
  };
  final segments = [...uri.pathSegments];
  for (var i = 0; i < segments.length - 1; i++) {
    final s = segments[i];
    if (s == 'invite' || s == 'invitations' || s == 'join' || s == 'link') {
      segments[i + 1] = '***';
    }
  }
  return uri
      .replace(
        pathSegments: segments,
        queryParameters: query.isEmpty ? null : query,
      )
      .toString();
}

/// Replaces credentials in free text (log lines, headers) with `***`.
String scrubText(String text) => text
    .replaceAllMapped(
      RegExp(r'(Bearer\s+)[A-Za-z0-9._~+/=-]+'),
      (m) => '${m[1]}***',
    )
    .replaceAllMapped(
      RegExp(
        r'("?(?:refresh_token|access_token|password|code|token)"?\s*[:=]\s*"?)[^"&,\s}]+',
        caseSensitive: false,
      ),
      (m) => '${m[1]}***',
    );

/// Turns every failure into a [DioException] whose `error` is an [AppError],
/// so callers only deal with `AppError.from(e)`.
class ErrorMappingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is AppError) return handler.next(err);
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: AppError.from(err),
        stackTrace: err.stackTrace,
      ),
    );
  }
}
