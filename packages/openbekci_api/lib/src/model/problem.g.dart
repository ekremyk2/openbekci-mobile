// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProblemCWProxy {
  Problem type(String type);

  Problem title(String title);

  Problem status(int status);

  Problem code(ProblemCodeEnum code);

  Problem detail(String? detail);

  Problem instance(String instance);

  Problem requestId(String? requestId);

  Problem errors(List<ProblemFieldError>? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Problem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Problem(...).copyWith(id: 12, name: "My name")
  /// ````
  Problem call({
    String type,
    String title,
    int status,
    ProblemCodeEnum code,
    String? detail,
    String instance,
    String? requestId,
    List<ProblemFieldError>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProblem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProblem.copyWith.fieldName(...)`
class _$ProblemCWProxyImpl implements _$ProblemCWProxy {
  const _$ProblemCWProxyImpl(this._value);

  final Problem _value;

  @override
  Problem type(String type) => this(type: type);

  @override
  Problem title(String title) => this(title: title);

  @override
  Problem status(int status) => this(status: status);

  @override
  Problem code(ProblemCodeEnum code) => this(code: code);

  @override
  Problem detail(String? detail) => this(detail: detail);

  @override
  Problem instance(String instance) => this(instance: instance);

  @override
  Problem requestId(String? requestId) => this(requestId: requestId);

  @override
  Problem errors(List<ProblemFieldError>? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Problem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Problem(...).copyWith(id: 12, name: "My name")
  /// ````
  Problem call({
    Object? type = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? instance = const $CopyWithPlaceholder(),
    Object? requestId = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return Problem(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as ProblemCodeEnum,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as String?,
      instance: instance == const $CopyWithPlaceholder()
          ? _value.instance
          // ignore: cast_nullable_to_non_nullable
          : instance as String,
      requestId: requestId == const $CopyWithPlaceholder()
          ? _value.requestId
          // ignore: cast_nullable_to_non_nullable
          : requestId as String?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as List<ProblemFieldError>?,
    );
  }
}

extension $ProblemCopyWith on Problem {
  /// Returns a callable class that can be used as follows: `instanceOfProblem.copyWith(...)` or like so:`instanceOfProblem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProblemCWProxy get copyWith => _$ProblemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problem _$ProblemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Problem',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['type', 'title', 'status', 'code', 'instance'],
    );
    final val = Problem(
      type: $checkedConvert('type', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      status: $checkedConvert('status', (v) => (v as num).toInt()),
      code: $checkedConvert(
        'code',
        (v) => $enumDecode(
          _$ProblemCodeEnumEnumMap,
          v,
          unknownValue: ProblemCodeEnum.unknownDefaultOpenApi,
        ),
      ),
      detail: $checkedConvert('detail', (v) => v as String?),
      instance: $checkedConvert('instance', (v) => v as String),
      requestId: $checkedConvert('request_id', (v) => v as String?),
      errors: $checkedConvert(
        'errors',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ProblemFieldError.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'requestId': 'request_id'},
);

Map<String, dynamic> _$ProblemToJson(Problem instance) => <String, dynamic>{
  'type': instance.type,
  'title': instance.title,
  'status': instance.status,
  'code': _$ProblemCodeEnumEnumMap[instance.code]!,
  'detail': ?instance.detail,
  'instance': instance.instance,
  'request_id': ?instance.requestId,
  'errors': ?instance.errors?.map((e) => e.toJson()).toList(),
};

const _$ProblemCodeEnumEnumMap = {
  ProblemCodeEnum.validationFailed: 'validation_failed',
  ProblemCodeEnum.badRequest: 'bad_request',
  ProblemCodeEnum.unauthenticated: 'unauthenticated',
  ProblemCodeEnum.notFound: 'not_found',
  ProblemCodeEnum.conflict: 'conflict',
  ProblemCodeEnum.versionConflict: 'version_conflict',
  ProblemCodeEnum.idempotencyMismatch: 'idempotency_mismatch',
  ProblemCodeEnum.lockedPeriod: 'locked_period',
  ProblemCodeEnum.insufficientPermission: 'insufficient_permission',
  ProblemCodeEnum.reauthRequired: 'reauth_required',
  ProblemCodeEnum.mfaRequired: 'mfa_required',
  ProblemCodeEnum.invalidGrant: 'invalid_grant',
  ProblemCodeEnum.guardSessionRequired: 'guard_session_required',
  ProblemCodeEnum.guardSessionExpired: 'guard_session_expired',
  ProblemCodeEnum.rateLimited: 'rate_limited',
  ProblemCodeEnum.packError: 'pack_error',
  ProblemCodeEnum.siteOffboarded: 'site_offboarded',
  ProblemCodeEnum.internalError: 'internal_error',
  ProblemCodeEnum.csrfFailed: 'csrf_failed',
  ProblemCodeEnum.smsUnavailable: 'sms_unavailable',
  ProblemCodeEnum.mailUnavailable: 'mail_unavailable',
  ProblemCodeEnum.payloadTooLarge: 'payload_too_large',
  ProblemCodeEnum.methodNotAllowed: 'method_not_allowed',
  ProblemCodeEnum.unsupportedMediaType: 'unsupported_media_type',
  ProblemCodeEnum.timeout: 'timeout',
  ProblemCodeEnum.scanUnavailable: 'scan_unavailable',
  ProblemCodeEnum.agentOffline: 'agent_offline',
  ProblemCodeEnum.agentSessionExpired: 'agent_session_expired',
  ProblemCodeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
