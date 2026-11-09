import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// A canned HTTP answer.
class FakeResponse {
  const new(this.status, [this.body, this.headers = const {}]);

  /// 200 with a JSON [body].
  const new ok(Object? body) : this(200, body);

  /// A problem+json answer.
  factory problem(
    int status,
    String code, {
    String? detail,
    List<Map<String, Object?>>? errors,
    Map<String, List<String>> headers = const {},
  }) => FakeResponse(status, {
    'type': 'about:blank',
    'title': 'problem',
    'status': status,
    'code': code,
    'detail': ?detail,
    'errors': ?errors,
    'instance': 'req-1',
  }, headers);

  final int status;
  final Object? body;
  final Map<String, List<String>> headers;
}

typedef FakeHandler = FutureOr<FakeResponse> Function(RequestOptions options);

/// A Dio adapter that answers from handlers keyed `'METHOD /path'` and records
/// every request, so tests need no network.
class FakeAdapter implements HttpClientAdapter {
  final Map<String, FakeHandler> _handlers = {};
  final List<RequestOptions> requests = [];

  /// Sets the handler of `'GET /v1/me'`.
  void on(String key, FakeHandler handler) => _handlers[key] = handler;

  /// A fixed answer for [key].
  void answer(String key, FakeResponse response) =>
      _handlers[key] = (_) => response;

  /// Requests seen for [key].
  List<RequestOptions> seen(String key) => [
    for (final r in requests)
      if ('${r.method} ${r.path}' == key) r,
  ];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final key = '${options.method} ${options.path}';
    final handler = _handlers[key];
    if (handler == null) {
      return _body(const FakeResponse(404, {'code': 'not_found'}));
    }
    return _body(await handler(options));
  }

  ResponseBody _body(FakeResponse r) {
    final text = r.body == null ? '' : json.encode(r.body);
    return ResponseBody.fromString(
      text,
      r.status,
      headers: {
        Headers.contentTypeHeader: [
          if (r.status >= 400)
            'application/problem+json'
          else
            'application/json; charset=utf-8',
        ],
        ...r.headers,
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// An adapter that fails like a dead network.
class OfflineAdapter implements HttpClientAdapter {
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    calls++;
    throw DioException(
      requestOptions: options,
      type: DioExceptionType.connectionError,
    );
  }

  @override
  void close({bool force = false}) {}
}

/// JSON of a token response.
Map<String, Object?> tokenJson({
  String access = 'access-1',
  String refresh = 'refresh-1',
  DateTime? accessExpires,
  String userId = '0192a3f0-1000-7000-8000-0000000000aa',
}) => {
  'token_type': 'Bearer',
  'access_token': access,
  'access_expires_at': (accessExpires ?? DateTime.utc(2099)).toIso8601String(),
  'refresh_token': refresh,
  'refresh_expires_at': DateTime.utc(2099, 6).toIso8601String(),
  'session_id': '0192a3f0-1000-7000-8000-0000000000bb',
  'user': {
    'id': userId,
    'email': null,
    'phone': '+905321234567',
    'locale': 'tr',
    'is_platform_admin': false,
    'version': 1,
  },
};

/// JSON of a discovery document.
Map<String, Object?> discoveryJson({
  String serverVersion = '0.3.0',
  String minAndroid = '1.0.0',
  List<String> apiVersions = const ['v1'],
  List<String> methods = const ['password', 'sms_otp', 'magic_link'],
  String name = 'Gul Sitesi',
  String? primaryColor,
}) => {
  'instance_id': '0192a3f0-1000-7000-8000-000000000999',
  'instance_name': name,
  'api_base_url': 'https://example.org/v1',
  'api_versions': apiVersions,
  'server_version': serverVersion,
  'sdk_version': null,
  'min_app_version': {'android': minAndroid, 'ios': '1.0.0'},
  'auth_methods': [
    for (final m in methods) {'id': m},
  ],
  'push': {
    'relay_ids': ['official'],
    'unified_push': false,
  },
  'packs': <String>[],
  'pack_details': <Object?>[],
  'branding': {'primary_color': ?primaryColor},
  'relay_enrollment': {'challenge': null},
};

/// JSON of `GET /v1/me`.
Map<String, Object?> meJson({
  String name = 'Ayse Yilmaz',
  List<Map<String, Object?>> occupancies = const [],
  List<Map<String, Object?>> organizations = const [],
}) => {
  'user': {
    'id': '0192a3f0-1000-7000-8000-0000000000aa',
    'display_name': name,
    'email': null,
    'phone': '+905321234567',
    'locale': 'tr',
    'is_platform_admin': false,
    'version': 1,
  },
  'organizations': organizations,
  'occupancies': occupancies,
  'policies': {'app_lock_required': false, 'reauth_window_minutes': 10},
};
