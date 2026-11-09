import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/api/interceptors.dart';
import 'package:openbekci_mobile/core/auth/token_manager.dart';

/// Dio plus the generated API classes for one server.
///
/// [origin] is `scheme://host[:port]`; the generated operations carry their
/// full `/v1/...` paths, so the discovery document's `api_base_url`
/// (`https://host/v1`) is reduced to its origin by [originOfApiBase].
class ApiClient {
  new _(this.dio, this.origin)
    : auth = AuthApi(dio),
      instance = InstanceApi(dio),
      me = MeApi(dio),
      people = PeopleApi(dio),
      dashboards = DashboardsApi(dio),
      money = MoneyApi(dio),
      operations = OperationsApi(dio),
      tenancy = TenancyApi(dio),
      codes = CodesApi(dio),
      community = CommunityApi(dio),
      governance = GovernanceApi(dio);

  /// Builds a client. Pass [tokens] for authenticated use; without it only
  /// anonymous endpoints work (discovery, sign-in).
  factory create({
    required String origin,
    required String userAgent,
    required String Function() locale,
    TokenManager? tokens,
    HttpClientAdapter? adapter,
    Logger? logger,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 30),
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: origin,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: receiveTimeout,
      ),
    );
    if (adapter != null) dio.httpClientAdapter = adapter;
    dio.interceptors.add(
      HeadersInterceptor(userAgent: userAgent, locale: locale),
    );
    if (tokens != null) {
      dio.interceptors.add(AuthInterceptor(tokens: tokens, dio: dio));
    }
    dio.interceptors
      ..add(RetryInterceptor(dio: dio))
      ..add(ScrubbingLogInterceptor(logger ?? Logger(level: Level.off)))
      ..add(ErrorMappingInterceptor());
    return ApiClient._(dio, origin);
  }

  final Dio dio;
  final String origin;
  final AuthApi auth;
  final InstanceApi instance;
  final MeApi me;
  final PeopleApi people;
  final DashboardsApi dashboards;
  final MoneyApi money;
  final OperationsApi operations;
  final TenancyApi tenancy;
  final CodesApi codes;
  final CommunityApi community;
  final GovernanceApi governance;

  /// GETs a binary body (statement PDF, a file's content) as bytes. The
  /// generated operations of the same endpoints decode JSON, so downloads go
  /// through Dio directly; errors still become [AppError].
  Future<Uint8List> getBytes(
    String path, {
    Map<String, Object?>? query,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.get<List<int>>(
        path,
        queryParameters: query,
        cancelToken: cancelToken,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {'Accept': '*/*'},
        ),
      );
      return Uint8List.fromList(response.data ?? const []);
    } on Object catch (e) {
      throw AppError.from(e);
    }
  }
}

/// Runs a generated call and returns its body; any failure becomes an
/// [AppError].
Future<T> unwrap<T>(Future<Response<T>> Function() call) async {
  try {
    final response = await call();
    final data = response.data;
    if (data == null) {
      throw const AppError(code: 'unknown', detail: 'empty response');
    }
    return data;
  } on Object catch (e) {
    throw AppError.from(e);
  }
}

/// Like [unwrap] for operations without a body.
Future<void> unwrapVoid(Future<Response<void>> Function() call) async {
  try {
    await call();
  } on Object catch (e) {
    throw AppError.from(e);
  }
}

/// `https://host/v1` (discovery `api_base_url`) to `https://host`.
String originOfApiBase(String apiBaseUrl) {
  final uri = Uri.parse(apiBaseUrl);
  final path = uri.path.replaceAll(RegExp(r'/+$'), '');
  final prefix = path.endsWith('/v1')
      ? path.substring(0, path.length - 3)
      : path;
  return Uri(
    scheme: uri.scheme,
    host: uri.host,
    port: uri.hasPort ? uri.port : null,
    path: prefix.isEmpty ? null : prefix,
  ).toString();
}
