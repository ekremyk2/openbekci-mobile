//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'dart:typed_data';
import 'package:openbekci_api/src/model/announcement.dart';
import 'package:openbekci_api/src/model/announcement_list.dart';
import 'package:openbekci_api/src/model/document.dart';
import 'package:openbekci_api/src/model/document_list.dart';
import 'package:openbekci_api/src/model/file.dart';
import 'package:openbekci_api/src/model/folder.dart';
import 'package:openbekci_api/src/model/folder_list.dart';
import 'package:openbekci_api/src/model/notification.dart';
import 'package:openbekci_api/src/model/notification_list.dart';
import 'package:openbekci_api/src/model/notification_mutes.dart';
import 'package:openbekci_api/src/model/notification_mutes_set.dart';
import 'package:openbekci_api/src/model/notifications_read_all.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/ticket.dart';
import 'package:openbekci_api/src/model/ticket_attachment.dart';
import 'package:openbekci_api/src/model/ticket_attachment_create.dart';
import 'package:openbekci_api/src/model/ticket_category_list.dart';
import 'package:openbekci_api/src/model/ticket_comment.dart';
import 'package:openbekci_api/src/model/ticket_comment_create.dart';
import 'package:openbekci_api/src/model/ticket_comment_list.dart';
import 'package:openbekci_api/src/model/ticket_create.dart';
import 'package:openbekci_api/src/model/ticket_list.dart';
import 'package:openbekci_api/src/model/ticket_status_change_list.dart';
import 'package:openbekci_api/src/model/ticket_vote.dart';
import 'package:openbekci_api/src/model/ticket_workflow.dart';
import 'package:openbekci_api/src/model/unread_count.dart';

class OperationsApi {

  final Dio _dio;

  const OperationsApi(this._dio);

  /// Open a ticket
  /// **Release 0.1.** Management may pass &#x60;reporter_person_id&#x60; to open on a resident&#39;s behalf. Visibility defaults from the category.  Permission: &#x60;tickets.open&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketCreate] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Ticket] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Ticket>> operationsCreateTicket({ 
    required String orgId,
    required TicketCreate ticketCreate,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      _bodyData = jsonEncode(ticketCreate);

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

