//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'dart:typed_data';
import 'package:openbekci_api/src/model/agenda_item_list.dart';
import 'package:openbekci_api/src/model/decision.dart';
import 'package:openbekci_api/src/model/decision_list.dart';
import 'package:openbekci_api/src/model/meeting.dart';
import 'package:openbekci_api/src/model/meeting_list.dart';
import 'package:openbekci_api/src/model/minutes_result.dart';
import 'package:openbekci_api/src/model/my_meeting.dart';
import 'package:openbekci_api/src/model/poll.dart';
import 'package:openbekci_api/src/model/poll_answer.dart';
import 'package:openbekci_api/src/model/poll_answer_set.dart';
import 'package:openbekci_api/src/model/problem.dart';

class GovernanceApi {

  final Dio _dio;

  const GovernanceApi(this._dio);

  /// Answer the poll for my unit
  /// **Release 0.2.** One answer per unit; a co-owner may change the unit&#39;s answer while the poll is open. Non-binding.  Permission: &#x60;polls.answer&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [agendaItemId] - Id of the agenda item.
  /// * [pollAnswerSet] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [PollAnswer] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PollAnswer>> governanceAnswerPoll({ 
    required String orgId,
    required String agendaItemId,
    required PollAnswerSet pollAnswerSet,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/agenda-items/{agenda_item_id}/poll/answer'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'agenda_item_id' '}', agendaItemId.toString());
    final _options = Options(
      method: r'PUT',
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
      _bodyData = jsonEncode(pollAnswerSet);

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

    PollAnswer? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<PollAnswer, PollAnswer>(rawData, 'PollAnswer', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PollAnswer>(
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

  /// Download the call letter
  /// **Release 0.2.** Without &#x60;person_id&#x60; the generic call letter filed at the call. With &#x60;person_id&#x60; the per-owner letter that carries that owner&#39;s check-in QR token (the token is shown here and in &#x60;/me&#x60; and replaces the previously issued one: only its hash is stored). An owner may fetch only their own (403 otherwise); managers fetch anyone&#39;s. Check-in itself needs the session to be open.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [meetingId] - Id of the meeting.
  /// * [personId] - The owner whose personal letter (with their check-in QR) is wanted.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Uint8List] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Uint8List>> governanceGetCallLetter({ 
    required String orgId,
    required String meetingId,
    String? personId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/meetings/{meeting_id}/call-letter'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'meeting_id' '}', meetingId.toString());
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

    final _queryParameters = <String, dynamic>{
      if (personId != null) r'person_id': personId,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
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

  /// Get a decision
  /// **Release 0.2.** Get a decision.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [decisionId] - Id of the decision.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Decision] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Decision>> governanceGetDecision({ 
    required String orgId,
    required String decisionId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/decisions/{decision_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'decision_id' '}', decisionId.toString());
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

    Decision? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Decision, Decision>(rawData, 'Decision', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Decision>(
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

  /// Get meeting
  /// **Release 0.2.** Get meeting.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [meetingId] - Id of the meeting.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Meeting] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Meeting>> governanceGetMeeting({ 
    required String orgId,
    required String meetingId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/meetings/{meeting_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'meeting_id' '}', meetingId.toString());
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

    Meeting? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Meeting, Meeting>(rawData, 'Meeting', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Meeting>(
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

  /// The minutes document of a meeting
  /// **Release 0.2.** The minutes document of a meeting.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [meetingId] - Id of the meeting.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MinutesResult] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MinutesResult>> governanceGetMinutes({ 
    required String orgId,
    required String meetingId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/meetings/{meeting_id}/minutes'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'meeting_id' '}', meetingId.toString());
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

    MinutesResult? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<MinutesResult, MinutesResult>(rawData, 'MinutesResult', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MinutesResult>(
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

  /// The meeting as the caller sees it
  /// **Release 0.2.** My call letter notice, my check-in QR, my polls. Tenants see only what concerns residents.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [meetingId] - Id of the meeting.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MyMeeting] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MyMeeting>> governanceGetMyMeeting({ 
    required String orgId,
    required String meetingId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/meetings/{meeting_id}/me'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'meeting_id' '}', meetingId.toString());
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

    MyMeeting? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<MyMeeting, MyMeeting>(rawData, 'MyMeeting', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MyMeeting>(
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

  /// Get the poll of an agenda item
  /// **Release 0.2.** Get the poll of an agenda item.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [agendaItemId] - Id of the agenda item.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Poll] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Poll>> governanceGetPoll({ 
    required String orgId,
    required String agendaItemId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/agenda-items/{agenda_item_id}/poll'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'agenda_item_id' '}', agendaItemId.toString());
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

    Poll? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Poll, Poll>(rawData, 'Poll', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Poll>(
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

  /// List agenda items
  /// **Release 0.2.** List agenda items.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [meetingId] - Id of the meeting.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AgendaItemList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AgendaItemList>> governanceListAgendaItems({ 
    required String orgId,
    required String meetingId,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/meetings/{meeting_id}/agenda-items'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'meeting_id' '}', meetingId.toString());
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

    AgendaItemList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<AgendaItemList, AgendaItemList>(rawData, 'AgendaItemList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AgendaItemList>(
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

  /// Search the decision history
  /// **Release 0.2.** Search the decision history.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [meetingId] - Filter by `meeting_id`.
  /// * [year] - Filter by `year`.
  /// * [outcome] - Filter by `outcome`.
  /// * [concernsResidents] - Filter by `concerns_residents`.
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
  /// Returns a [Future] containing a [Response] with a [DecisionList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<DecisionList>> governanceListDecisions({ 
    required String orgId,
    required String siteId,
    String? meetingId,
    int? year,
    String? outcome,
    bool? concernsResidents,
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
    final _path = r'/v1/orgs/{org_id}/decisions'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (meetingId != null) r'meeting_id': meetingId,
      if (year != null) r'year': year,
      if (outcome != null) r'outcome': outcome,
      if (concernsResidents != null) r'concerns_residents': concernsResidents,
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

    DecisionList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<DecisionList, DecisionList>(rawData, 'DecisionList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<DecisionList>(
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

  /// List meetings
  /// **Release 0.2.** Cursor-paginated list of meetings.  Permission: &#x60;meetings.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [status] - Filter by `status`.
  /// * [kind] - Filter by `kind`.
  /// * [from] - Start of the range (inclusive).
  /// * [to] - End of the range (inclusive).
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MeetingList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MeetingList>> governanceListMeetings({ 
    required String orgId,
    required String siteId,
    String? status,
    String? kind,
    String? from,
    String? to,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/meetings'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (status != null) r'status': status,
      if (kind != null) r'kind': kind,
      if (from != null) r'from': from,
      if (to != null) r'to': to,
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

    MeetingList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<MeetingList, MeetingList>(rawData, 'MeetingList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MeetingList>(
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
