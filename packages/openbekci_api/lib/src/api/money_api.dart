//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'dart:typed_data';
import 'package:openbekci_api/src/model/payment.dart';
import 'package:openbekci_api/src/model/payment_declare.dart';
import 'package:openbekci_api/src/model/payment_list.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/statement.dart';

class MoneyApi {

  final Dio _dio;

  const MoneyApi(this._dio);

  /// Declare a bank transfer (\&quot;I have paid\&quot;)
  /// **Release 0.1.** Creates a payment with &#x60;status &#x3D; pending_declared&#x60;; nothing is posted until a manager confirms it during matching.  Permission: &#x60;payments.declare&#x60;.  Problems: &#x60;idempotency_mismatch&#x60; (422), &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [idempotencyKey] - Client-generated unique key (8..128 chars); mandatory on this operation. A replay within 7 days returns the stored response; the same key with a different request is 422 `idempotency_mismatch`.
  /// * [paymentDeclare] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Payment] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Payment>> moneyDeclarePayment({ 
    required String orgId,
    required String idempotencyKey,
    required PaymentDeclare paymentDeclare,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/payments:declare'.replaceAll('{' r'org_id' '}', orgId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        r'Idempotency-Key': idempotencyKey,
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(paymentDeclare);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Payment? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Payment, Payment>(rawData, 'Payment', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Payment>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get a payment
  /// **Release 0.1.** Get a payment.  Permission (any one of): &#x60;money.read&#x60;, &#x60;statements.read_own&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [paymentId] - Id of the payment.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Payment] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Payment>> moneyGetPayment({ 
    required String orgId,
    required String paymentId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/payments/{payment_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'payment_id' '}', paymentId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Payment? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Payment, Payment>(rawData, 'Payment', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Payment>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Download the receipt (aidat makbuzu)
  /// **Release 0.1.** Generated and filed into the site documents (O8).  Permission (any one of): &#x60;payments.record&#x60;, &#x60;statements.read_own&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [paymentId] - Id of the payment.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Uint8List] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Uint8List>> moneyGetPaymentReceipt({ 
    required String orgId,
    required String paymentId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/payments/{payment_id}/receipt'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'payment_id' '}', paymentId.toString());
    final _options = Options(
      method: r'GET',
      responseType: ResponseType.bytes,
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Uint8List? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : rawData as Uint8List;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Uint8List>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Statement of a person (carried debt)
  /// **Release 0.1.** Debt carried after a move-out (S7).  Permission (any one of): &#x60;statements.read&#x60;, &#x60;statements.read_own&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [personId] - Id of the person.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [format] - Representation: `json` (default), or a download as `csv`, `xlsx` or `pdf` where the operation offers it.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Statement] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Statement>> moneyGetPersonStatement({ 
    required String orgId,
    required String personId,
    String? from,
    String? to,
    String? format = 'json',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/persons/{person_id}/statement'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'person_id' '}', personId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (from != null) r'from': from,
      if (to != null) r'to': to,
      if (format != null) r'format': format,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Statement? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Statement, Statement>(rawData, 'Statement', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Statement>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Statement of a unit side
  /// **Release 0.1.** JSON, or &#x60;format&#x3D;pdf&#x60; for the printable statement. A former occupant sees only their own period (S7).  Permission (any one of): &#x60;statements.read&#x60;, &#x60;statements.read_own&#x60; (occupants: their own side and period only).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [unitId] - Id of the unit.
  /// * [debtorKind] - Id of the debtor kind.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [format] - Representation: `json` (default), or a download as `csv`, `xlsx` or `pdf` where the operation offers it.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Statement] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Statement>> moneyGetUnitStatement({ 
    required String orgId,
    required String unitId,
    required String debtorKind,
    String? from,
    String? to,
    String? format = 'json',
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/units/{unit_id}/statements/{debtor_kind}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'unit_id' '}', unitId.toString()).replaceAll('{' r'debtor_kind' '}', debtorKind.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (from != null) r'from': from,
      if (to != null) r'to': to,
      if (format != null) r'format': format,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Statement? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Statement, Statement>(rawData, 'Statement', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Statement>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// List payments
  /// **Release 0.1.** List payments.  Residents (&#x60;statements.read_own&#x60;) get only their own side(s) of their own unit(s): the server restricts the result to the caller&#39;s sides (household: only with &#x60;may_see_money&#x60;; former occupants: their period) and ignores &#x60;person_id&#x60; of anyone else.  Permission (any one of): &#x60;money.read&#x60;, &#x60;statements.read_own&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [unitId] - Filter by unit.
  /// * [debtorKind] - Debtor side of the unit: owner or tenant.
  /// * [personId] - Filter by person.
  /// * [status] - Filter by `status`.
  /// * [method] - Filter by `method`.
  /// * [receiptNo] - Filter by `receipt_no`.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [assetAccountId] - Filter by `asset_account_id`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [PaymentList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PaymentList>> moneyListPayments({ 
    required String orgId,
    required String siteId,
    String? unitId,
    String? debtorKind,
    String? personId,
    String? status,
    String? method,
    String? receiptNo,
    String? from,
    String? to,
    String? assetAccountId,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/payments'.replaceAll('{' r'org_id' '}', orgId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'site_id': siteId,
      if (unitId != null) r'unit_id': unitId,
      if (debtorKind != null) r'debtor_kind': debtorKind,
      if (personId != null) r'person_id': personId,
      if (status != null) r'status': status,
      if (method != null) r'method': method,
      if (receiptNo != null) r'receipt_no': receiptNo,
      if (from != null) r'from': from,
      if (to != null) r'to': to,
      if (assetAccountId != null) r'asset_account_id': assetAccountId,
      if (limit != null) r'limit': limit,
      if (cursor != null) r'cursor': cursor,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    PaymentList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<PaymentList, PaymentList>(rawData, 'PaymentList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PaymentList>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
