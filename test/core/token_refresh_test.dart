import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/auth/token_manager.dart';

import '../support/fake_api.dart';

/// Builds an authenticated client over a [FakeAdapter] with tokens installed.
class Harness {
  new({DateTime? accessExpires, this.now}) {
    store.refreshToken = 'refresh-0';
    refreshClient = ApiClient.create(
      origin: 'https://example.org',
      userAgent: 'test',
      locale: () => 'en',
      adapter: adapter,
    );
    tokens = TokenManager(
      store: store,
      refreshDio: refreshClient.dio,
      now: now == null ? null : () => now!,
      onSessionLost: () async {
        lost++;
        await store.clear();
      },
    );
    api = ApiClient.create(
      origin: 'https://example.org',
      userAgent: 'test',
      locale: () => 'en',
      tokens: tokens,
      adapter: adapter,
    );
    ready = tokens.setTokens(
      accessToken: 'access-0',
      accessExpiresAt: accessExpires ?? DateTime.utc(2099),
      refreshToken: 'refresh-0',
    );
  }

  late final Future<void> ready;

  final adapter = FakeAdapter();
  final store = MemoryAccountStore();
  final DateTime? now;
  late final ApiClient refreshClient;
  late final TokenManager tokens;
  late final ApiClient api;
  int lost = 0;
}

Future<Harness> harness({DateTime? accessExpires, DateTime? now}) async {
  final h = Harness(accessExpires: accessExpires, now: now);
  await h.ready;
  return h;
}

