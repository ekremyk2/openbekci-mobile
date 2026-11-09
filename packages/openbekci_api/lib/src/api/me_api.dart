//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:openbekci_api/src/model/device.dart';
import 'package:openbekci_api/src/model/device_register.dart';
import 'package:openbekci_api/src/model/invitation_list.dart';
import 'package:openbekci_api/src/model/me.dart';
import 'package:openbekci_api/src/model/me_user.dart';
import 'package:openbekci_api/src/model/occupancy.dart';
import 'package:openbekci_api/src/model/occupancy_list.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/profile_update.dart';
import 'package:openbekci_api/src/model/session_list.dart';
import 'package:openbekci_api/src/model/web_login_link.dart';
import 'package:openbekci_api/src/model/web_login_link_create.dart';

class MeApi {

  final Dio _dio;

  const MeApi(this._dio);

  /// Get a one-time link that signs the browser in
  /// **Release 0.4.** The mobile app asks for a one-time token and opens &#x60;{BASE_URL}/login/link/{token}?next&#x3D;/orgs/{org_id}/...&#x60; in the browser for anything deeper than the app offers (mobile section 7.2). The token is single use, valid for a few minutes, bound to the calling session (it stops working when that session is signed out) and stored hashed. A new link voids the session&#39;s earlier open ones.  Permission: any signed-in caller (&#x60;sessions.manage_own&#x60;).  Problems: &#x60;validation_failed&#x60; (422, &#x60;next&#x60; is not an in-app &#x60;/orgs/{org_id}/...&#x60; path), &#x60;rate_limited&#x60; (429).
  ///
  /// Parameters:
  /// * [webLoginLinkCreate] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [WebLoginLink] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<WebLoginLink>> meCreateWebLoginLink({ 
    WebLoginLinkCreate? webLoginLinkCreate,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/web-login-link';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
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
      _bodyData = jsonEncode(webLoginLinkCreate);

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

