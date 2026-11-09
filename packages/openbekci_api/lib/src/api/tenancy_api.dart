//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openbekci_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:openbekci_api/src/model/bank_details.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/site.dart';
import 'package:openbekci_api/src/model/site_settings.dart';

class TenancyApi {

  final Dio _dio;

  const TenancyApi(this._dio);

  /// Get bank details
  /// **Release 0.1.** IBAN and holder shown to payers; with &#x60;unit_id&#x60; and &#x60;debtor_kind&#x60; also the suggested transfer reference.  Permission: &#x60;sites.bank_details&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - Id of the site.
  /// * [unitId] - Filter by unit.
  /// * [debtorKind] - Debtor side of the unit: owner or tenant.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [BankDetails] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BankDetails>> tenancyGetBankDetails({ 
    required String orgId,
    required String siteId,
    String? unitId,
    String? debtorKind,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/sites/{site_id}/bank-details'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'site_id' '}', siteId.toString());
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
      if (debtorKind != null) r'debtor_kind': debtorKind,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    BankDetails? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<BankDetails, BankDetails>(rawData, 'BankDetails', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<BankDetails>(
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

  /// Get site
  /// **Release 0.1.** Get site.  Permission: &#x60;sites.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - Id of the site.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Site] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Site>> tenancyGetSite({ 
    required String orgId,
    required String siteId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/sites/{site_id}'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'site_id' '}', siteId.toString());
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

    Site? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Site, Site>(rawData, 'Site', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Site>(
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

  /// Get site settings
  /// **Release 0.1.** Get site settings.  Permission: &#x60;sites.read&#x60;.
  ///
  /// Parameters:
  /// * [orgId] - Organization id.
  /// * [siteId] - Id of the site.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SiteSettings] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SiteSettings>> tenancyGetSiteSettings({ 
    required String orgId,
    required String siteId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/v1/orgs/{org_id}/sites/{site_id}/settings'.replaceAll('{' r'org_id' '}', orgId.toString()).replaceAll('{' r'site_id' '}', siteId.toString());
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

    SiteSettings? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SiteSettings, SiteSettings>(rawData, 'SiteSettings', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SiteSettings>(
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