void main() {
  group('single-flight refresh', () {
    test(
      'concurrent 401s share one refresh and all retry with the new token',
      () async {
        final h = await harness();
        var refreshCalls = 0;
        h.adapter
          ..on('POST /v1/auth/token/refresh', (o) async {
            refreshCalls++;
            await Future<void>.delayed(const Duration(milliseconds: 20));
            return FakeResponse.ok(tokenJson());
          })
          ..on('GET /v1/me', (o) {
            final auth = o.headers['Authorization'];
            if (auth == 'Bearer access-1') {
              return FakeResponse.ok(meJson());
            }
            return FakeResponse.problem(401, 'unauthenticated');
          });

        final results = await Future.wait([
          for (var i = 0; i < 8; i++) h.api.me.meGet(),
        ]);

        expect(results.every((r) => r.statusCode == 200), isTrue);
        expect(refreshCalls, 1, reason: 'one refresh for eight 401s');
        expect(h.tokens.refreshCount, 1);
        // 8 first attempts with the old token + 8 retries with the new one.
        expect(h.adapter.seen('GET /v1/me'), hasLength(16));
        expect(h.store.refreshToken, 'refresh-1', reason: 'rotation persisted');
        expect(h.tokens.currentAccessToken, 'access-1');
      },
    );

    test(
      'the refresh request itself carries the refresh token, no bearer',
      () async {
        final h = await harness();
        h.adapter
          ..answer('POST /v1/auth/token/refresh', FakeResponse.ok(tokenJson()))
          ..on(
            'GET /v1/me',
            (o) => o.headers['Authorization'] == 'Bearer access-1'
                ? FakeResponse.ok(meJson())
                : FakeResponse.problem(401, 'unauthenticated'),
          );
        await h.api.me.meGet();
        final req = h.adapter.seen('POST /v1/auth/token/refresh').single;
        expect(req.headers.containsKey('Authorization'), isFalse);
        expect(req.data, isNotNull);
      },
    );

    test(
      'a late 401 for an already replaced token does not refresh again',
      () async {
        final h = await harness();
        h.adapter
          ..answer('POST /v1/auth/token/refresh', FakeResponse.ok(tokenJson()))
          ..on(
            'GET /v1/me',
            (o) => o.headers['Authorization'] == 'Bearer access-1'
                ? FakeResponse.ok(meJson())
                : FakeResponse.problem(401, 'unauthenticated'),
          );
        await h.api.me.meGet(); // triggers refresh 0 -> 1
        expect(h.tokens.refreshCount, 1);
        // A request that was sent with access-0 fails after the refresh landed.
        final token = await h.tokens.refreshAfterUnauthorized('access-0');
        expect(token, 'access-1');
        expect(h.tokens.refreshCount, 1);
      },
    );

    test('a second 401 after the retry is surfaced, no refresh loop', () async {
      final h = await harness();
      h.adapter
        ..answer('POST /v1/auth/token/refresh', FakeResponse.ok(tokenJson()))
        ..answer('GET /v1/me', FakeResponse.problem(401, 'unauthenticated'));
      await expectLater(
        h.api.me.meGet(),
        throwsA(
          isA<DioException>().having(
            (e) => AppError.from(e).code,
            'code',
            'unauthenticated',
          ),
        ),
      );
      expect(h.tokens.refreshCount, 1);
      expect(h.adapter.seen('GET /v1/me'), hasLength(2));
    });

    test('invalid_grant signs the session out once', () async {
      final h = await harness();
      h.adapter
        ..answer(
          'POST /v1/auth/token/refresh',
          FakeResponse.problem(401, 'invalid_grant'),
        )
        ..answer('GET /v1/me', FakeResponse.problem(401, 'unauthenticated'));

      final futures = [
        for (var i = 0; i < 3; i++)
          h.api.me
              .meGet()
              .then<AppError?>((_) => null)
              .catchError(AppError.from),
      ];
      final errors = await Future.wait(futures);
      expect(errors.every((e) => e!.code == 'invalid_grant'), isTrue);
      expect(h.lost, 1, reason: 'onSessionLost fires once for the flight');
      expect(h.store.refreshToken, isNull);
      expect(h.tokens.currentAccessToken, isNull);
      expect(h.tokens.refreshCount, 1);
    });

    test('a network failure during refresh keeps the session', () async {
      final h = await harness();
      h.adapter
        ..on('POST /v1/auth/token/refresh', (o) {
          throw DioException(
            requestOptions: o,
            type: DioExceptionType.connectionError,
          );
        })
        ..answer('GET /v1/me', FakeResponse.problem(401, 'unauthenticated'));
      await expectLater(h.api.me.meGet(), throwsA(isA<DioException>()));
      expect(h.lost, 0);
      expect(h.store.refreshToken, 'refresh-0');
    });

    test(
      'refreshes proactively when the access token is about to expire',
      () async {
        final now = DateTime.utc(2030);
        final h = await harness(
          accessExpires: now.add(const Duration(seconds: 5)),
          now: now,
        );
        h.adapter
          ..answer(
            'POST /v1/auth/token/refresh',
            FakeResponse.ok(
              tokenJson(accessExpires: now.add(const Duration(minutes: 15))),
            ),
          )
          ..on(
            'GET /v1/me',
            (o) => o.headers['Authorization'] == 'Bearer access-1'
                ? FakeResponse.ok(meJson())
                : FakeResponse.problem(401, 'unauthenticated'),
          );
        await h.api.me.meGet();
        expect(
          h.adapter.seen('GET /v1/me'),
          hasLength(1),
          reason: 'no 401 dance',
        );
        expect(h.tokens.refreshCount, 1);
      },
    );

    test('no refresh token at all means session lost', () async {
      final h = await harness();
      h.store.refreshToken = null;
      await expectLater(
        h.tokens.refresh(),
        throwsA(isA<AppError>().having((e) => e.code, 'code', 'invalid_grant')),
      );
      expect(h.lost, 1);
    });
  });

  group('request headers and retry', () {
    test('anonymous endpoints carry no bearer token', () async {
      final h = await harness();
      h.adapter.answer('POST /v1/auth/token', FakeResponse.ok(tokenJson()));
      await h.api.dio.post<Object?>(
        '/v1/auth/token',
        data: {'method': 'password', 'identifier': 'a', 'password': 'b'},
      );
      final req = h.adapter.seen('POST /v1/auth/token').single;
      expect(req.headers.containsKey('Authorization'), isFalse);
      // /v1/auth is not idempotency-keyed
      expect(req.headers.containsKey('Idempotency-Key'), isFalse);
    });

    test('adds User-Agent, Accept-Language, request id and bearer', () async {
      final h = await harness();
      h.adapter.answer('GET /v1/me', FakeResponse.ok(meJson()));
      await h.api.me.meGet();
      final req = h.adapter.seen('GET /v1/me').single;
      expect(req.headers['User-Agent'], 'test');
      expect(req.headers['Accept-Language'], 'en');
      expect(req.headers['X-Request-Id'], isA<String>());
      expect(req.headers['Authorization'], 'Bearer access-0');
    });

    test(
      'a mutating request gets one Idempotency-Key and retries reuse it',
      () async {
        final h = await harness();
        var n = 0;
        h.adapter.on('POST /v1/orgs/o/things', (o) {
          n++;
          return n == 1
              ? FakeResponse.problem(503, 'internal_error')
              : const FakeResponse(201, {'ok': true});
        });
        final api = ApiClient.create(
          origin: 'https://example.org',
          userAgent: 'test',
          locale: () => 'en',
          tokens: h.tokens,
          adapter: h.adapter,
        );
        // Zero backoff: replace the retry delay by using a tiny base.
        final r = await api.dio.post<Object?>('/v1/orgs/o/things', data: {});
        expect(r.statusCode, 201);
        final seen = h.adapter.seen('POST /v1/orgs/o/things');
        expect(seen, hasLength(2));
        final k1 = seen[0].headers['Idempotency-Key'];
        expect(k1, isNotNull);
        expect(seen[1].headers['Idempotency-Key'], k1);
      },
    );

    test('GET is retried on a transient failure', () async {
      final h = await harness();
      var n = 0;
      h.adapter.on('GET /v1/me', (o) {
        n++;
        return n < 3
            ? FakeResponse.problem(503, 'internal_error')
            : FakeResponse.ok(meJson());
      });
      final r = await h.api.me.meGet();
      expect(r.statusCode, 200);
      expect(n, 3);
    });

    test('a 500 is not retried', () async {
      final h = await harness();
      h.adapter.answer(
        'GET /v1/me',
        FakeResponse.problem(500, 'internal_error'),
      );
      await expectLater(h.api.me.meGet(), throwsA(isA<DioException>()));
      expect(h.adapter.seen('GET /v1/me'), hasLength(1));
    });

    test('errors reach the caller as AppError', () async {
      final h = await harness();
      h.adapter.answer(
        'GET /v1/me',
        FakeResponse.problem(403, 'insufficient_permission'),
      );
      try {
        await unwrap(h.api.me.meGet);
        fail('should throw');
      } on AppError catch (e) {
        expect(e.code, 'insufficient_permission');
        expect(e.status, 403);
      }
    });
  });

  group('sign-out racing a refresh', () {
    test(
      'a refresh finishing after sign-out does not resurrect tokens',
      () async {
        final h = await harness();
        h.adapter.on('POST /v1/auth/token/refresh', (o) async {
          await Future<void>.delayed(const Duration(milliseconds: 30));
          return FakeResponse.ok(
            tokenJson(access: 'late-a', refresh: 'late-r'),
          );
        });
        final pending = h.tokens.refresh();
        final outcome = expectLater(pending, throwsA(isA<AppError>()));
        await Future<void>.delayed(const Duration(milliseconds: 5));
        // Sign-out: memory cleared, secure storage wiped.
        h.tokens.clearMemory();
        await h.store.clear();
        await outcome;
        expect(
          h.store.refreshToken,
          isNull,
          reason: 'refresh token stays wiped',
        );
        expect(h.tokens.currentAccessToken, isNull);
        expect(h.lost, 0, reason: 'a stale result must not wipe a new session');
      },
    );

    test('a stale 401 from before sign-out does not sign out again', () async {
      final h = await harness();
      h.adapter.on('POST /v1/auth/token/refresh', (o) async {
        await Future<void>.delayed(const Duration(milliseconds: 30));
        return FakeResponse.problem(401, 'invalid_grant');
      });
      final pending = h.tokens.refresh();
      final outcome = expectLater(pending, throwsA(isA<AppError>()));
      await Future<void>.delayed(const Duration(milliseconds: 5));
      h.tokens.clearMemory();
      await outcome;
      expect(h.lost, 0);
    });
  });
}
