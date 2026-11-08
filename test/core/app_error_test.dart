import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';

void main() {
  group('AppError.fromProblem', () {
    test('reads code, detail, request id and field errors', () {
      final e = AppError.fromProblem(const {
        'type': 'about:blank',
        'title': 'Unprocessable Entity',
        'status': 422,
        'code': 'validation_failed',
        'detail': 'the request is not valid',
        'instance': 'req-42',
        'errors': [
          {
            'field': 'password',
            'code': 'too_short',
            'params': {'min': 10},
          },
          {'field': 'identifier', 'code': 'required'},
        ],
      }, 422);
      expect(e.code, 'validation_failed');
      expect(e.status, 422);
      expect(e.detail, 'the request is not valid');
      expect(e.requestId, 'req-42');
      expect(e.fieldErrors, hasLength(2));
      expect(e.fieldError('password')!.code, 'too_short');
      expect(e.fieldError('password')!.params, {'min': 10});
      expect(e.fieldError('nope'), isNull);
      expect(e.retryable, isFalse);
    });

    test('prefers request_id over instance when both are present', () {
      final e = AppError.fromProblem(const {
        'code': 'not_found',
        'request_id': 'a',
        'instance': 'b',
      }, 404);
      expect(e.requestId, 'a');
    });

    test('keeps an unknown code verbatim', () {
      final e = AppError.fromProblem(const {'code': 'brand_new_code'}, 409);
      expect(e.code, 'brand_new_code');
      expect(e.status, 409);
    });

    test('derives a code from the status when the body has none', () {
      expect(AppError.fromProblem(null, 401).code, 'unauthenticated');
      expect(AppError.fromProblem('<html>', 404).code, 'not_found');
      expect(AppError.fromProblem(null, 429).code, 'rate_limited');
      expect(AppError.fromProblem(null, 502).code, 'internal_error');
      expect(AppError.fromProblem(null, 418).code, 'unknown');
    });

    test('retryable for 429, 502-504 and 5xx, not for 4xx', () {
      for (final s in [429, 500, 502, 503, 504]) {
        expect(AppError.fromProblem(null, s).retryable, isTrue, reason: '$s');
      }
      for (final s in [400, 401, 403, 404, 409, 422]) {
        expect(AppError.fromProblem(null, s).retryable, isFalse, reason: '$s');
      }
    });

    test('reads Retry-After seconds', () {
      final e = AppError.fromProblem(
        const {'code': 'rate_limited'},
        429,
        headers: Headers.fromMap({
          'retry-after': ['7'],
        }),
      );
      expect(e.retryAfter, const Duration(seconds: 7));
    });

    test('ignores malformed errors[] entries', () {
      final e = AppError.fromProblem(const {
        'code': 'validation_failed',
        'errors': ['oops', 3, null],
      }, 422);
      expect(e.fieldErrors, isEmpty);
    });
  });

  group('AppError.from', () {
    RequestOptions ro() => RequestOptions(path: '/x');

    test('maps a badResponse DioException through the problem body', () {
      final e = AppError.from(
        DioException(
          requestOptions: ro(),
          type: DioExceptionType.badResponse,
          response: Response<Object?>(
            requestOptions: ro(),
            statusCode: 401,
            data: {'code': 'invalid_grant'},
          ),
        ),
      );
      expect(e.code, 'invalid_grant');
      expect(e.isInvalidGrant, isTrue);
      expect(e.isUnauthenticated, isFalse);
    });

    test('maps timeouts and connection errors to retryable codes', () {
      for (final t in [
        DioExceptionType.connectionTimeout,
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
      ]) {
        final e = AppError.from(DioException(requestOptions: ro(), type: t));
        expect(e.code, 'timeout');
        expect(e.retryable, isTrue);
      }
      final net = AppError.from(
        DioException(
          requestOptions: ro(),
          type: DioExceptionType.connectionError,
        ),
      );
      expect(net.code, 'network');
      expect(net.retryable, isTrue);
    });

    test('maps cancel and unknown', () {
      expect(
        AppError.from(
          DioException(requestOptions: ro(), type: DioExceptionType.cancel),
        ).code,
        'cancelled',
      );
      expect(AppError.from(StateError('x')).code, 'unknown');
    });

    test('unwraps an AppError carried in DioException.error', () {
      const inner = AppError(code: 'reauth_required', status: 403);
      final e = AppError.from(DioException(requestOptions: ro(), error: inner));
      expect(e, same(inner));
      expect(e.isReauthRequired, isTrue);
    });

    test('passes an AppError through', () {
      const inner = AppError(code: 'conflict');
      expect(AppError.from(inner), same(inner));
    });
  });
}
