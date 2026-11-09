import 'package:openbekci_api/openbekci_api.dart'
    show
        FolderKindEnum,
        PaymentStatusEnum,
        SessionClientEnum,
        StatementLineKindEnum,
        TicketCategoryDefaultVisibilityEnum,
        TicketVisibilityEnum;
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

// ---------------------------------------------------------------------------
// Enum and code labels (mobile plan section 12: one place, with a fallback).
//
// Generated enums decode an unknown wire value to `unknownDefaultOpenApi`
// (ADR 0001), which shows the neutral "Other" label; string-typed codes
// (notification types, ticket status names) fall back to the raw value.
// ---------------------------------------------------------------------------

/// `owner` / `tenant` side of a unit; other values are shown as received.
String sideLabel(AppLocalizations l, String kind) => switch (kind) {
  'owner' => l.sideOwner,
  'tenant' => l.sideTenant,
  _ => kind,
};

String statementKindLabel(AppLocalizations l, StatementLineKindEnum kind) =>
    switch (kind) {
      StatementLineKindEnum.opening => l.stmtKindOpening,
      StatementLineKindEnum.charge => l.stmtKindCharge,
      StatementLineKindEnum.payment => l.stmtKindPayment,
      StatementLineKindEnum.lateFee ||
      StatementLineKindEnum.fee => l.stmtKindLateFee,
      StatementLineKindEnum.waiver => l.stmtKindWaiver,
      StatementLineKindEnum.declaredPayment => l.paymentDeclaredWaiting,
      StatementLineKindEnum.credit => l.stmtKindCredit,
      StatementLineKindEnum.refund => l.stmtKindRefund,
      StatementLineKindEnum.adjustment => l.stmtKindAdjustment,
      StatementLineKindEnum.reversal => l.stmtKindReversal,
      StatementLineKindEnum.unknownDefaultOpenApi => l.valueOther,
    };

String paymentStatusLabel(AppLocalizations l, PaymentStatusEnum status) =>
    switch (status) {
      PaymentStatusEnum.pendingDeclared => l.paymentDeclaredWaiting,
      PaymentStatusEnum.confirmed => l.paymentConfirmed,
      PaymentStatusEnum.refunded => l.paymentRefunded,
      PaymentStatusEnum.voided => l.paymentVoided,
      PaymentStatusEnum.unknownDefaultOpenApi => l.valueOther,
    };

String paymentMethodLabel(AppLocalizations l, String method) =>
    switch (method) {
      'cash' => l.methodCash,
      'bank_transfer' => l.methodBankTransfer,
      _ when method == 'card' || method.startsWith('card:') => l.methodCard,
      _ => l.valueOther,
    };

String ticketVisibilityLabel(
  AppLocalizations l,
  TicketVisibilityEnum visibility,
) => switch (visibility) {
  TicketVisibilityEnum.private => l.ticketPrivate,
  TicketVisibilityEnum.common => l.ticketCommon,
  TicketVisibilityEnum.unknownDefaultOpenApi => l.valueOther,
};

String folderKindLabel(AppLocalizations l, FolderKindEnum kind) =>
    switch (kind) {
      FolderKindEnum.site => l.folderSite,
      FolderKindEnum.unit => l.folderUnit,
      FolderKindEnum.unknownDefaultOpenApi => l.valueOther,
    };

String sessionClientLabel(AppLocalizations l, SessionClientEnum client) =>
    switch (client) {
      SessionClientEnum.web => l.sessionWeb,
      SessionClientEnum.mobile => l.sessionMobile,
      SessionClientEnum.unknownDefaultOpenApi => l.valueOther,
    };

/// Title of a notification type; unknown types show the raw type string.
String notificationTypeLabel(AppLocalizations l, String type) => switch (type) {
  'announcement.published' => l.notifAnnouncementPublished,
  'charge.due_soon' => l.notifChargeDueSoon,
  'charge.overdue' => l.notifChargeOverdue,
  'dunning.reminder' => l.notifDunningReminder,
  'payment.receipt' => l.notifPaymentReceipt,
  'payment.declared' => l.notifPaymentDeclared,
  'payment.confirmed' => l.notifPaymentConfirmed,
  'payment.rejected' => l.notifPaymentRejected,
  'statement.sent' => l.notifStatementSent,
  'ticket.updated' => l.notifTicketUpdated,
  'ticket.commented' => l.notifTicketCommented,
  'claim.requested' => l.notifClaimRequested,
  'claim.decided' => l.notifClaimDecided,
  'meeting.called' => l.notifMeetingCalled,
  'meeting.decisions' => l.notifMeetingDecisions,
  'meeting.assembly_due' => l.notifMeetingAssemblyDue,
  'delivery.waiting' => l.notifDeliveryWaiting,
  'delivery.received' => l.notifDeliveryReceived,
  'visitor.qr_rotated' => l.notifVisitorQrRotated,
  'visitor.approval_requested' => l.notifVisitorApproval,
  'visitor.arrived' => l.notifVisitorArrived,
  'booking.confirmed' => l.notifBookingConfirmed,
  'booking.cancelled' => l.notifBookingCancelled,
  'term.expiring' => l.notifTermExpiring,
  _ => type,
};

/// Label of a ticket category's default visibility, for the create form.
String categoryVisibilityLabel(
  AppLocalizations l,
  TicketCategoryDefaultVisibilityEnum v,
) => switch (v) {
  TicketCategoryDefaultVisibilityEnum.private => l.ticketPrivate,
  TicketCategoryDefaultVisibilityEnum.common => l.ticketCommon,
  TicketCategoryDefaultVisibilityEnum.unknownDefaultOpenApi => l.valueOther,
};
