import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// The single place that maps backend problem codes (backend plan section 8)
/// to ARB strings. Unknown codes get the generic message; the UI offers the
/// raw code under "details" via [errorDetails].
String errorMessage(AppLocalizations l, AppError error) {
  return _byCode(l, error.code) ?? l.errorGeneric;
}

/// True when [errorMessage] had a specific string for the code.
bool isKnownErrorCode(AppLocalizations l, String code) =>
    _byCode(l, code) != null;

/// Text for the "details" disclosure: the code plus the request id, so a
/// support request can quote it.
String errorDetails(AppLocalizations l, AppError error) {
  final parts = <String>[
    l.errorCodeLabel(error.code),
    if (error.requestId != null) error.requestId!,
  ];
  return parts.join(' · ');
}

/// Message for one field error, or null when the code has no string (callers
/// then show the problem's own message).
String fieldErrorMessage(AppLocalizations l, FieldError error) {
  switch (error.code) {
    case 'required':
      return l.fieldErrorRequired;
    case 'too_short':
    case 'too_small':
      return l.fieldErrorTooShort;
    case 'too_long':
    case 'too_large':
      return l.fieldErrorTooLong;
    default:
      return l.fieldErrorInvalid;
  }
}

String? _byCode(AppLocalizations l, String code) {
  switch (code) {
    case 'validation_failed':
      return l.errorCode_validation_failed;
    case 'bad_request':
      return l.errorCode_bad_request;
    case 'unauthenticated':
      return l.errorCode_unauthenticated;
    case 'not_found':
      return l.errorCode_not_found;
    case 'conflict':
      return l.errorCode_conflict;
    case 'version_conflict':
      return l.errorCode_version_conflict;
    case 'idempotency_mismatch':
      return l.errorCode_idempotency_mismatch;
    case 'locked_period':
      return l.errorCode_locked_period;
    case 'insufficient_permission':
      return l.errorCode_insufficient_permission;
    case 'reauth_required':
      return l.errorCode_reauth_required;
    case 'invalid_grant':
      return l.errorCode_invalid_grant;
    case 'rate_limited':
      return l.errorCode_rate_limited;
    case 'site_offboarded':
      return l.errorCode_site_offboarded;
    case 'internal_error':
      return l.errorCode_internal_error;
    case 'sms_unavailable':
      return l.errorCode_sms_unavailable;
    case 'mail_unavailable':
      return l.errorCode_mail_unavailable;
    case 'payload_too_large':
      return l.errorCode_payload_too_large;
    case 'timeout':
      return l.errorCode_timeout;
    case 'network':
      return l.errorCode_network;
    case 'insecure_server':
      return l.errorCode_insecure_server;
    case 'not_openbekci':
      return l.errorCode_not_openbekci;
  }
  return null;
}