    WebLoginLink? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<WebLoginLink, WebLoginLink>(rawData, 'WebLoginLink', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<WebLoginLink>(
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

  /// Unregister a push device
  /// **Release 0.4.** Deletes one of the caller&#39;s devices (sign-out of the app does this, then revokes the session). A device of another user is 404.  Permission: any signed-in caller (&#x60;sessions.manage_own&#x60;).  Problems: &#x60;not_found&#x60; (404).
  ///
  /// Parameters:
  /// * [id] - Id of the device (from `me.registerDevice`).
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> meDeleteDevice({ 
    required String id,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/devices/{id}'.replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'DELETE',
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

    return _response;
  }

  /// End a household member&#39;s occupancy
  /// **Release 0.1.** Ends the occupancy of a household member of the caller&#39;s own unit (&#x60;kind &#x3D; household&#x60; only) and withdraws their access and money visibility from that day. Owner and tenant occupancies are ended by managers (&#x60;people.deleteOccupancy&#x60;, &#x60;people.moveOut&#x60;).  Permission: &#x60;occupancies.household&#x60; (own unit, household occupancies only).  Problems: &#x60;conflict&#x60; (409, not a household occupancy or already ended).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [occupancyId] - Id of a household occupancy on the caller's own unit.
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [validTo] - Last day of the occupancy; default today. Not in the past by more than the lock date allows.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Occupancy] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Occupancy>> meEndHouseholdOccupancy({ 
    required String orgId,
    required String occupancyId,
    String? idempotencyKey,
    String? validTo,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/household-occupancies/{occupancy_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'occupancy_id' '}', occupancyId.toString());
    final _options = Options(
      method: r'DELETE',
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

    final _queryParameters = <String, dynamic>{
      if (validTo != null) r'valid_to': validTo,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Occupancy? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Occupancy, Occupancy>(rawData, 'Occupancy', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Occupancy>(
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

  /// The signed-in user, organizations, roles and permissions
  /// Instance-level rights are not listed per organization: &#x60;is_platform_admin: true&#x60; implies &#x60;platform.read&#x60; and &#x60;platform.manage&#x60; (the platform operations), and nothing inside an organization; to act there a platform administrator needs a membership of that organization like anybody else. 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Me] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Me>> meGet({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me';
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

    Me? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Me, Me>(rawData, 'Me', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Me>(
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

  /// List the household invitations I sent
  /// **Release 0.1.** The pending, accepted, expired and revoked household invitations the caller sent for their own unit(s). Owners and tenants manage their own household; managers use &#x60;people.listInvitations&#x60;.  Permission: &#x60;invitations.household&#x60; (own unit only; invitations sent by someone else for the same unit are not listed).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [unitId] - Only invitations for this unit of the caller.
  /// * [status] - Filter by `status` (open enum: `pending`, `accepted`, `expired`, `revoked`).
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [InvitationList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<InvitationList>> meListHouseholdInvitations({ 
    required String orgId,
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
    final _path = r'/v1/orgs/{org_id}/me/household-invitations'.replaceAll('{' r'org_id' '}', orgId.toString());
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

    InvitationList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<InvitationList, InvitationList>(rawData, 'InvitationList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<InvitationList>(
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

  /// Members of my own unit side
  /// **Release 0.1.** The current owners, tenants and household members of the unit side the caller owns or rents, so owners and tenants need no &#x60;occupancies.read&#x60;. The same fields as an occupancy; a household member sees none of this.  Permission: &#x60;invitations.household&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [unitId] - Only this unit (one of the caller's own).
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [OccupancyList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<OccupancyList>> meListHouseholdMembers({ 
    required String orgId,
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
    final _path = r'/v1/orgs/{org_id}/me/household-members'.replaceAll('{' r'org_id' '}', orgId.toString());
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

    OccupancyList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<OccupancyList, OccupancyList>(rawData, 'OccupancyList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<OccupancyList>(
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

  /// List the caller&#39;s open sessions
  /// 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SessionList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SessionList>> meListSessions({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/sessions';
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

    SessionList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SessionList, SessionList>(rawData, 'SessionList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SessionList>(
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

  /// Register or update a push device
  /// **Release 0.4.** Registers the caller&#39;s push token (FCM, APNs or a UnifiedPush endpoint), or updates the existing row of the same token and enables it again. The token is stored encrypted and never returned. The device is tied to the calling session: signing that session out unregisters it.  Permission: any signed-in caller (&#x60;sessions.manage_own&#x60;).  Problems: &#x60;validation_failed&#x60; (422), &#x60;rate_limited&#x60; (429).
  ///
  /// Parameters:
  /// * [deviceRegister] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Device] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Device>> meRegisterDevice({ 
    required DeviceRegister deviceRegister,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/devices';
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
      _bodyData = jsonEncode(deviceRegister);

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

    Device? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Device, Device>(rawData, 'Device', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Device>(
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

  /// Sign out everywhere
  /// Revokes every session of the caller, the current one included.
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> meRevokeAllSessions({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/sessions';
    final _options = Options(
      method: r'DELETE',
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

    return _response;
  }

  /// Revoke a household invitation I sent
  /// **Release 0.1.** Revokes a pending household invitation the caller sent; the link stops working. An accepted invitation cannot be revoked here: end the household occupancy instead (&#x60;me.endHouseholdOccupancy&#x60;).  Permission: &#x60;invitations.household&#x60; (own invitations only).  Problems: &#x60;conflict&#x60; (409, not pending).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [invitationId] - Id of the invitation.
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> meRevokeHouseholdInvitation({ 
    required String orgId,
    required String invitationId,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/household-invitations/{invitation_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'invitation_id' '}', invitationId.toString());
    final _options = Options(
      method: r'DELETE',
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

    return _response;
  }

  /// Sign out one session
  /// Revokes the session with this id (from &#x60;me.listSessions&#x60;), or the current one for &#x60;current&#x60; (log out). For a mobile session the refresh token and every access token of the session are revoked. 
  ///
  /// Parameters:
  /// * [id] - A session id, or `current`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> meRevokeSession({ 
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/sessions/{id}'.replaceAll('{' r'id' '}', id.toString());
    final _options = Options(
      method: r'DELETE',
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

    return _response;
  }

  /// Update my profile
  /// **Release 0.1.** Display name and locale of the signed-in account (&#x60;PATCH /v1/me/profile&#x60;). Contact changes go through &#x60;me.startContactChange&#x60;. Send the &#x60;version&#x60; of &#x60;GET /v1/me&#x60; (&#x60;user.version&#x60;) in &#x60;If-Match&#x60;; a stale one is 409 &#x60;version_conflict&#x60;. Returns the updated &#x60;user&#x60;, with its new &#x60;version&#x60;. The display name is the account&#39;s own: it wins over the name of the linked person in &#x60;GET /v1/me&#x60;; an empty string clears it. The locale is one the server has texts for: &#x60;tr&#x60; or &#x60;en&#x60;.  Problems: &#x60;version_conflict&#x60; (409), &#x60;validation_failed&#x60; (422).
  ///
  /// Parameters:
  /// * [ifMatch] - The `version` of the resource the client last read, as a quoted integer (`\"3\"`). A stale value is 409 `version_conflict`; a missing one is 422 `validation_failed`.
  /// * [profileUpdate] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MeUser] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MeUser>> meUpdateProfile({ 
    required String ifMatch,
    required ProfileUpdate profileUpdate,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/me/profile';
    final _options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{
        r'If-Match': ifMatch,
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
      _bodyData = jsonEncode(profileUpdate);

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

    MeUser? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<MeUser, MeUser>(rawData, 'MeUser', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MeUser>(
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
