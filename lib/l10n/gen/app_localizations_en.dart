// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'OpenBekci';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionBack => 'Back';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionRetry => 'Try again';

  @override
  String get actionSignOut => 'Sign out';

  @override
  String get actionCopy => 'Copy';

  @override
  String get stateEmptyTitle => 'Nothing here yet';

  @override
  String get stateErrorTitle => 'Something went wrong';

  @override
  String get stateOfflineTitle => 'You are offline';

  @override
  String get stateOfflineBody =>
      'Showing saved information. It will refresh when you are back online.';

  @override
  String stateUpdatedAt(String when) {
    return 'Updated $when';
  }

  @override
  String get errorDetails => 'Details';

  @override
  String errorCodeLabel(String code) {
    return 'Code: $code';
  }

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorCode_validation_failed =>
      'Some of the information is not valid. Check the fields and try again.';

  @override
  String get errorCode_bad_request =>
      'The request was not understood. Please try again.';

  @override
  String get errorCode_unauthenticated =>
      'Your session has ended. Please sign in again.';

  @override
  String get errorCode_not_found =>
      'We could not find what you are looking for.';

  @override
  String get errorCode_conflict =>
      'This conflicts with the current state. Reload and try again.';

  @override
  String get errorCode_version_conflict =>
      'This was changed by someone else. Reload and redo your change.';

  @override
  String get errorCode_idempotency_mismatch =>
      'This request was already sent with different content.';

  @override
  String get errorCode_locked_period =>
      'This period is closed and cannot be changed.';

  @override
  String get errorCode_insufficient_permission =>
      'You do not have permission to do this.';

  @override
  String get errorCode_reauth_required =>
      'Please confirm it is you to continue.';

  @override
  String get errorCode_invalid_grant =>
      'The code, password or link is wrong or has expired.';

  @override
  String get errorCode_rate_limited =>
      'Too many attempts. Please wait a moment and try again.';

  @override
  String get errorCode_site_offboarded =>
      'This site is no longer active on this server.';

  @override
  String get errorCode_internal_error =>
      'The server had a problem. Please try again later.';

  @override
  String get errorCode_sms_unavailable =>
      'This server cannot send text messages right now.';

  @override
  String get errorCode_mail_unavailable =>
      'This server cannot send email right now.';

  @override
  String get errorCode_payload_too_large => 'The data is too large to send.';

  @override
  String get errorCode_timeout =>
      'The server took too long to answer. Please try again.';

  @override
  String get errorCode_network =>
      'Cannot reach the server. Check your connection.';

  @override
  String get errorCode_insecure_server => 'This server must use HTTPS.';

  @override
  String get errorCode_not_openbekci =>
      'That address does not look like an OpenBekci server.';

  @override
  String get fieldErrorRequired => 'This field is required.';

  @override
  String get fieldErrorInvalid => 'This value is not valid.';

  @override
  String get fieldErrorTooShort => 'This value is too short.';

  @override
  String get fieldErrorTooLong => 'This value is too long.';

  @override
  String get serverTitle => 'Connect to your site';

  @override
  String get serverBody =>
      'Enter the address of your OpenBekci server, or scan the QR code your manager gave you.';

  @override
  String get serverFieldLabel => 'Server address';

  @override
  String get serverFieldHint => 'example.org';

  @override
  String get serverConnect => 'Connect';

  @override
  String get serverScanQr => 'Scan QR code';

  @override
  String get serverChecking => 'Checking the server…';

  @override
  String get serverPendingInvite =>
      'Enter the server address to open your invitation.';

  @override
  String get serverPendingJoin => 'Enter the server address to join your site.';

  @override
  String get serverPendingMagic =>
      'Enter the server address to finish signing in.';

  @override
  String get scanTitle => 'Scan QR code';

  @override
  String get scanHint => 'Point the camera at the site or invitation QR code.';

  @override
  String get scanNotRecognized => 'This QR code is not an OpenBekci link.';

  @override
  String get scanPermissionDenied =>
      'Camera access is needed to scan. You can enter the address instead.';

  @override
  String get gateUpdateTitle => 'Update the app';

  @override
  String gateUpdateBody(String min, String current) {
    return 'This server needs app version $min or newer (you have $current).';
  }

  @override
  String get gateServerTitle => 'Server not supported';

  @override
  String gateServerBody(String version) {
    return 'This server runs version $version, which this app cannot talk to. Ask your manager to update the server.';
  }

  @override
  String get gateChangeServer => 'Use another server';

  @override
  String get signInTitle => 'Sign in';

  @override
  String signInServerLine(String name) {
    return 'Signing in to $name';
  }

  @override
  String get signInMethodSms => 'Text message code';

  @override
  String get signInMethodSmsHint => 'We text a 6-digit code to your phone.';

  @override
  String get signInMethodPassword => 'Password';

  @override
  String get signInMethodPasswordHint =>
      'Use your email or phone and password.';

  @override
  String get signInMethodMagic => 'Email link';

  @override
  String get signInMethodMagicHint => 'We email you a link that signs you in.';

  @override
  String get signInMethodUnavailable => 'Not available in this app yet';

  @override
  String get signInNoMethods =>
      'This server offers no sign-in method this app supports.';

  @override
  String get smsPhoneLabel => 'Phone number';

  @override
  String get smsPhoneHint => '+90 5xx xxx xx xx';

  @override
  String get smsSendCode => 'Send code';

  @override
  String get smsCodeTitle => 'Enter the code';

  @override
  String smsCodeSent(String phone) {
    return 'We sent a code to $phone, if that number has an account.';
  }

  @override
  String get smsCodeLabel => '6-digit code';

  @override
  String get smsVerify => 'Sign in';

  @override
  String get smsResend => 'Send again';

  @override
  String smsResendIn(int seconds) {
    return 'Send again in $seconds s';
  }

  @override
  String get passwordIdentifierLabel => 'Email or phone';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordSignIn => 'Sign in';

  @override
  String get passwordShow => 'Show password';

  @override
  String get passwordHide => 'Hide password';

  @override
  String get magicEmailLabel => 'Email address';

  @override
  String get magicSend => 'Send link';

  @override
  String get magicSentTitle => 'Check your email';

  @override
  String magicSentBody(String email) {
    return 'If $email has an account, we sent a link. Open it on this phone to sign in.';
  }

  @override
  String get magicConsuming => 'Signing you in…';

  @override
  String get inviteTitle => 'Your invitation';

  @override
  String inviteBody(String org, String site) {
    return '$org · $site';
  }

  @override
  String inviteUnit(String door) {
    return 'Unit $door';
  }

  @override
  String get inviteExistingAccount =>
      'You already have an account. Accepting links it to this site.';

  @override
  String get inviteNewAccount => 'Choose a password to create your account.';

  @override
  String get inviteDisplayName => 'Your name';

  @override
  String get invitePassword => 'New password (at least 10 characters)';

  @override
  String get inviteAccept => 'Accept invitation';

  @override
  String get inviteInvalid => 'This invitation is invalid or has expired.';

  @override
  String joinTitle(String site) {
    return 'Join $site';
  }

  @override
  String joinOrg(String org) {
    return 'Managed by $org';
  }

  @override
  String get joinSignInFirst => 'Sign in first, then choose your unit.';

  @override
  String get joinBlock => 'Block';

  @override
  String get joinAllBlocks => 'All blocks';

  @override
  String get joinSearchUnit => 'Search door number';

  @override
  String get joinNoUnits => 'No units found.';

  @override
  String get joinRoleTitle => 'I am the';

  @override
  String get joinRoleOwner => 'Owner';

  @override
  String get joinRoleTenant => 'Tenant';

  @override
  String get joinRoleHousehold => 'Household member';

  @override
  String get joinNote => 'Note for your manager (optional)';

  @override
  String get joinSubmit => 'Send request';

  @override
  String joinUnitLine(String block, String door) {
    return '$block · $door';
  }

  @override
  String get claimWaitingTitle => 'Waiting for approval';

  @override
  String claimWaitingBody(String door) {
    return 'Your manager will review your request for unit $door. You will get access as soon as it is approved.';
  }

  @override
  String get claimApprovedTitle => 'Approved';

  @override
  String get claimRejectedTitle => 'Not approved';

  @override
  String get claimRejectedBody => 'Your manager did not approve this request.';

  @override
  String claimUnknownStatus(String status) {
    return 'Status: $status';
  }

  @override
  String get claimGoHome => 'Go to home';

  @override
  String get homeTitle => 'Home';

  @override
  String homeWelcome(String name) {
    return 'Hello, $name';
  }

  @override
  String get homeNoUnits => 'No units are linked to your account yet.';

  @override
  String homePendingClaim(String door) {
    return 'Request for $door: waiting for approval';
  }

  @override
  String get homePhaseNote => 'More screens arrive in the next releases.';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileName => 'Name';

  @override
  String get profilePhone => 'Phone';

  @override
  String get profileEmail => 'Email';

  @override
  String get profileServer => 'Server';

  @override
  String get profileOrganizations => 'Organizations';

  @override
  String get profileUnits => 'My units';

  @override
  String get profileSignOutConfirm =>
      'Sign out of this server? Saved data on this phone will be deleted.';

  @override
  String get occupancyOwner => 'Owner';

  @override
  String get occupancyTenant => 'Tenant';

  @override
  String get occupancyHousehold => 'Household member';

  @override
  String get occupancyFormer => 'Former resident';

  @override
  String get occupancyUnknown => 'Resident';

  @override
  String get navHome => 'Home';

  @override
  String get navProfile => 'Profile';
}
