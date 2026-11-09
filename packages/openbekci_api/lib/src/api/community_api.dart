//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:openbekci_api/src/model/availability.dart';
import 'package:openbekci_api/src/model/booking.dart';
import 'package:openbekci_api/src/model/booking_cancel.dart';
import 'package:openbekci_api/src/model/booking_create.dart';
import 'package:openbekci_api/src/model/booking_list.dart';
import 'package:openbekci_api/src/model/delivery_list.dart';
import 'package:openbekci_api/src/model/facility.dart';
import 'package:openbekci_api/src/model/facility_list.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/recurring_visitor.dart';
import 'package:openbekci_api/src/model/recurring_visitor_create.dart';
import 'package:openbekci_api/src/model/recurring_visitor_list.dart';
import 'package:openbekci_api/src/model/visitor_approval_request.dart';
import 'package:openbekci_api/src/model/visitor_approval_request_list.dart';
import 'package:openbekci_api/src/model/visitor_decision.dart';
import 'package:openbekci_api/src/model/visitor_entry.dart';
import 'package:openbekci_api/src/model/visitor_entry_create.dart';
import 'package:openbekci_api/src/model/visitor_entry_list.dart';

class CommunityApi {

  final Dio _dio;

  const CommunityApi(this._dio);

  /// Cancel a booking
  /// **Release 0.3.** Refunds the fee automatically when cancelled before the facility cutoff.  Permission (any one of): &#x60;bookings.manage&#x60;, &#x60;bookings.create&#x60;.  Problems: &#x60;conflict&#x60; (409), &#x60;idempotency_mismatch&#x60; (422).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [bookingId] - Id of the booking.
  /// * [idempotencyKey] - Client-generated unique key (8..128 chars); mandatory on this operation. A replay within 7 days returns the stored response; the same key with a different request is 422 `idempotency_mismatch`.
  /// * [bookingCancel] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Booking] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Booking>> communityCancelBooking({ 
    required String orgId,
    required String bookingId,
    required String idempotencyKey,
    BookingCancel? bookingCancel,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/bookings/{booking_id}:cancel'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'booking_id' '}', bookingId.toString());
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
      _bodyData = jsonEncode(bookingCancel);

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

    Booking? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Booking, Booking>(rawData, 'Booking', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Booking>(
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

  /// Cancel a visitor entry
  /// **Release 0.3.** Cancel a visitor entry.  Permission: &#x60;visitors.manage&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [entryId] - Id of the entry.
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VisitorEntry] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VisitorEntry>> communityCancelVisitorEntry({ 
    required String orgId,
    required String entryId,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/visitor-entries/{entry_id}:cancel'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'entry_id' '}', entryId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        if (idempotencyKey != null) r'Idempotency-Key': idempotencyKey,
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

    VisitorEntry? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<VisitorEntry, VisitorEntry>(rawData, 'VisitorEntry', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VisitorEntry>(
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

  /// Book a facility
  /// **Release 0.3.** Checks hours, duration, lead time, quota and who may book; a taken slot is 409 &#x60;conflict&#x60;. A fee posts a charge on the unit side.  Permission: &#x60;bookings.create&#x60;.  Problems: &#x60;conflict&#x60; (409), &#x60;validation_failed&#x60; (422), &#x60;idempotency_mismatch&#x60; (422).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [idempotencyKey] - Client-generated unique key (8..128 chars); mandatory on this operation. A replay within 7 days returns the stored response; the same key with a different request is 422 `idempotency_mismatch`.
  /// * [bookingCreate] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Booking] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Booking>> communityCreateBooking({ 
    required String orgId,
    required String idempotencyKey,
    required BookingCreate bookingCreate,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/bookings'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      _bodyData = jsonEncode(bookingCreate);

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

    Booking? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Booking, Booking>(rawData, 'Booking', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Booking>(
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

  /// Create recurring visitor
  /// **Release 0.3.** Creates a recurring visitor.  Permission: &#x60;visitors.manage&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [recurringVisitorCreate] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [RecurringVisitor] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<RecurringVisitor>> communityCreateRecurringVisitor({ 
    required String orgId,
    required RecurringVisitorCreate recurringVisitorCreate,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/recurring-visitors'.replaceAll('{' r'org_id' '}', orgId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        if (idempotencyKey != null) r'Idempotency-Key': idempotencyKey,
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
      _bodyData = jsonEncode(recurringVisitorCreate);

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

    RecurringVisitor? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<RecurringVisitor, RecurringVisitor>(rawData, 'RecurringVisitor', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<RecurringVisitor>(
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

  /// Create visitor entry
  /// **Release 0.3.** Pre-registration: the response carries the QR token the resident shares with the guest.  Permission: &#x60;visitors.manage&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [visitorEntryCreate] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VisitorEntry] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VisitorEntry>> communityCreateVisitorEntry({ 
    required String orgId,
    required VisitorEntryCreate visitorEntryCreate,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/visitor-entries'.replaceAll('{' r'org_id' '}', orgId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        if (idempotencyKey != null) r'Idempotency-Key': idempotencyKey,
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
      _bodyData = jsonEncode(visitorEntryCreate);

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

    VisitorEntry? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<VisitorEntry, VisitorEntry>(rawData, 'VisitorEntry', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VisitorEntry>(
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

  /// Approve or deny a visitor
  /// **Release 0.3.** Approval creates a single-use credential for the access agent within seconds (0.3 gate control). A decision after expiry is 409 &#x60;conflict&#x60;.  Permission: &#x60;visitors.decide&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [requestId] - Id of the request.
  /// * [visitorDecision] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VisitorApprovalRequest] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VisitorApprovalRequest>> communityDecideVisitorApprovalRequest({ 
    required String orgId,
    required String requestId,
    required VisitorDecision visitorDecision,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/visitor-approval-requests/{request_id}:decide'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'request_id' '}', requestId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        if (idempotencyKey != null) r'Idempotency-Key': idempotencyKey,
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
      _bodyData = jsonEncode(visitorDecision);

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

    VisitorApprovalRequest? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<VisitorApprovalRequest, VisitorApprovalRequest>(rawData, 'VisitorApprovalRequest', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VisitorApprovalRequest>(
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

  /// Get a booking
  /// **Release 0.3.** Get a booking.  Permission: &#x60;bookings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [bookingId] - Id of the booking.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Booking] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Booking>> communityGetBooking({ 
    required String orgId,
    required String bookingId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/bookings/{booking_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'booking_id' '}', bookingId.toString());
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

    Booking? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Booking, Booking>(rawData, 'Booking', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Booking>(
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

  /// Get facility
  /// **Release 0.3.** Get facility.  Permission (any one of): &#x60;bookings.read&#x60;, &#x60;facilities.manage&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [facilityId] - Id of the facility.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Facility] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Facility>> communityGetFacility({ 
    required String orgId,
    required String facilityId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/facilities/{facility_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'facility_id' '}', facilityId.toString());
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

    Facility? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Facility, Facility>(rawData, 'Facility', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Facility>(
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

  /// Taken and blocked slots
  /// **Release 0.3.** Taken and blocked slots.  Permission: &#x60;bookings.create&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [facilityId] - Id of the facility.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Availability] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Availability>> communityGetFacilityAvailability({ 
    required String orgId,
    required String facilityId,
    required String from,
    required String to,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/facilities/{facility_id}/availability'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'facility_id' '}', facilityId.toString());
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
      r'from': from,
      r'to': to,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Availability? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Availability, Availability>(rawData, 'Availability', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Availability>(
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

  /// Get recurring visitor
  /// **Release 0.3.** Get recurring visitor.  Permission (any one of): &#x60;visitors.read&#x60;, &#x60;visitors.manage&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [recurringVisitorId] - Id of the recurring visitor.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [RecurringVisitor] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<RecurringVisitor>> communityGetRecurringVisitor({ 
    required String orgId,
    required String recurringVisitorId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/recurring-visitors/{recurring_visitor_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'recurring_visitor_id' '}', recurringVisitorId.toString());
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

    RecurringVisitor? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<RecurringVisitor, RecurringVisitor>(rawData, 'RecurringVisitor', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<RecurringVisitor>(
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

  /// Get visitor entry
  /// **Release 0.3.** Get visitor entry.  Permission (any one of): &#x60;visitors.read&#x60;, &#x60;visitors.manage&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [entryId] - Id of the entry.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VisitorEntry] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VisitorEntry>> communityGetVisitorEntry({ 
    required String orgId,
    required String entryId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/visitor-entries/{entry_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'entry_id' '}', entryId.toString());
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

    VisitorEntry? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<VisitorEntry, VisitorEntry>(rawData, 'VisitorEntry', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VisitorEntry>(
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

  /// List bookings
  /// **Release 0.3.** List bookings.  Permission: &#x60;bookings.read&#x60; (residents: their own unit).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [facilityId] - Filter by `facility_id`.
  /// * [unitId] - Filter by unit.
  /// * [status] - Filter by `status`.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [mine] - Filter by `mine`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BookingList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BookingList>> communityListBookings({ 
    required String orgId,
    required String siteId,
    String? facilityId,
    String? unitId,
    String? status,
    String? from,
    String? to,
    bool? mine,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/bookings'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (facilityId != null) r'facility_id': facilityId,
      if (unitId != null) r'unit_id': unitId,
      if (status != null) r'status': status,
      if (from != null) r'from': from,
      if (to != null) r'to': to,
      if (mine != null) r'mine': mine,
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

    BookingList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<BookingList, BookingList>(rawData, 'BookingList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BookingList>(
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

  /// List parcels of my unit (or of the site)
  /// **Release 0.3.** List parcels of my unit (or of the site).  Permission (any one of): &#x60;deliveries.read&#x60;, &#x60;visitors.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [unitId] - Filter by unit.
  /// * [status] - Filter by `status`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [DeliveryList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<DeliveryList>> communityListDeliveries({ 
    required String orgId,
    required String siteId,
    String? unitId,
    String? status,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/deliveries'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (status != null) r'status': status,
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

    DeliveryList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<DeliveryList, DeliveryList>(rawData, 'DeliveryList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<DeliveryList>(
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

  /// List facilities
  /// **Release 0.3.** Cursor-paginated list of facilitys.  Permission (any one of): &#x60;bookings.read&#x60;, &#x60;facilities.manage&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [enabled] - Filter by `enabled`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [FacilityList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<FacilityList>> communityListFacilities({ 
    required String orgId,
    required String siteId,
    bool? enabled,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/facilities'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (enabled != null) r'enabled': enabled,
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

    FacilityList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<FacilityList, FacilityList>(rawData, 'FacilityList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<FacilityList>(
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

  /// List recurring visitors
  /// **Release 0.3.** Cursor-paginated list of recurring visitors.  Permission (any one of): &#x60;visitors.read&#x60;, &#x60;visitors.manage&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [unitId] - Filter by unit.
  /// * [status] - Filter by `status`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [RecurringVisitorList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<RecurringVisitorList>> communityListRecurringVisitors({ 
    required String orgId,
    required String siteId,
    String? unitId,
    String? status,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/recurring-visitors'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (status != null) r'status': status,
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

    RecurringVisitorList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<RecurringVisitorList, RecurringVisitorList>(rawData, 'RecurringVisitorList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<RecurringVisitorList>(
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

  /// My visitor approval requests
  /// **Release 0.3.** Polled while pending.  Permission: &#x60;visitors.decide&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [status] - Filter by `status`.
  /// * [unitId] - Filter by unit.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VisitorApprovalRequestList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VisitorApprovalRequestList>> communityListVisitorApprovalRequests({ 
    required String orgId,
    String? status,
    String? unitId,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/visitor-approval-requests'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (status != null) r'status': status,
      if (unitId != null) r'unit_id': unitId,
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

    VisitorApprovalRequestList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<VisitorApprovalRequestList, VisitorApprovalRequestList>(rawData, 'VisitorApprovalRequestList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VisitorApprovalRequestList>(
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

  /// List visitor entries
  /// **Release 0.3.** Cursor-paginated list of visitor entrys.  Permission (any one of): &#x60;visitors.read&#x60;, &#x60;visitors.manage&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [unitId] - Filter by unit.
  /// * [approvalStatus] - Filter by `approval_status`.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [arrived] - Filter by `arrived`.
  /// * [q] - Free-text search.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VisitorEntryList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VisitorEntryList>> communityListVisitorEntries({ 
    required String orgId,
    required String siteId,
    String? unitId,
    String? approvalStatus,
    String? from,
    String? to,
    bool? arrived,
    String? q,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/visitor-entries'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (approvalStatus != null) r'approval_status': approvalStatus,
      if (from != null) r'from': from,
      if (to != null) r'to': to,
      if (arrived != null) r'arrived': arrived,
      if (q != null) r'q': q,
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

    VisitorEntryList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<VisitorEntryList, VisitorEntryList>(rawData, 'VisitorEntryList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VisitorEntryList>(
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

  /// Revoke a recurring visitor
  /// **Release 0.3.** Takes effect immediately, also at the gate.  Permission: &#x60;visitors.manage&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [recurringVisitorId] - Id of the recurring visitor.
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [RecurringVisitor] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<RecurringVisitor>> communityRevokeRecurringVisitor({ 
    required String orgId,
    required String recurringVisitorId,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/recurring-visitors/{recurring_visitor_id}:revoke'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'recurring_visitor_id' '}', recurringVisitorId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        if (idempotencyKey != null) r'Idempotency-Key': idempotencyKey,
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

    RecurringVisitor? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<RecurringVisitor, RecurringVisitor>(rawData, 'RecurringVisitor', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<RecurringVisitor>(
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