    Ticket? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Ticket, Ticket>(rawData, 'Ticket', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Ticket>(
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

  /// Attach an uploaded file to a ticket
  /// **Release 0.1.** At most 10 per ticket or comment.  Permission: &#x60;tickets.open&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [ticketAttachmentCreate] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketAttachment] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketAttachment>> operationsCreateTicketAttachment({ 
    required String orgId,
    required String ticketId,
    required TicketAttachmentCreate ticketAttachmentCreate,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}/attachments'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
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
      _bodyData = jsonEncode(ticketAttachmentCreate);

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

    TicketAttachment? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketAttachment, TicketAttachment>(rawData, 'TicketAttachment', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketAttachment>(
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

  /// Comment on a ticket
  /// **Release 0.1.** &#x60;visibility: internal&#x60; needs &#x60;tickets.manage&#x60; or &#x60;tickets.work&#x60;. Reading is not enough: an auditor (&#x60;tickets.read&#x60; only) cannot comment (403). The ticket must be visible to the caller, and a merged ticket takes no comments (409 &#x60;conflict&#x60;).  Permission (any one of): &#x60;tickets.open&#x60;, &#x60;tickets.work&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [ticketCommentCreate] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketComment] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketComment>> operationsCreateTicketComment({ 
    required String orgId,
    required String ticketId,
    required TicketCommentCreate ticketCommentCreate,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}/comments'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
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
      _bodyData = jsonEncode(ticketCommentCreate);

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

    TicketComment? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketComment, TicketComment>(rawData, 'TicketComment', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketComment>(
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

  /// Download a file
  /// **Release 0.1.** Streams the file. Images (&#x60;image/jpeg&#x60;, &#x60;image/png&#x60;, &#x60;image/webp&#x60;) are sent &#x60;inline&#x60;; everything else is sent with &#x60;Content-Disposition: attachment&#x60;. All responses carry &#x60;X-Content-Type-Options: nosniff&#x60;, &#x60;Content-Security-Policy: sandbox&#x60; and &#x60;Cache-Control: private, no-store&#x60;. &#x60;variant&#x3D;thumb|medium&#x60; selects an image variant (404 for a file that has none). With the S3 driver the answer is a 302 to a short-lived presigned URL instead of the bytes.  Two ways in. With a session: needs &#x60;files.read&#x60; and the file visible to the caller: a draft (not attached to a resource) to its uploader and to &#x60;files.manage&#x60;; an attached file to whoever the owning module&#39;s resolver lets read it, and to &#x60;files.manage&#x60;; anything else is 404, so file ids do not leak. Or without a session, with the &#x60;exp&#x60; and &#x60;sig&#x60; query parameters of a &#x60;links&#x60; URL from the file&#39;s metadata (local storage; with S3 the links point at the bucket); the signature is checked first, a session cookie or token that comes with it is ignored. A missing or invalid signature and an expired one are 401. A quarantined file has no downloadable content (404). 
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [fileId] - The file id.
  /// * [variant] - Image variant, `thumb` or `medium`. Absent for the original.
  /// * [exp] - Expiry of a signed URL, Unix seconds. Sent with `sig`.
  /// * [sig] - Signature of a signed URL. Sent with `exp`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Uint8List] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Uint8List>> operationsDownloadFile({ 
    required String orgId,
    required String fileId,
    String? variant,
    int? exp,
    String? sig,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/files/{file_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'file_id' '}', fileId.toString());
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
      if (variant != null) r'variant': variant,
      if (exp != null) r'exp': exp,
      if (sig != null) r'sig': sig,
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

  /// Get an announcement
  /// **Release 0.1.** Get an announcement.  Permission (any one of): &#x60;announcements.read&#x60;, &#x60;announcements.publish&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [announcementId] - Id of the announcement.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Announcement] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Announcement>> operationsGetAnnouncement({ 
    required String orgId,
    required String announcementId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/announcements/{announcement_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'announcement_id' '}', announcementId.toString());
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

    Announcement? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Announcement, Announcement>(rawData, 'Announcement', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Announcement>(
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

  /// Get document
  /// **Release 0.1.** Get document.  A former occupant (&#x60;documents.read_addressed&#x60;) sees only documents addressed to them (the closing statement and the debt / no-debt certificate of their move-out, O8), never folders or other unit documents.  Permission (any one of): &#x60;documents.read&#x60;, &#x60;documents.read_addressed&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [documentId] - Id of the document.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Document] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Document>> operationsGetDocument({ 
    required String orgId,
    required String documentId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/documents/{document_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'document_id' '}', documentId.toString());
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

    Document? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Document, Document>(rawData, 'Document', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Document>(
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

  /// Get file metadata
  /// **Release 0.1.** Needs &#x60;files.read&#x60; and the file visible to the caller (see &#x60;operations.downloadFile&#x60;); anything else is 404, so file ids do not leak. &#x60;links&#x60; carries fresh short-lived download URLs. &#x60;uploaded_by&#x60; is the uploader&#39;s user id for the uploader and for &#x60;files.manage&#x60;, and null for everyone else. 
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [fileId] - The file id.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [File] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<File>> operationsGetFileMeta({ 
    required String orgId,
    required String fileId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/files/{file_id}/meta'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'file_id' '}', fileId.toString());
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

    File? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<File, File>(rawData, 'File', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<File>(
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

  /// Get folder
  /// **Release 0.1.** Get folder.  Permission: &#x60;documents.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [folderId] - Id of the folder.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Folder] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Folder>> operationsGetFolder({ 
    required String orgId,
    required String folderId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/folders/{folder_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'folder_id' '}', folderId.toString());
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

    Folder? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Folder, Folder>(rawData, 'Folder', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Folder>(
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

  /// Read one notification
  /// **Release 0.1.** One of the caller&#39;s notifications, a single-row read cheap enough for a push handler (&#x60;notification_id&#x60; of the push payload). Another person&#39;s notification is 404.  Permission: &#x60;notifications.read&#x60;.  Problems: &#x60;not_found&#x60; (404).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [notificationId] - Id of the notification.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Notification] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Notification>> operationsGetNotification({ 
    required String orgId,
    required String notificationId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notifications/{notification_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'notification_id' '}', notificationId.toString());
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

    Notification? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Notification, Notification>(rawData, 'Notification', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Notification>(
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

  /// My muted notification types
  /// My muted notification types, the types that cannot be muted (sign-in codes, invitations) and &#x60;available_types&#x60;, the ones that can.  Permission: &#x60;notifications.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [NotificationMutes] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<NotificationMutes>> operationsGetNotificationMutes({ 
    required String orgId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notification-mutes'.replaceAll('{' r'org_id' '}', orgId.toString());
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

    NotificationMutes? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<NotificationMutes, NotificationMutes>(rawData, 'NotificationMutes', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<NotificationMutes>(
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

  /// Get a ticket
  /// Get a ticket.  Staff (&#x60;tickets.read_assigned&#x60;) can open tickets assigned to them and common tickets only (404 otherwise).  Permission (any one of): &#x60;tickets.read&#x60;, &#x60;tickets.open&#x60;, &#x60;tickets.read_assigned&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Ticket] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Ticket>> operationsGetTicket({ 
    required String orgId,
    required String ticketId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
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

    Ticket? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Ticket, Ticket>(rawData, 'Ticket', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Ticket>(
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

  /// Get the ticket workflow of a site
  /// Get the ticket workflow of a site.  Permission (any one of): &#x60;tickets.read&#x60;, &#x60;tickets.open&#x60;, &#x60;tickets.read_assigned&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketWorkflow] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketWorkflow>> operationsGetTicketWorkflow({ 
    required String orgId,
    required String siteId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/ticket-workflow'.replaceAll('{' r'org_id' '}', orgId.toString());
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
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    TicketWorkflow? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketWorkflow, TicketWorkflow>(rawData, 'TicketWorkflow', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketWorkflow>(
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

  /// Unread notification count
  /// Cheap enough to poll. &#x60;visitor_approvals_pending&#x60; is polled together with the badge and stays 0 until release 0.3 (gate control).  Permission: &#x60;notifications.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - Restrict to one site. Omitted: all sites the caller may see in the organization.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [UnreadCount] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<UnreadCount>> operationsGetUnreadCount({ 
    required String orgId,
    String? siteId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notifications/unread-count'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (siteId != null) r'site_id': siteId,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    UnreadCount? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<UnreadCount, UnreadCount>(rawData, 'UnreadCount', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<UnreadCount>(
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

  /// List announcements
  /// **Release 0.1.** List announcements.  Permission (any one of): &#x60;announcements.read&#x60;, &#x60;announcements.publish&#x60; (residents: published announcements addressed to them).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [status] - Filter by `status`.
  /// * [pinned] - Filter by `pinned`.
  /// * [unread] - Filter by `unread`.
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
  /// Returns a [Future] containing a [Response] with a [AnnouncementList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnnouncementList>> operationsListAnnouncements({ 
    required String orgId,
    required String siteId,
    String? status,
    bool? pinned,
    bool? unread,
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
    final _path = r'/v1/orgs/{org_id}/announcements'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (pinned != null) r'pinned': pinned,
      if (unread != null) r'unread': unread,
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

    AnnouncementList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<AnnouncementList, AnnouncementList>(rawData, 'AnnouncementList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnnouncementList>(
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

  /// List documents
  /// **Release 0.1.** Cursor-paginated list of documents.  A former occupant (&#x60;documents.read_addressed&#x60;) sees only documents addressed to them (the closing statement and the debt / no-debt certificate of their move-out, O8), never folders or other unit documents.  Permission (any one of): &#x60;documents.read&#x60;, &#x60;documents.read_addressed&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [folderId] - Filter by `folder_id`.
  /// * [source_] - Filter by `source`.
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
  /// Returns a [Future] containing a [Response] with a [DocumentList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<DocumentList>> operationsListDocuments({ 
    required String orgId,
    required String siteId,
    String? folderId,
    String? source_,
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
    final _path = r'/v1/orgs/{org_id}/documents'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (folderId != null) r'folder_id': folderId,
      if (source_ != null) r'source': source_,
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

    DocumentList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<DocumentList, DocumentList>(rawData, 'DocumentList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<DocumentList>(
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

  /// List folders
  /// **Release 0.1.** Cursor-paginated list of folders.  Permission: &#x60;documents.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [parentId] - Filter by `parent_id`.
  /// * [kind] - Filter by `kind`.
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
  /// Returns a [Future] containing a [Response] with a [FolderList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<FolderList>> operationsListFolders({ 
    required String orgId,
    required String siteId,
    String? parentId,
    String? kind,
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
    final _path = r'/v1/orgs/{org_id}/folders'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (parentId != null) r'parent_id': parentId,
      if (kind != null) r'kind': kind,
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

    FolderList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<FolderList, FolderList>(rawData, 'FolderList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<FolderList>(
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

  /// List my notifications
  /// **Release 0.1.** List my notifications.  Permission: &#x60;notifications.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - Restrict to one site. Omitted: all sites the caller may see in the organization.
  /// * [unread] - Filter by `unread`.
  /// * [type] - Filter by `type`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [NotificationList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<NotificationList>> operationsListNotifications({ 
    required String orgId,
    String? siteId,
    bool? unread,
    String? type,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notifications'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (siteId != null) r'site_id': siteId,
      if (unread != null) r'unread': unread,
      if (type != null) r'type': type,
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

    NotificationList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<NotificationList, NotificationList>(rawData, 'NotificationList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<NotificationList>(
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

  /// List ticket categories
  /// Cursor-paginated list of ticket categorys.  Permission (any one of): &#x60;tickets.read&#x60;, &#x60;tickets.open&#x60;, &#x60;tickets.read_assigned&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [archived] - `active` (default) lists the categories in use, `archived` the retired ones, `all` both (management and auditors only; everybody else always gets `active`). Ordered by `position`.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketCategoryList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketCategoryList>> operationsListTicketCategories({ 
    required String orgId,
    required String siteId,
    String? archived = 'active',
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/ticket-categories'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (archived != null) r'archived': archived,
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

    TicketCategoryList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketCategoryList, TicketCategoryList>(rawData, 'TicketCategoryList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketCategoryList>(
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

  /// List ticket comments
  /// **Release 0.1.** Residents never receive internal comments.  Internal notes are returned only to holders of &#x60;tickets.manage&#x60; or &#x60;tickets.work&#x60;; staff without &#x60;tickets.work&#x60; on that ticket see public comments only.  Permission (any one of): &#x60;tickets.read&#x60;, &#x60;tickets.open&#x60;, &#x60;tickets.read_assigned&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketCommentList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketCommentList>> operationsListTicketComments({ 
    required String orgId,
    required String ticketId,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}/comments'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
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

    TicketCommentList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketCommentList, TicketCommentList>(rawData, 'TicketCommentList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketCommentList>(
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

  /// Status history of a ticket
  /// **Release 0.1.** Status history of a ticket.  Staff (&#x60;tickets.read_assigned&#x60;) see the history of assigned and common tickets only; internal notes are omitted unless the caller holds &#x60;tickets.manage&#x60; or &#x60;tickets.work&#x60;.  Permission (any one of): &#x60;tickets.read&#x60;, &#x60;tickets.open&#x60;, &#x60;tickets.read_assigned&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [limit] - Page size.
  /// * [cursor] - Opaque cursor from a previous page `next_cursor`.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketStatusChangeList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketStatusChangeList>> operationsListTicketHistory({ 
    required String orgId,
    required String ticketId,
    int? limit = 50,
    String? cursor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}/history'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
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

    TicketStatusChangeList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketStatusChangeList, TicketStatusChangeList>(rawData, 'TicketStatusChangeList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketStatusChangeList>(
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

  /// List tickets
  /// **Release 0.1.** &#x60;queue&#x3D;true&#x60; is the staff queue (assigned to me). No kanban in 0.1.  Staff (&#x60;tickets.read_assigned&#x60;) see the tickets assigned to them and the common tickets of the site, never other residents&#39; private tickets. Internal notes are only visible to holders of &#x60;tickets.manage&#x60; or &#x60;tickets.work&#x60;.  Permission (any one of): &#x60;tickets.read&#x60;, &#x60;tickets.open&#x60;, &#x60;tickets.read_assigned&#x60; (residents: own private and all common tickets of their site).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - The site this resource belongs to.
  /// * [categoryId] - Filter by `category_id`.
  /// * [statusId] - Filter by `status_id`.
  /// * [semantic] - Filter by `semantic`.
  /// * [assigneePersonId] - Filter by `assignee_person_id`.
  /// * [assigneeVendorId] - Filter by `assignee_vendor_id`.
  /// * [unitId] - Filter by unit.
  /// * [visibility] - Filter by `visibility`.
  /// * [reporterPersonId] - Filter by `reporter_person_id`.
  /// * [mine] - Filter by `mine`.
  /// * [queue] - Filter by `queue`.
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
  /// Returns a [Future] containing a [Response] with a [TicketList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketList>> operationsListTickets({ 
    required String orgId,
    required String siteId,
    String? categoryId,
    String? statusId,
    String? semantic,
    String? assigneePersonId,
    String? assigneeVendorId,
    String? unitId,
    String? visibility,
    String? reporterPersonId,
    bool? mine,
    bool? queue,
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
    final _path = r'/v1/orgs/{org_id}/tickets'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      if (categoryId != null) r'category_id': categoryId,
      if (statusId != null) r'status_id': statusId,
      if (semantic != null) r'semantic': semantic,
      if (assigneePersonId != null) r'assignee_person_id': assigneePersonId,
      if (assigneeVendorId != null) r'assignee_vendor_id': assigneeVendorId,
      if (unitId != null) r'unit_id': unitId,
      if (visibility != null) r'visibility': visibility,
      if (reporterPersonId != null) r'reporter_person_id': reporterPersonId,
      if (mine != null) r'mine': mine,
      if (queue != null) r'queue': queue,
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

    TicketList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketList, TicketList>(rawData, 'TicketList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketList>(
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

  /// Mark all notifications read
  /// **Release 0.1.** Mark all notifications read.  Permission: &#x60;notifications.read&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [notificationsReadAll] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> operationsMarkAllNotificationsRead({ 
    required String orgId,
    String? idempotencyKey,
    NotificationsReadAll? notificationsReadAll,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notifications:read-all'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      _bodyData = jsonEncode(notificationsReadAll);

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

    return _response;
  }

  /// Mark an announcement read
  /// **Release 0.1.** Counted when the announcement is opened in the web or app.  Permission: &#x60;announcements.read&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [announcementId] - Id of the announcement.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> operationsMarkAnnouncementRead({ 
    required String orgId,
    required String announcementId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/announcements/{announcement_id}/read'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'announcement_id' '}', announcementId.toString());
    final _options = Options(
      method: r'PUT',
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

  /// Mark a notification read
  /// **Release 0.1.** Mark a notification read.  Permission: &#x60;notifications.read&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [notificationId] - Id of the notification.
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Notification] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Notification>> operationsMarkNotificationRead({ 
    required String orgId,
    required String notificationId,
    String? idempotencyKey,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notifications/{notification_id}:read'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'notification_id' '}', notificationId.toString());
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

    Notification? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Notification, Notification>(rawData, 'Notification', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Notification>(
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

  /// Set my muted notification types
  /// Set my muted notification types.  Permission: &#x60;notifications.read&#x60;.  Problems: &#x60;validation_failed&#x60; (422), &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [notificationMutesSet] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [NotificationMutes] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<NotificationMutes>> operationsSetNotificationMutes({ 
    required String orgId,
    required NotificationMutesSet notificationMutesSet,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/me/notification-mutes'.replaceAll('{' r'org_id' '}', orgId.toString());
    final _options = Options(
      method: r'PUT',
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
      _bodyData = jsonEncode(notificationMutesSet);

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

    NotificationMutes? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<NotificationMutes, NotificationMutes>(rawData, 'NotificationMutes', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<NotificationMutes>(
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

  /// Take back a \&quot;+1\&quot;
  /// **Release 0.1.** Take back a \&quot;+1\&quot;.  Permission: &#x60;tickets.open&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketVote] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketVote>> operationsUnvoteTicket({ 
    required String orgId,
    required String ticketId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}/vote'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
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

    TicketVote? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketVote, TicketVote>(rawData, 'TicketVote', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketVote>(
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

  /// Upload a file
  /// **Release 0.1.** &#x60;multipart/form-data&#x60;, streamed through the server (no direct-to-storage uploads): type sniffed, EXIF location stripped, &#x60;thumb&#x60; and &#x60;medium&#x60; generated for images. The form fields come **before** the &#x60;file&#x60; part (see &#x60;FileUpload&#x60;); a field after it is 422 &#x60;validation_failed&#x60; with the field code &#x60;multipart_order&#x60;, and so is a field this operation does not know.  Needs &#x60;files.upload&#x60; (at the site, when &#x60;site_id&#x60; is given). With &#x60;scope&#x60; (&#x60;&lt;type&gt;:&lt;id&gt;&#x60;, for example &#x60;ticket:2f9c...&#x60;) the file is attached to that resource at once and the module that owns it must allow the caller to add files there; without it the file is a draft that expires after 7 days and that only its uploader can see, read and discard.  The content is sniffed: the extension must be on the instance&#39;s allowlist (photos, PDF, office documents, plain text by default) and the bytes must really be that type, whatever the client&#39;s &#x60;Content-Type&#x60;. Images are decoded and re-encoded, which strips EXIF (including the GPS location) and every other piece of metadata, rotated upright first (JPEG, PNG and WebP), downscaled to at most 4096 px, and given &#x60;thumb&#x60; and &#x60;medium&#x60; variants. A file the virus scanner flags is stored as &#x60;quarantined&#x60;.  Problems: a file over &#x60;OPENBEKCI_MAX_UPLOAD_BYTES&#x60; (25 MiB by default) is 413 &#x60;payload_too_large&#x60;; a type that is not allowed or does not match its extension is 415 &#x60;unsupported_media_type&#x60;; an image that cannot be decoded or has more than &#x60;OPENBEKCI_MAX_IMAGE_PIXELS&#x60; pixels (25 million by default) is 422 &#x60;validation_failed&#x60;; a scanner that cannot be reached is 503 &#x60;scan_unavailable&#x60;; a resource that already has its maximum number of files (ticket photos: 10) is 409 &#x60;conflict&#x60;; a user may upload 30 files a minute, then 429 &#x60;rate_limited&#x60;.  &#x60;Idempotency-Key&#x60; is honoured and compares content: the first upload under a key is stored, a retry with the same form (same fields, same file bytes and name, whatever the multipart boundary or transfer encoding) replays the first response, and a different file under the same key is 422 &#x60;idempotency_mismatch&#x60;, also when it has the same length. Nothing is stored for a replay or a mismatch. 
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [file] 
  /// * [idempotencyKey] - Client-generated unique key; replays within 7 days return the stored response.
  /// * [scope] - Attach the file to a resource at once, `<type>:<id>`: the type is one the owning module registered (`ticket`) and the id a UUID. Without it the file is a draft. 
  /// * [siteId] - The site the file belongs to; limits who can read it to site-scoped grants.
  /// * [name] - File name when the `file` part carries none.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [File] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<File>> operationsUploadFile({ 
    required String orgId,
    required MultipartFile file,
    String? idempotencyKey,
    String? scope,
    String? siteId,
    String? name,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/files'.replaceAll('{' r'org_id' '}', orgId.toString());
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
      contentType: 'multipart/form-data',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = FormData.fromMap(<String, dynamic>{
        if (scope != null) r'scope': scope,
        if (siteId != null) r'site_id': siteId,
        if (name != null) r'name': name,
        r'file': file,
      });

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

    File? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<File, File>(rawData, 'File', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<File>(
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

  /// \&quot;+1\&quot; a common ticket
  /// **Release 0.1.** One vote per person; repeating is harmless. Only common tickets.  Permission: &#x60;tickets.open&#x60;.  Problems: &#x60;conflict&#x60; (409).
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [ticketId] - Id of the ticket.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TicketVote] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TicketVote>> operationsVoteTicket({ 
    required String orgId,
    required String ticketId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/tickets/{ticket_id}/vote'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'ticket_id' '}', ticketId.toString());
    final _options = Options(
      method: r'PUT',
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

    TicketVote? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<TicketVote, TicketVote>(rawData, 'TicketVote', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TicketVote>(
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
