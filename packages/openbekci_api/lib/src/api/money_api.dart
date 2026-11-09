//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'dart:typed_data';
import 'package:openbekci_api/src/model/charge_list.dart';
import 'package:openbekci_api/src/model/checkout.dart';
import 'package:openbekci_api/src/model/checkout_create.dart';
import 'package:openbekci_api/src/model/checkout_list.dart';
import 'package:openbekci_api/src/model/payment.dart';
import 'package:openbekci_api/src/model/payment_declare.dart';
import 'package:openbekci_api/src/model/payment_list.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/statement.dart';

class MoneyApi {

  final Dio _dio;

  const MoneyApi(this._dio);

  /// Start a card checkout
  /// **Release 0.4.** Starts a hosted card checkout for one side of a unit, for selected charges or an amount, and returns the provider&#39;s &#x60;checkout_url&#x60;, the &#x60;return_url&#x60; and the &#x60;checkout_id&#x60; to poll (&#x60;money.getCheckout&#x60;).  A resident may pay only a side their current occupancy reaches: an owner both sides, a tenant the tenant side, a household member their own side when &#x60;may_see_money&#x60; was granted (otherwise 403). A manager of the site may start one for any side. The provider is the one of the enabled packs (the setting &#x60;payments.provider&#x60; picks one when several are enabled); whose account it uses follows &#x60;payments.merchant_of_record&#x60;. Card data never passes through the server: the payer enters it on the provider&#39;s page.  Permission: &#x60;payments.checkout&#x60;.  Problems: &#x60;payment_provider_unavailable&#x60; (409, no provider is enabled for the site), &#x60;validation_failed&#x60; (422, &#x60;charge_ids&#x60; not open, nothing to pay), &#x60;idempotency_mismatch&#x60; (422), &#x60;pack_error&#x60; (the provider failed).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [idempotencyKey] - Client-generated unique key (8..128 chars); mandatory on this operation. A replay within 7 days returns the stored response; the same key with a different request is 422 `idempotency_mismatch`.
  /// * [checkoutCreate] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Checkout] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Checkout>> moneyCreateCheckout({ 
    required String orgId,
    required String idempotencyKey,
    required CheckoutCreate checkoutCreate,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/checkouts'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      _bodyData = jsonEncode(checkoutCreate);

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

    Checkout? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Checkout, Checkout>(rawData, 'Checkout', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Checkout>(
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

  /// Poll a checkout
  /// **Release 0.4.** The status poll of a checkout: &#x60;pending&#x60;, &#x60;paid&#x60;, &#x60;failed&#x60;, &#x60;expired&#x60; or &#x60;refunded&#x60;, and the resulting &#x60;payment_id&#x60; once paid. A client opens &#x60;checkout_url&#x60;, and after the provider returns the payer to &#x60;return_url&#x60; polls this until the status is no longer &#x60;pending&#x60; (the receipt arrives as a notification).  A pending checkout is reconciled with the provider (at most every few seconds), so a payment whose webhook was lost is still found, and a pending checkout past &#x60;expires_at&#x60; is expired on the spot. Only the person who started the checkout, a manager of the site and a resident who reaches the unit side can read it (404 otherwise).  Permission: &#x60;payments.checkout&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [checkoutId] - Id of the checkout.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Checkout] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Checkout>> moneyGetCheckout({ 
    required String orgId,
    required String checkoutId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/checkouts/{checkout_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'checkout_id' '}', checkoutId.toString());
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

    Checkout? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Checkout, Checkout>(rawData, 'Checkout', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Checkout>(
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

  /// List charges
  /// **Release 0.1.** List charges.  Residents (&#x60;statements.read_own&#x60;) get only their own side(s) of their own unit(s): the server restricts the result to the caller&#39;s sides (household: only with &#x60;may_see_money&#x60;; former occupants: their period) and ignores &#x60;person_id&#x60; of anyone else.  Permission (any one of): &#x60;money.read&#x60;, &#x60;statements.read_own&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [unitId] - Filter by unit.
  /// * [debtorKind] - Debtor side of the unit: owner or tenant.
  /// * [personId] - Filter by person.
  /// * [planId] - Filter by `plan_id`.
  /// * [status] - Filter by `status`.
  /// * [period] - Filter by month, `YYYY-MM`.
  /// * [chargeType] - Filter by `charge_type`.
  /// * [dueFrom] - Filter by `due_from`.
  /// * [dueTo] - Filter by `due_to`.
  /// * [overdue] - Only charges past their due date that are still open or partially paid.
  /// * [side] - Debtor side of the unit (alias of `debtor_kind`).
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ChargeList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ChargeList>> moneyListCharges({ 
    required String orgId,
    required String siteId,
    String? unitId,
    String? debtorKind,
    String? personId,
    String? planId,
    String? status,
    String? period,
    String? chargeType,
    String? dueFrom,
    String? dueTo,
    bool? overdue,
    String? side,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/charges'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (planId != null) r'plan_id': planId,
      if (status != null) r'status': status,
      if (period != null) r'period': period,
      if (chargeType != null) r'charge_type': chargeType,
      if (dueFrom != null) r'due_from': dueFrom,
      if (dueTo != null) r'due_to': dueTo,
      if (overdue != null) r'overdue': overdue,
      if (side != null) r'side': side,
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

    ChargeList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ChargeList, ChargeList>(rawData, 'ChargeList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ChargeList>(
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

  /// List my checkouts
  /// **Release 0.4.** The card checkouts the caller started in this organization, oldest first.  Permission: &#x60;payments.checkout&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [CheckoutList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<CheckoutList>> moneyListMyCheckouts({ 
    required String orgId,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/checkouts'.replaceAll('{' r'org_id' '}', orgId.toString());
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

    CheckoutList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<CheckoutList, CheckoutList>(rawData, 'CheckoutList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<CheckoutList>(
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
