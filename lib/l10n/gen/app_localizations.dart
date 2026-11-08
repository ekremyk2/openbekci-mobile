import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'OpenBekci'**
  String get appName;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get actionRetry;

  /// No description provided for @actionSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get actionSignOut;

  /// No description provided for @actionCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// No description provided for @stateEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get stateEmptyTitle;

  /// No description provided for @stateErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get stateErrorTitle;

  /// No description provided for @stateOfflineTitle.
  ///
  /// In en, this message translates to:
  /// **'You are offline'**
  String get stateOfflineTitle;

  /// No description provided for @stateOfflineBody.
  ///
  /// In en, this message translates to:
  /// **'Showing saved information. It will refresh when you are back online.'**
  String get stateOfflineBody;

  /// No description provided for @stateUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated {when}'**
  String stateUpdatedAt(String when);

  /// No description provided for @errorDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get errorDetails;

  /// No description provided for @errorCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code: {code}'**
  String errorCodeLabel(String code);

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorCode_validation_failed.
  ///
  /// In en, this message translates to:
  /// **'Some of the information is not valid. Check the fields and try again.'**
  String get errorCode_validation_failed;

  /// No description provided for @errorCode_bad_request.
  ///
  /// In en, this message translates to:
  /// **'The request was not understood. Please try again.'**
  String get errorCode_bad_request;

  /// No description provided for @errorCode_unauthenticated.
  ///
  /// In en, this message translates to:
  /// **'Your session has ended. Please sign in again.'**
  String get errorCode_unauthenticated;

  /// No description provided for @errorCode_not_found.
  ///
  /// In en, this message translates to:
  /// **'We could not find what you are looking for.'**
  String get errorCode_not_found;

  /// No description provided for @errorCode_conflict.
  ///
  /// In en, this message translates to:
  /// **'This conflicts with the current state. Reload and try again.'**
  String get errorCode_conflict;

  /// No description provided for @errorCode_version_conflict.
  ///
  /// In en, this message translates to:
  /// **'This was changed by someone else. Reload and redo your change.'**
  String get errorCode_version_conflict;

  /// No description provided for @errorCode_idempotency_mismatch.
  ///
  /// In en, this message translates to:
  /// **'This request was already sent with different content.'**
  String get errorCode_idempotency_mismatch;

  /// No description provided for @errorCode_locked_period.
  ///
  /// In en, this message translates to:
  /// **'This period is closed and cannot be changed.'**
  String get errorCode_locked_period;

  /// No description provided for @errorCode_insufficient_permission.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to do this.'**
  String get errorCode_insufficient_permission;

  /// No description provided for @errorCode_reauth_required.
  ///
  /// In en, this message translates to:
  /// **'Please confirm it is you to continue.'**
  String get errorCode_reauth_required;

  /// No description provided for @errorCode_invalid_grant.
  ///
  /// In en, this message translates to:
  /// **'The code, password or link is wrong or has expired.'**
  String get errorCode_invalid_grant;

  /// No description provided for @errorCode_rate_limited.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please wait a moment and try again.'**
  String get errorCode_rate_limited;

  /// No description provided for @errorCode_site_offboarded.
  ///
  /// In en, this message translates to:
  /// **'This site is no longer active on this server.'**
  String get errorCode_site_offboarded;

  /// No description provided for @errorCode_internal_error.
  ///
  /// In en, this message translates to:
  /// **'The server had a problem. Please try again later.'**
  String get errorCode_internal_error;

  /// No description provided for @errorCode_sms_unavailable.
  ///
  /// In en, this message translates to:
  /// **'This server cannot send text messages right now.'**
  String get errorCode_sms_unavailable;

  /// No description provided for @errorCode_mail_unavailable.
  ///
  /// In en, this message translates to:
  /// **'This server cannot send email right now.'**
  String get errorCode_mail_unavailable;

  /// No description provided for @errorCode_payload_too_large.
  ///
  /// In en, this message translates to:
  /// **'The data is too large to send.'**
  String get errorCode_payload_too_large;

  /// No description provided for @errorCode_timeout.
  ///
  /// In en, this message translates to:
  /// **'The server took too long to answer. Please try again.'**
  String get errorCode_timeout;

  /// No description provided for @errorCode_network.
  ///
  /// In en, this message translates to:
  /// **'Cannot reach the server. Check your connection.'**
  String get errorCode_network;

  /// No description provided for @errorCode_insecure_server.
  ///
  /// In en, this message translates to:
  /// **'This server must use HTTPS.'**
  String get errorCode_insecure_server;

  /// No description provided for @errorCode_not_openbekci.
  ///
  /// In en, this message translates to:
  /// **'That address does not look like an OpenBekci server.'**
  String get errorCode_not_openbekci;

  /// No description provided for @fieldErrorRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get fieldErrorRequired;

  /// No description provided for @fieldErrorInvalid.
  ///
  /// In en, this message translates to:
  /// **'This value is not valid.'**
  String get fieldErrorInvalid;

  /// No description provided for @fieldErrorTooShort.
  ///
  /// In en, this message translates to:
  /// **'This value is too short.'**
  String get fieldErrorTooShort;

  /// No description provided for @fieldErrorTooLong.
  ///
  /// In en, this message translates to:
  /// **'This value is too long.'**
  String get fieldErrorTooLong;

  /// No description provided for @serverTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect to your site'**
  String get serverTitle;

  /// No description provided for @serverBody.
  ///
  /// In en, this message translates to:
  /// **'Enter the address of your OpenBekci server, or scan the QR code your manager gave you.'**
  String get serverBody;

  /// No description provided for @serverFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Server address'**
  String get serverFieldLabel;

  /// No description provided for @serverFieldHint.
  ///
  /// In en, this message translates to:
  /// **'example.org'**
  String get serverFieldHint;

  /// No description provided for @serverConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get serverConnect;

  /// No description provided for @serverScanQr.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get serverScanQr;

  /// No description provided for @serverChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking the server…'**
  String get serverChecking;

  /// No description provided for @serverPendingInvite.
  ///
  /// In en, this message translates to:
  /// **'Enter the server address to open your invitation.'**
  String get serverPendingInvite;

  /// No description provided for @serverPendingJoin.
  ///
  /// In en, this message translates to:
  /// **'Enter the server address to join your site.'**
  String get serverPendingJoin;

  /// No description provided for @serverPendingMagic.
  ///
  /// In en, this message translates to:
  /// **'Enter the server address to finish signing in.'**
  String get serverPendingMagic;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get scanTitle;

  /// No description provided for @scanHint.
  ///
  /// In en, this message translates to:
  /// **'Point the camera at the site or invitation QR code.'**
  String get scanHint;

  /// No description provided for @scanNotRecognized.
  ///
  /// In en, this message translates to:
  /// **'This QR code is not an OpenBekci link.'**
  String get scanNotRecognized;

  /// No description provided for @scanPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access is needed to scan. You can enter the address instead.'**
  String get scanPermissionDenied;

  /// No description provided for @gateUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update the app'**
  String get gateUpdateTitle;

  /// No description provided for @gateUpdateBody.
  ///
  /// In en, this message translates to:
  /// **'This server needs app version {min} or newer (you have {current}).'**
  String gateUpdateBody(String min, String current);

  /// No description provided for @gateServerTitle.
  ///
  /// In en, this message translates to:
  /// **'Server not supported'**
  String get gateServerTitle;

  /// No description provided for @gateServerBody.
  ///
  /// In en, this message translates to:
  /// **'This server runs version {version}, which this app cannot talk to. Ask your manager to update the server.'**
  String gateServerBody(String version);

  /// No description provided for @gateChangeServer.
  ///
  /// In en, this message translates to:
  /// **'Use another server'**
  String get gateChangeServer;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInTitle;

  /// No description provided for @signInServerLine.
  ///
  /// In en, this message translates to:
  /// **'Signing in to {name}'**
  String signInServerLine(String name);

  /// No description provided for @signInMethodSms.
  ///
  /// In en, this message translates to:
  /// **'Text message code'**
  String get signInMethodSms;

  /// No description provided for @signInMethodSmsHint.
  ///
  /// In en, this message translates to:
  /// **'We text a 6-digit code to your phone.'**
  String get signInMethodSmsHint;

  /// No description provided for @signInMethodPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInMethodPassword;

  /// No description provided for @signInMethodPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Use your email or phone and password.'**
  String get signInMethodPasswordHint;

  /// No description provided for @signInMethodMagic.
  ///
  /// In en, this message translates to:
  /// **'Email link'**
  String get signInMethodMagic;

  /// No description provided for @signInMethodMagicHint.
  ///
  /// In en, this message translates to:
  /// **'We email you a link that signs you in.'**
  String get signInMethodMagicHint;

  /// No description provided for @signInMethodUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Not available in this app yet'**
  String get signInMethodUnavailable;

  /// No description provided for @signInNoMethods.
  ///
  /// In en, this message translates to:
  /// **'This server offers no sign-in method this app supports.'**
  String get signInNoMethods;

  /// No description provided for @smsPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get smsPhoneLabel;

  /// No description provided for @smsPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'+90 5xx xxx xx xx'**
  String get smsPhoneHint;

  /// No description provided for @smsSendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get smsSendCode;

  /// No description provided for @smsCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get smsCodeTitle;

  /// No description provided for @smsCodeSent.
  ///
  /// In en, this message translates to:
  /// **'We sent a code to {phone}, if that number has an account.'**
  String smsCodeSent(String phone);

  /// No description provided for @smsCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'6-digit code'**
  String get smsCodeLabel;

  /// No description provided for @smsVerify.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get smsVerify;

  /// No description provided for @smsResend.
  ///
  /// In en, this message translates to:
  /// **'Send again'**
  String get smsResend;

  /// No description provided for @smsResendIn.
  ///
  /// In en, this message translates to:
  /// **'Send again in {seconds} s'**
  String smsResendIn(int seconds);

  /// No description provided for @passwordIdentifierLabel.
  ///
  /// In en, this message translates to:
  /// **'Email or phone'**
  String get passwordIdentifierLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get passwordSignIn;

  /// No description provided for @passwordShow.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get passwordShow;

  /// No description provided for @passwordHide.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get passwordHide;

  /// No description provided for @magicEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get magicEmailLabel;

  /// No description provided for @magicSend.
  ///
  /// In en, this message translates to:
  /// **'Send link'**
  String get magicSend;

  /// No description provided for @magicSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get magicSentTitle;

  /// No description provided for @magicSentBody.
  ///
  /// In en, this message translates to:
  /// **'If {email} has an account, we sent a link. Open it on this phone to sign in.'**
  String magicSentBody(String email);

  /// No description provided for @magicConsuming.
  ///
  /// In en, this message translates to:
  /// **'Signing you in…'**
  String get magicConsuming;

  /// No description provided for @inviteTitle.
  ///
  /// In en, this message translates to:
  /// **'Your invitation'**
  String get inviteTitle;

  /// No description provided for @inviteBody.
  ///
  /// In en, this message translates to:
  /// **'{org} · {site}'**
  String inviteBody(String org, String site);

  /// No description provided for @inviteUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit {door}'**
  String inviteUnit(String door);

  /// No description provided for @inviteExistingAccount.
  ///
  /// In en, this message translates to:
  /// **'You already have an account. Accepting links it to this site.'**
  String get inviteExistingAccount;

  /// No description provided for @inviteNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose a password to create your account.'**
  String get inviteNewAccount;

  /// No description provided for @inviteDisplayName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get inviteDisplayName;

  /// No description provided for @invitePassword.
  ///
  /// In en, this message translates to:
  /// **'New password (at least 10 characters)'**
  String get invitePassword;

  /// No description provided for @inviteAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept invitation'**
  String get inviteAccept;

  /// No description provided for @inviteInvalid.
  ///
  /// In en, this message translates to:
  /// **'This invitation is invalid or has expired.'**
  String get inviteInvalid;

  /// No description provided for @joinTitle.
  ///
  /// In en, this message translates to:
  /// **'Join {site}'**
  String joinTitle(String site);

  /// No description provided for @joinOrg.
  ///
  /// In en, this message translates to:
  /// **'Managed by {org}'**
  String joinOrg(String org);

  /// No description provided for @joinSignInFirst.
  ///
  /// In en, this message translates to:
  /// **'Sign in first, then choose your unit.'**
  String get joinSignInFirst;

  /// No description provided for @joinBlock.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get joinBlock;

  /// No description provided for @joinAllBlocks.
  ///
  /// In en, this message translates to:
  /// **'All blocks'**
  String get joinAllBlocks;

  /// No description provided for @joinSearchUnit.
  ///
  /// In en, this message translates to:
  /// **'Search door number'**
  String get joinSearchUnit;

  /// No description provided for @joinNoUnits.
  ///
  /// In en, this message translates to:
  /// **'No units found.'**
  String get joinNoUnits;

  /// No description provided for @joinRoleTitle.
  ///
  /// In en, this message translates to:
  /// **'I am the'**
  String get joinRoleTitle;

  /// No description provided for @joinRoleOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get joinRoleOwner;

  /// No description provided for @joinRoleTenant.
  ///
  /// In en, this message translates to:
  /// **'Tenant'**
  String get joinRoleTenant;

  /// No description provided for @joinRoleHousehold.
  ///
  /// In en, this message translates to:
  /// **'Household member'**
  String get joinRoleHousehold;

  /// No description provided for @joinNote.
  ///
  /// In en, this message translates to:
  /// **'Note for your manager (optional)'**
  String get joinNote;

  /// No description provided for @joinSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get joinSubmit;

  /// No description provided for @joinUnitLine.
  ///
  /// In en, this message translates to:
  /// **'{block} · {door}'**
  String joinUnitLine(String block, String door);

  /// No description provided for @claimWaitingTitle.
  ///
  /// In en, this message translates to:
  /// **'Waiting for approval'**
  String get claimWaitingTitle;

  /// No description provided for @claimWaitingBody.
  ///
  /// In en, this message translates to:
  /// **'Your manager will review your request for unit {door}. You will get access as soon as it is approved.'**
  String claimWaitingBody(String door);

  /// No description provided for @claimApprovedTitle.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get claimApprovedTitle;

  /// No description provided for @claimRejectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Not approved'**
  String get claimRejectedTitle;

  /// No description provided for @claimRejectedBody.
  ///
  /// In en, this message translates to:
  /// **'Your manager did not approve this request.'**
  String get claimRejectedBody;

  /// No description provided for @claimUnknownStatus.
  ///
  /// In en, this message translates to:
  /// **'Status: {status}'**
  String claimUnknownStatus(String status);

  /// No description provided for @claimGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go to home'**
  String get claimGoHome;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String homeWelcome(String name);

  /// No description provided for @homeNoUnits.
  ///
  /// In en, this message translates to:
  /// **'No units are linked to your account yet.'**
  String get homeNoUnits;

  /// No description provided for @homePendingClaim.
  ///
  /// In en, this message translates to:
  /// **'Request for {door}: waiting for approval'**
  String homePendingClaim(String door);

  /// No description provided for @homePhaseNote.
  ///
  /// In en, this message translates to:
  /// **'More screens arrive in the next releases.'**
  String get homePhaseNote;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileName;

  /// No description provided for @profilePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profilePhone;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileEmail;

  /// No description provided for @profileServer.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get profileServer;

  /// No description provided for @profileOrganizations.
  ///
  /// In en, this message translates to:
  /// **'Organizations'**
  String get profileOrganizations;

  /// No description provided for @profileUnits.
  ///
  /// In en, this message translates to:
  /// **'My units'**
  String get profileUnits;

  /// No description provided for @profileSignOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign out of this server? Saved data on this phone will be deleted.'**
  String get profileSignOutConfirm;

  /// No description provided for @occupancyOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get occupancyOwner;

  /// No description provided for @occupancyTenant.
  ///
  /// In en, this message translates to:
  /// **'Tenant'**
  String get occupancyTenant;

  /// No description provided for @occupancyHousehold.
  ///
  /// In en, this message translates to:
  /// **'Household member'**
  String get occupancyHousehold;

  /// No description provided for @occupancyFormer.
  ///
  /// In en, this message translates to:
  /// **'Former resident'**
  String get occupancyFormer;

  /// No description provided for @occupancyUnknown.
  ///
  /// In en, this message translates to:
  /// **'Resident'**
  String get occupancyUnknown;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
