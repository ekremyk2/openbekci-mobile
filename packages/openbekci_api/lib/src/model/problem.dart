//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/problem_field_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'problem.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Problem {
  /// Returns a new [Problem] instance.
  Problem({

    required  this.type,

    required  this.title,

    required  this.status,

    required  this.code,

     this.detail,

    required  this.instance,

     this.requestId,

     this.errors,
  });

      /// URI reference identifying the problem type; `about:blank` unless documented.
  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final String type;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



      /// HTTP status code.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final int status;



      /// Stable machine-readable error code. Open enum.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  unknownEnumValue: ProblemCodeEnum.unknownDefaultOpenApi,
  )


  final ProblemCodeEnum code;



      /// Human-readable explanation, not for machine parsing.
  @JsonKey(
    
    name: r'detail',
    required: false,
    includeIfNull: false,
  )


  final String? detail;



      /// The request id (also in the `X-Request-Id` response header), for support and logs.
  @JsonKey(
    
    name: r'instance',
    required: true,
    includeIfNull: false,
  )


  final String instance;



      /// Same value as `instance`.
  @JsonKey(
    
    name: r'request_id',
    required: false,
    includeIfNull: false,
  )


  final String? requestId;



      /// Per-field errors (with `validation_failed`).
  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final List<ProblemFieldError>? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Problem &&
      other.type == type &&
      other.title == title &&
      other.status == status &&
      other.code == code &&
      other.detail == detail &&
      other.instance == instance &&
      other.requestId == requestId &&
      other.errors == errors;

    @override
    int get hashCode =>
        type.hashCode +
        title.hashCode +
        status.hashCode +
        code.hashCode +
        detail.hashCode +
        instance.hashCode +
        requestId.hashCode +
        errors.hashCode;

  factory Problem.fromJson(Map<String, dynamic> json) => _$ProblemFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Stable machine-readable error code. Open enum.
enum ProblemCodeEnum {
@JsonValue(r'validation_failed')
validationFailed(r'validation_failed'),
@JsonValue(r'bad_request')
badRequest(r'bad_request'),
@JsonValue(r'unauthenticated')
unauthenticated(r'unauthenticated'),
@JsonValue(r'not_found')
notFound(r'not_found'),
@JsonValue(r'conflict')
conflict(r'conflict'),
@JsonValue(r'version_conflict')
versionConflict(r'version_conflict'),
@JsonValue(r'idempotency_mismatch')
idempotencyMismatch(r'idempotency_mismatch'),
@JsonValue(r'locked_period')
lockedPeriod(r'locked_period'),
@JsonValue(r'insufficient_permission')
insufficientPermission(r'insufficient_permission'),
@JsonValue(r'reauth_required')
reauthRequired(r'reauth_required'),
@JsonValue(r'mfa_required')
mfaRequired(r'mfa_required'),
@JsonValue(r'invalid_grant')
invalidGrant(r'invalid_grant'),
@JsonValue(r'guard_session_required')
guardSessionRequired(r'guard_session_required'),
@JsonValue(r'guard_session_expired')
guardSessionExpired(r'guard_session_expired'),
@JsonValue(r'rate_limited')
rateLimited(r'rate_limited'),
@JsonValue(r'pack_error')
packError(r'pack_error'),
@JsonValue(r'site_offboarded')
siteOffboarded(r'site_offboarded'),
@JsonValue(r'internal_error')
internalError(r'internal_error'),
@JsonValue(r'csrf_failed')
csrfFailed(r'csrf_failed'),
@JsonValue(r'sms_unavailable')
smsUnavailable(r'sms_unavailable'),
@JsonValue(r'mail_unavailable')
mailUnavailable(r'mail_unavailable'),
@JsonValue(r'payload_too_large')
payloadTooLarge(r'payload_too_large'),
@JsonValue(r'method_not_allowed')
methodNotAllowed(r'method_not_allowed'),
@JsonValue(r'unsupported_media_type')
unsupportedMediaType(r'unsupported_media_type'),
@JsonValue(r'timeout')
timeout(r'timeout'),
@JsonValue(r'scan_unavailable')
scanUnavailable(r'scan_unavailable'),
@JsonValue(r'agent_offline')
agentOffline(r'agent_offline'),
@JsonValue(r'agent_session_expired')
agentSessionExpired(r'agent_session_expired'),
@JsonValue(r'api_key_revoked')
apiKeyRevoked(r'api_key_revoked'),
@JsonValue(r'api_key_expired')
apiKeyExpired(r'api_key_expired'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const ProblemCodeEnum(this.value);

final String value;

@override
String toString() => value;
}


