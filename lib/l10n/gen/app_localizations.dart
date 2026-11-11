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

  /// No description provided for @aboutLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open-source licenses'**
  String get aboutLicenses;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({build})'**
  String aboutVersion(String version, String build);

  /// No description provided for @accruedLateFeeToday.
  ///
  /// In en, this message translates to:
  /// **'Late fee accrued to today'**
  String get accruedLateFeeToday;

  /// No description provided for @actionCopyValue.
  ///
  /// In en, this message translates to:
  /// **'Copy {label}'**
  String actionCopyValue(String label);

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @announcementAttachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get announcementAttachments;

  /// No description provided for @announcementPinned.
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get announcementPinned;

  /// No description provided for @announcementTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcement'**
  String get announcementTitle;

  /// No description provided for @announcementUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get announcementUnread;

  /// No description provided for @announcementsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No announcements yet.'**
  String get announcementsEmpty;

  /// No description provided for @announcementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcementsTitle;

  /// No description provided for @appLockBody.
  ///
  /// In en, this message translates to:
  /// **'Ask for your fingerprint, face or device PIN when you open the app.'**
  String get appLockBody;

  /// No description provided for @appLockEnable.
  ///
  /// In en, this message translates to:
  /// **'Lock the app'**
  String get appLockEnable;

  /// No description provided for @appLockTitle.
  ///
  /// In en, this message translates to:
  /// **'App lock'**
  String get appLockTitle;

  /// No description provided for @attachmentPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get attachmentPhoto;

  /// No description provided for @balanceToday.
  ///
  /// In en, this message translates to:
  /// **'Balance today'**
  String get balanceToday;

  /// No description provided for @bankDetailsMissing.
  ///
  /// In en, this message translates to:
  /// **'The manager has not published bank details for this site yet.'**
  String get bankDetailsMissing;

  /// No description provided for @bankDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Bank details'**
  String get bankDetailsTitle;

  /// No description provided for @bankHolder.
  ///
  /// In en, this message translates to:
  /// **'Account holder'**
  String get bankHolder;

  /// No description provided for @bankIban.
  ///
  /// In en, this message translates to:
  /// **'IBAN'**
  String get bankIban;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bankName;

  /// No description provided for @bankReference.
  ///
  /// In en, this message translates to:
  /// **'Reference to use'**
  String get bankReference;

  /// No description provided for @closingBalance.
  ///
  /// In en, this message translates to:
  /// **'Closing balance'**
  String get closingBalance;

  /// No description provided for @consentAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get consentAccepted;

  /// No description provided for @consentDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get consentDeclined;

  /// No description provided for @consentDirectory.
  ///
  /// In en, this message translates to:
  /// **'Listed in the directory of {site}'**
  String consentDirectory(String site);

  /// No description provided for @consentsBody.
  ///
  /// In en, this message translates to:
  /// **'Consents you have given or declined. You can change them at any time.'**
  String get consentsBody;

  /// No description provided for @consentsOtherNote.
  ///
  /// In en, this message translates to:
  /// **'This server does not publish other consent texts yet.'**
  String get consentsOtherNote;

  /// No description provided for @consentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Consents'**
  String get consentsTitle;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copiedToClipboard;

  /// No description provided for @creditLabel.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get creditLabel;

  /// No description provided for @declareAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount ({currency})'**
  String declareAmount(String currency);

  /// No description provided for @declareBody.
  ///
  /// In en, this message translates to:
  /// **'Made the transfer? Tell the manager so they can match it. Nothing changes on your statement until they confirm.'**
  String get declareBody;

  /// No description provided for @declareDate.
  ///
  /// In en, this message translates to:
  /// **'Date of the transfer'**
  String get declareDate;

  /// No description provided for @declareNeedsConnection.
  ///
  /// In en, this message translates to:
  /// **'Needs a connection. If sending fails, try again: it will not be declared twice.'**
  String get declareNeedsConnection;

  /// No description provided for @declareNote.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get declareNote;

  /// No description provided for @declareReference.
  ///
  /// In en, this message translates to:
  /// **'Reference (optional)'**
  String get declareReference;

  /// No description provided for @declareSent.
  ///
  /// In en, this message translates to:
  /// **'Declared, awaiting confirmation'**
  String get declareSent;

  /// No description provided for @declareSentBody.
  ///
  /// In en, this message translates to:
  /// **'The manager will confirm it once the money arrives.'**
  String get declareSentBody;

  /// No description provided for @declareSubmit.
  ///
  /// In en, this message translates to:
  /// **'I\'ve paid by transfer'**
  String get declareSubmit;

  /// No description provided for @declareTitle.
  ///
  /// In en, this message translates to:
  /// **'I\'ve paid by transfer'**
  String get declareTitle;

  /// No description provided for @declaredSection.
  ///
  /// In en, this message translates to:
  /// **'Declared, awaiting confirmation'**
  String get declaredSection;

  /// No description provided for @directoryBody.
  ///
  /// In en, this message translates to:
  /// **'Neighbours see your name in the site directory only if you opt in.'**
  String get directoryBody;

  /// No description provided for @directoryListMe.
  ///
  /// In en, this message translates to:
  /// **'List me in the directory'**
  String get directoryListMe;

  /// No description provided for @directoryShowPhone.
  ///
  /// In en, this message translates to:
  /// **'Show my phone number'**
  String get directoryShowPhone;

  /// No description provided for @directoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Directory'**
  String get directoryTitle;

  /// No description provided for @documentGenerated.
  ///
  /// In en, this message translates to:
  /// **'Generated'**
  String get documentGenerated;

  /// No description provided for @documentOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening…'**
  String get documentOpening;

  /// No description provided for @documentShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get documentShare;

  /// No description provided for @documentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No documents here.'**
  String get documentsEmpty;

  /// No description provided for @documentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documentsTitle;

  /// No description provided for @folderSite.
  ///
  /// In en, this message translates to:
  /// **'Site folder'**
  String get folderSite;

  /// No description provided for @folderUnit.
  ///
  /// In en, this message translates to:
  /// **'Your unit\'s folder'**
  String get folderUnit;

  /// No description provided for @formerPeriodNote.
  ///
  /// In en, this message translates to:
  /// **'You see your own period of residence only.'**
  String get formerPeriodNote;

  /// No description provided for @gatePhoneHelp.
  ///
  /// In en, this message translates to:
  /// **'The gate guard calls this number if you do not answer a visitor request in the app.'**
  String get gatePhoneHelp;

  /// No description provided for @gatePhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Gate contact phone'**
  String get gatePhoneLabel;

  /// No description provided for @homeAssemblyUntitled.
  ///
  /// In en, this message translates to:
  /// **'General assembly'**
  String get homeAssemblyUntitled;

  /// No description provided for @homeBookings.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get homeBookings;

  /// No description provided for @homeComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get homeComingSoon;

  /// No description provided for @homeNextAssembly.
  ///
  /// In en, this message translates to:
  /// **'Next assembly'**
  String get homeNextAssembly;

  /// No description provided for @homeNoAssembly.
  ///
  /// In en, this message translates to:
  /// **'No assembly is scheduled.'**
  String get homeNoAssembly;

  /// No description provided for @homeNoMoneyAccess.
  ///
  /// In en, this message translates to:
  /// **'Balances are not shown to you. Ask the unit owner for access.'**
  String get homeNoMoneyAccess;

  /// No description provided for @homeOpenTickets.
  ///
  /// In en, this message translates to:
  /// **'Open tickets'**
  String get homeOpenTickets;

  /// No description provided for @homeParcels.
  ///
  /// In en, this message translates to:
  /// **'Parcels waiting'**
  String get homeParcels;

  /// No description provided for @homeSectionCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get homeSectionCommunity;

  /// No description provided for @homeSectionNews.
  ///
  /// In en, this message translates to:
  /// **'News and requests'**
  String get homeSectionNews;

  /// No description provided for @homeUnreadAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Unread announcements'**
  String get homeUnreadAnnouncements;

  /// No description provided for @homeVisitors.
  ///
  /// In en, this message translates to:
  /// **'Visitors'**
  String get homeVisitors;

  /// No description provided for @householdNoMoney.
  ///
  /// In en, this message translates to:
  /// **'Household, no money access'**
  String get householdNoMoney;

  /// No description provided for @householdSeesMoney.
  ///
  /// In en, this message translates to:
  /// **'Household, sees money'**
  String get householdSeesMoney;

  /// No description provided for @includesLateFee.
  ///
  /// In en, this message translates to:
  /// **'includes late fee'**
  String get includesLateFee;

  /// No description provided for @languageDevice.
  ///
  /// In en, this message translates to:
  /// **'Same as the device'**
  String get languageDevice;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @lookTitle.
  ///
  /// In en, this message translates to:
  /// **'Look'**
  String get lookTitle;

  /// No description provided for @lockFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not confirm it is you.'**
  String get lockFailed;

  /// No description provided for @lockReason.
  ///
  /// In en, this message translates to:
  /// **'Unlock OpenBekci'**
  String get lockReason;

  /// No description provided for @lockUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This device has no screen lock or biometrics set up.'**
  String get lockUnavailable;

  /// No description provided for @lockUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get lockUnlock;

  /// No description provided for @lockedTitle.
  ///
  /// In en, this message translates to:
  /// **'OpenBekci is locked'**
  String get lockedTitle;

  /// No description provided for @methodBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank transfer'**
  String get methodBankTransfer;

  /// No description provided for @methodCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get methodCard;

  /// No description provided for @methodCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get methodCash;

  /// No description provided for @moneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get moneyTitle;

  /// No description provided for @navMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get navMoney;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @navNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get navNotifications;

  /// No description provided for @navTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get navTickets;

  /// No description provided for @nextDue.
  ///
  /// In en, this message translates to:
  /// **'Next due:'**
  String get nextDue;

  /// No description provided for @nextDueNone.
  ///
  /// In en, this message translates to:
  /// **'Nothing due'**
  String get nextDueNone;

  /// No description provided for @notBookedYet.
  ///
  /// In en, this message translates to:
  /// **'Not booked yet'**
  String get notBookedYet;

  /// No description provided for @notifAnnouncementPublished.
  ///
  /// In en, this message translates to:
  /// **'New announcement'**
  String get notifAnnouncementPublished;

  /// No description provided for @notifBookingCancelled.
  ///
  /// In en, this message translates to:
  /// **'Booking cancelled'**
  String get notifBookingCancelled;

  /// No description provided for @notifBookingConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Booking confirmed'**
  String get notifBookingConfirmed;

  /// No description provided for @notifChargeDueSoon.
  ///
  /// In en, this message translates to:
  /// **'Charge due soon'**
  String get notifChargeDueSoon;

  /// No description provided for @notifChargeOverdue.
  ///
  /// In en, this message translates to:
  /// **'Charge overdue'**
  String get notifChargeOverdue;

  /// No description provided for @notifClaimDecided.
  ///
  /// In en, this message translates to:
  /// **'Unit claim decided'**
  String get notifClaimDecided;

  /// No description provided for @notifClaimRequested.
  ///
  /// In en, this message translates to:
  /// **'Unit claim requested'**
  String get notifClaimRequested;

  /// No description provided for @notifDeliveryReceived.
  ///
  /// In en, this message translates to:
  /// **'Parcel received'**
  String get notifDeliveryReceived;

  /// No description provided for @notifDeliveryWaiting.
  ///
  /// In en, this message translates to:
  /// **'Parcel waiting'**
  String get notifDeliveryWaiting;

  /// No description provided for @notifDunningReminder.
  ///
  /// In en, this message translates to:
  /// **'Payment reminder'**
  String get notifDunningReminder;

  /// No description provided for @notifMeetingAssemblyDue.
  ///
  /// In en, this message translates to:
  /// **'Assembly due'**
  String get notifMeetingAssemblyDue;

  /// No description provided for @notifMeetingCalled.
  ///
  /// In en, this message translates to:
  /// **'Meeting called'**
  String get notifMeetingCalled;

  /// No description provided for @notifMeetingDecisions.
  ///
  /// In en, this message translates to:
  /// **'Meeting decisions'**
  String get notifMeetingDecisions;

  /// No description provided for @notifPaymentConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Payment confirmed'**
  String get notifPaymentConfirmed;

  /// No description provided for @notifPaymentDeclared.
  ///
  /// In en, this message translates to:
  /// **'Payment declared'**
  String get notifPaymentDeclared;

  /// No description provided for @notifPaymentReceipt.
  ///
  /// In en, this message translates to:
  /// **'Payment receipt'**
  String get notifPaymentReceipt;

  /// No description provided for @notifPaymentRejected.
  ///
  /// In en, this message translates to:
  /// **'Payment not confirmed'**
  String get notifPaymentRejected;

  /// No description provided for @notifStatementSent.
  ///
  /// In en, this message translates to:
  /// **'Statement sent'**
  String get notifStatementSent;

  /// No description provided for @notifTermExpiring.
  ///
  /// In en, this message translates to:
  /// **'Term expiring'**
  String get notifTermExpiring;

  /// No description provided for @notifTicketCommented.
  ///
  /// In en, this message translates to:
  /// **'New comment on a ticket'**
  String get notifTicketCommented;

  /// No description provided for @notifTicketUpdated.
  ///
  /// In en, this message translates to:
  /// **'Ticket updated'**
  String get notifTicketUpdated;

  /// No description provided for @notifVisitorApproval.
  ///
  /// In en, this message translates to:
  /// **'Visitor waiting for approval'**
  String get notifVisitorApproval;

  /// No description provided for @notifVisitorArrived.
  ///
  /// In en, this message translates to:
  /// **'Visitor arrived'**
  String get notifVisitorArrived;

  /// No description provided for @notifVisitorQrRotated.
  ///
  /// In en, this message translates to:
  /// **'Visitor code renewed'**
  String get notifVisitorQrRotated;

  /// No description provided for @notificationsCannotMute.
  ///
  /// In en, this message translates to:
  /// **'Always on'**
  String get notificationsCannotMute;

  /// No description provided for @notificationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notifications.'**
  String get notificationsEmpty;

  /// No description provided for @notificationsMarkAll.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get notificationsMarkAll;

  /// No description provided for @notificationsMutesBody.
  ///
  /// In en, this message translates to:
  /// **'Choose which notifications you get. Sign-in codes and invitations cannot be turned off.'**
  String get notificationsMutesBody;

  /// No description provided for @notificationsSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get notificationsSettings;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @openingBalance.
  ///
  /// In en, this message translates to:
  /// **'Opening balance'**
  String get openingBalance;

  /// No description provided for @payByCard.
  ///
  /// In en, this message translates to:
  /// **'Pay by card'**
  String get payByCard;

  /// No description provided for @payByTransfer.
  ///
  /// In en, this message translates to:
  /// **'Pay by transfer'**
  String get payByTransfer;

  /// No description provided for @payTitle.
  ///
  /// In en, this message translates to:
  /// **'Pay by bank transfer'**
  String get payTitle;

  /// No description provided for @paymentConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get paymentConfirmed;

  /// No description provided for @paymentDeclaredWaiting.
  ///
  /// In en, this message translates to:
  /// **'Declared, awaiting confirmation'**
  String get paymentDeclaredWaiting;

  /// No description provided for @paymentHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get paymentHistoryTitle;

  /// No description provided for @paymentRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get paymentRefunded;

  /// No description provided for @paymentVoided.
  ///
  /// In en, this message translates to:
  /// **'Voided'**
  String get paymentVoided;

  /// No description provided for @paymentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No payments yet.'**
  String get paymentsEmpty;

  /// No description provided for @periodAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get periodAll;

  /// No description provided for @periodLast3Months.
  ///
  /// In en, this message translates to:
  /// **'Last 3 months'**
  String get periodLast3Months;

  /// No description provided for @periodLastYear.
  ///
  /// In en, this message translates to:
  /// **'Last year'**
  String get periodLastYear;

  /// No description provided for @periodThisYear.
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get periodThisYear;

  /// No description provided for @profileContactsNote.
  ///
  /// In en, this message translates to:
  /// **'Your phone and email are your sign-in details; ask the manager to change them.'**
  String get profileContactsNote;

  /// No description provided for @profileEditMe.
  ///
  /// In en, this message translates to:
  /// **'My details'**
  String get profileEditMe;

  /// No description provided for @profileEditMeBody.
  ///
  /// In en, this message translates to:
  /// **'Name, gate contact phone and language'**
  String get profileEditMeBody;

  /// No description provided for @receiptNo.
  ///
  /// In en, this message translates to:
  /// **'Receipt {no}'**
  String receiptNo(String no);

  /// No description provided for @runningBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get runningBalance;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @sessionMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile app'**
  String get sessionMobile;

  /// No description provided for @sessionRevoke.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get sessionRevoke;

  /// No description provided for @sessionRevokeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign this device out of your account?'**
  String get sessionRevokeConfirm;

  /// No description provided for @sessionThisDevice.
  ///
  /// In en, this message translates to:
  /// **'This device'**
  String get sessionThisDevice;

  /// No description provided for @sessionWeb.
  ///
  /// In en, this message translates to:
  /// **'Web browser'**
  String get sessionWeb;

  /// No description provided for @sessionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Signed-in devices'**
  String get sessionsTitle;

  /// No description provided for @shareReceipt.
  ///
  /// In en, this message translates to:
  /// **'Share receipt'**
  String get shareReceipt;

  /// No description provided for @sideCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Unit {door}'**
  String sideCardTitle(String door);

  /// No description provided for @sideChip.
  ///
  /// In en, this message translates to:
  /// **'{unit} · {side}'**
  String sideChip(String unit, String side);

  /// No description provided for @sideOwner.
  ///
  /// In en, this message translates to:
  /// **'Owner side'**
  String get sideOwner;

  /// No description provided for @sideTenant.
  ///
  /// In en, this message translates to:
  /// **'Tenant side'**
  String get sideTenant;

  /// No description provided for @statementLines.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get statementLines;

  /// No description provided for @statementNoLines.
  ///
  /// In en, this message translates to:
  /// **'No entries in this period.'**
  String get statementNoLines;

  /// No description provided for @statementPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get statementPdf;

  /// No description provided for @stmtKindAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Adjustment'**
  String get stmtKindAdjustment;

  /// No description provided for @stmtKindCharge.
  ///
  /// In en, this message translates to:
  /// **'Charge'**
  String get stmtKindCharge;

  /// No description provided for @stmtKindCredit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get stmtKindCredit;

  /// No description provided for @stmtKindLateFee.
  ///
  /// In en, this message translates to:
  /// **'Late fee'**
  String get stmtKindLateFee;

  /// No description provided for @stmtKindOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening balance'**
  String get stmtKindOpening;

  /// No description provided for @stmtKindPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get stmtKindPayment;

  /// No description provided for @stmtKindRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get stmtKindRefund;

  /// No description provided for @stmtKindWaiver.
  ///
  /// In en, this message translates to:
  /// **'Waiver'**
  String get stmtKindWaiver;

  /// No description provided for @stmtKindReversal.
  ///
  /// In en, this message translates to:
  /// **'Reversal'**
  String get stmtKindReversal;

  /// No description provided for @switchOrganization.
  ///
  /// In en, this message translates to:
  /// **'Switch organization'**
  String get switchOrganization;

  /// No description provided for @ticketCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get ticketCategory;

  /// No description provided for @ticketCommentHint.
  ///
  /// In en, this message translates to:
  /// **'Write a comment'**
  String get ticketCommentHint;

  /// No description provided for @ticketCommentSend.
  ///
  /// In en, this message translates to:
  /// **'Send comment'**
  String get ticketCommentSend;

  /// No description provided for @ticketComments.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 comment} other{{count} comments}}'**
  String ticketComments(int count);

  /// No description provided for @ticketCommon.
  ///
  /// In en, this message translates to:
  /// **'Common'**
  String get ticketCommon;

  /// No description provided for @ticketCommonHint.
  ///
  /// In en, this message translates to:
  /// **'Everyone in the site sees it and can add a +1.'**
  String get ticketCommonHint;

  /// No description provided for @ticketDescription.
  ///
  /// In en, this message translates to:
  /// **'Describe the problem'**
  String get ticketDescription;

  /// No description provided for @ticketDraftKept.
  ///
  /// In en, this message translates to:
  /// **'If sending fails, your text and photos are kept and the retry will not create a duplicate.'**
  String get ticketDraftKept;

  /// No description provided for @ticketMerged.
  ///
  /// In en, this message translates to:
  /// **'This ticket was merged into another one.'**
  String get ticketMerged;

  /// No description provided for @ticketNew.
  ///
  /// In en, this message translates to:
  /// **'New ticket'**
  String get ticketNew;

  /// No description provided for @ticketNoThread.
  ///
  /// In en, this message translates to:
  /// **'No updates yet.'**
  String get ticketNoThread;

  /// No description provided for @ticketNoUnit.
  ///
  /// In en, this message translates to:
  /// **'No unit'**
  String get ticketNoUnit;

  /// No description provided for @ticketPhotoCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get ticketPhotoCamera;

  /// No description provided for @ticketPhotoCount.
  ///
  /// In en, this message translates to:
  /// **'{count} of {max} photos'**
  String ticketPhotoCount(int count, int max);

  /// No description provided for @ticketPhotoGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get ticketPhotoGallery;

  /// No description provided for @ticketPhotoRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get ticketPhotoRemove;

  /// No description provided for @ticketPhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get ticketPhotos;

  /// No description provided for @ticketPlusOne.
  ///
  /// In en, this message translates to:
  /// **'+1 ({count})'**
  String ticketPlusOne(int count);

  /// No description provided for @ticketPrivate.
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get ticketPrivate;

  /// No description provided for @ticketPrivateHint.
  ///
  /// In en, this message translates to:
  /// **'Only you and the management see it.'**
  String get ticketPrivateHint;

  /// No description provided for @ticketStatusChanged.
  ///
  /// In en, this message translates to:
  /// **'Status: {from} to {to}'**
  String ticketStatusChanged(String from, String to);

  /// No description provided for @ticketStatusSet.
  ///
  /// In en, this message translates to:
  /// **'Status: {to}'**
  String ticketStatusSet(String to);

  /// No description provided for @ticketSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send ticket'**
  String get ticketSubmit;

  /// No description provided for @ticketThread.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get ticketThread;

  /// No description provided for @ticketTitle.
  ///
  /// In en, this message translates to:
  /// **'Ticket'**
  String get ticketTitle;

  /// No description provided for @ticketTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get ticketTitleLabel;

  /// No description provided for @ticketUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit {door}'**
  String ticketUnit(String door);

  /// No description provided for @ticketUnitOptional.
  ///
  /// In en, this message translates to:
  /// **'Unit (optional)'**
  String get ticketUnitOptional;

  /// No description provided for @ticketVisibility.
  ///
  /// In en, this message translates to:
  /// **'Who can see it'**
  String get ticketVisibility;

  /// No description provided for @ticketVoted.
  ///
  /// In en, this message translates to:
  /// **'+1 given ({count})'**
  String ticketVoted(int count);

  /// No description provided for @ticketVotes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No +1 yet} =1{1 +1} other{{count} +1}}'**
  String ticketVotes(int count);

  /// No description provided for @ticketsAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ticketsAll;

  /// No description provided for @ticketsClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get ticketsClosed;

  /// No description provided for @ticketsCommon.
  ///
  /// In en, this message translates to:
  /// **'Common'**
  String get ticketsCommon;

  /// No description provided for @ticketsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No tickets here.'**
  String get ticketsEmpty;

  /// No description provided for @ticketsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No tickets yet'**
  String get ticketsEmptyTitle;

  /// No description provided for @ticketsMine.
  ///
  /// In en, this message translates to:
  /// **'Mine'**
  String get ticketsMine;

  /// No description provided for @ticketsOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get ticketsOpen;

  /// No description provided for @ticketsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get ticketsTitle;

  /// No description provided for @totalDueToday.
  ///
  /// In en, this message translates to:
  /// **'Total due today'**
  String get totalDueToday;

  /// No description provided for @valueOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get valueOther;

  /// No description provided for @ticketNoCategories.
  ///
  /// In en, this message translates to:
  /// **'No ticket categories are set up for this site yet. Ask the manager.'**
  String get ticketNoCategories;

  /// No description provided for @bookingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get bookingsTitle;

  /// No description provided for @bookingsFacilities.
  ///
  /// In en, this message translates to:
  /// **'Facilities'**
  String get bookingsFacilities;

  /// No description provided for @bookingsMine.
  ///
  /// In en, this message translates to:
  /// **'My bookings'**
  String get bookingsMine;

  /// No description provided for @facilitiesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No facility can be booked here.'**
  String get facilitiesEmpty;

  /// No description provided for @bookingsEmpty.
  ///
  /// In en, this message translates to:
  /// **'You have no bookings.'**
  String get bookingsEmpty;

  /// No description provided for @facilityNotFound.
  ///
  /// In en, this message translates to:
  /// **'This facility is no longer available.'**
  String get facilityNotFound;

  /// No description provided for @bookingBook.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get bookingBook;

  /// No description provided for @bookingUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get bookingUnit;

  /// No description provided for @bookingPickDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get bookingPickDay;

  /// No description provided for @bookingNoDays.
  ///
  /// In en, this message translates to:
  /// **'No day can be booked.'**
  String get bookingNoDays;

  /// No description provided for @bookingDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get bookingDuration;

  /// No description provided for @bookingPickTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get bookingPickTime;

  /// No description provided for @bookingNoSlots.
  ///
  /// In en, this message translates to:
  /// **'No time fits the opening hours.'**
  String get bookingNoSlots;

  /// No description provided for @bookingSummary.
  ///
  /// In en, this message translates to:
  /// **'Your booking'**
  String get bookingSummary;

  /// No description provided for @bookingFee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get bookingFee;

  /// No description provided for @bookingNoFee.
  ///
  /// In en, this message translates to:
  /// **'Free of charge.'**
  String get bookingNoFee;

  /// No description provided for @bookingConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm booking'**
  String get bookingConfirm;

  /// No description provided for @bookingConfirmedDone.
  ///
  /// In en, this message translates to:
  /// **'Booked. Your booking is confirmed.'**
  String get bookingConfirmedDone;

  /// No description provided for @bookingNeedsConnection.
  ///
  /// In en, this message translates to:
  /// **'Booking needs a connection. It is confirmed at once if the slot is free.'**
  String get bookingNeedsConnection;

  /// No description provided for @bookingConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get bookingConfirmed;

  /// No description provided for @bookingCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get bookingCancelled;

  /// No description provided for @bookingRefunded.
  ///
  /// In en, this message translates to:
  /// **'Fee refunded'**
  String get bookingRefunded;

  /// No description provided for @actionCancelBooking.
  ///
  /// In en, this message translates to:
  /// **'Cancel booking'**
  String get actionCancelBooking;

  /// No description provided for @actionKeepBooking.
  ///
  /// In en, this message translates to:
  /// **'Keep booking'**
  String get actionKeepBooking;

  /// No description provided for @cancelBookingTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel this booking?'**
  String get cancelBookingTitle;

  /// No description provided for @bookingCancelledDone.
  ///
  /// In en, this message translates to:
  /// **'Booking cancelled.'**
  String get bookingCancelledDone;

  /// No description provided for @feeFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get feeFree;

  /// No description provided for @refundNoFee.
  ///
  /// In en, this message translates to:
  /// **'There is no fee, so nothing to refund.'**
  String get refundNoFee;

  /// No description provided for @refundGiven.
  ///
  /// In en, this message translates to:
  /// **'Cancelling now refunds the fee of {amount} to your account.'**
  String refundGiven(String amount);

  /// No description provided for @refundKept.
  ///
  /// In en, this message translates to:
  /// **'The fee of {amount} is refunded if you cancel before {until}; after that it is kept.'**
  String refundKept(String amount, String until);

  /// No description provided for @refundNever.
  ///
  /// In en, this message translates to:
  /// **'The fee of {amount} is not refunded on cancellation.'**
  String refundNever(String amount);

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{m} min'**
  String durationMinutes(int m);

  /// No description provided for @durationHours.
  ///
  /// In en, this message translates to:
  /// **'{h} h'**
  String durationHours(int h);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In en, this message translates to:
  /// **'{h} h {m} min'**
  String durationHoursMinutes(int h, int m);

  /// No description provided for @ruleHours.
  ///
  /// In en, this message translates to:
  /// **'Open {days}, {start} to {end}'**
  String ruleHours(String days, String start, String end);

  /// No description provided for @ruleMaxDuration.
  ///
  /// In en, this message translates to:
  /// **'Up to {duration} per booking'**
  String ruleMaxDuration(String duration);

  /// No description provided for @ruleLeadTime.
  ///
  /// In en, this message translates to:
  /// **'Book at least {duration} ahead'**
  String ruleLeadTime(String duration);

  /// No description provided for @ruleMaxDaysAhead.
  ///
  /// In en, this message translates to:
  /// **'Up to {n} days ahead'**
  String ruleMaxDaysAhead(int n);

  /// No description provided for @ruleQuotaWeek.
  ///
  /// In en, this message translates to:
  /// **'{n} per unit per week'**
  String ruleQuotaWeek(int n);

  /// No description provided for @ruleQuotaMonth.
  ///
  /// In en, this message translates to:
  /// **'{n} per unit per month'**
  String ruleQuotaMonth(int n);

  /// No description provided for @ruleQuotaPerUnit.
  ///
  /// In en, this message translates to:
  /// **'{n} per unit'**
  String ruleQuotaPerUnit(int n);

  /// No description provided for @bookingProblemClosed.
  ///
  /// In en, this message translates to:
  /// **'Outside the opening hours.'**
  String get bookingProblemClosed;

  /// No description provided for @bookingProblemTooLong.
  ///
  /// In en, this message translates to:
  /// **'Longer than allowed.'**
  String get bookingProblemTooLong;

  /// No description provided for @bookingProblemTooSoon.
  ///
  /// In en, this message translates to:
  /// **'Too soon: it needs more notice.'**
  String get bookingProblemTooSoon;

  /// No description provided for @bookingProblemTooFar.
  ///
  /// In en, this message translates to:
  /// **'Too far ahead.'**
  String get bookingProblemTooFar;

  /// No description provided for @bookingProblemTaken.
  ///
  /// In en, this message translates to:
  /// **'Already taken.'**
  String get bookingProblemTaken;

  /// No description provided for @bookingProblemQuota.
  ///
  /// In en, this message translates to:
  /// **'Your unit has used its quota for this period.'**
  String get bookingProblemQuota;

  /// No description provided for @bookingProblemNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Your household role cannot book this facility.'**
  String get bookingProblemNotAllowed;

  /// No description provided for @visitorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Visitors'**
  String get visitorsTitle;

  /// No description provided for @visitorsExpected.
  ///
  /// In en, this message translates to:
  /// **'Expected'**
  String get visitorsExpected;

  /// No description provided for @visitorsRecurring.
  ///
  /// In en, this message translates to:
  /// **'Recurring'**
  String get visitorsRecurring;

  /// No description provided for @visitorsHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get visitorsHistory;

  /// No description provided for @visitorsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No visitors expected. Pre-register a guest to get a QR code for the gate.'**
  String get visitorsEmpty;

  /// No description provided for @visitorsHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No past visitors.'**
  String get visitorsHistoryEmpty;

  /// No description provided for @visitorAdd.
  ///
  /// In en, this message translates to:
  /// **'Pre-register a visitor'**
  String get visitorAdd;

  /// No description provided for @visitorAddRecurring.
  ///
  /// In en, this message translates to:
  /// **'Add recurring visitor'**
  String get visitorAddRecurring;

  /// No description provided for @visitorName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get visitorName;

  /// No description provided for @visitorPlate.
  ///
  /// In en, this message translates to:
  /// **'Plate (optional)'**
  String get visitorPlate;

  /// No description provided for @visitorWindow.
  ///
  /// In en, this message translates to:
  /// **'When do they come?'**
  String get visitorWindow;

  /// No description provided for @visitorFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get visitorFrom;

  /// No description provided for @visitorUntil.
  ///
  /// In en, this message translates to:
  /// **'Until'**
  String get visitorUntil;

  /// No description provided for @visitorRegister.
  ///
  /// In en, this message translates to:
  /// **'Create QR code'**
  String get visitorRegister;

  /// No description provided for @visitorPass.
  ///
  /// In en, this message translates to:
  /// **'Visitor pass'**
  String get visitorPass;

  /// No description provided for @visitorNotFound.
  ///
  /// In en, this message translates to:
  /// **'This visitor pass was not found.'**
  String get visitorNotFound;

  /// No description provided for @visitorNoQr.
  ///
  /// In en, this message translates to:
  /// **'No QR code is available for this pass.'**
  String get visitorNoQr;

  /// No description provided for @visitorQrLabel.
  ///
  /// In en, this message translates to:
  /// **'QR code for the gate'**
  String get visitorQrLabel;

  /// No description provided for @visitorQrHint.
  ///
  /// In en, this message translates to:
  /// **'Send the QR code to your guest. The guard scans it at the gate; it is valid for the time window and 30 minutes either side.'**
  String get visitorQrHint;

  /// No description provided for @visitorShare.
  ///
  /// In en, this message translates to:
  /// **'Share QR code'**
  String get visitorShare;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'The share sheet could not be opened.'**
  String get shareFailed;

  /// No description provided for @visitorShareText.
  ///
  /// In en, this message translates to:
  /// **'Visitor pass for {name} at {site}: {range}. Show this QR code at the gate. Code: {code}'**
  String visitorShareText(String name, String range, String site, String code);

  /// No description provided for @visitorCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel this pass'**
  String get visitorCancel;

  /// No description provided for @visitorCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get visitorCancelled;

  /// No description provided for @visitorArrived.
  ///
  /// In en, this message translates to:
  /// **'Arrived'**
  String get visitorArrived;

  /// No description provided for @visitorWalkIn.
  ///
  /// In en, this message translates to:
  /// **'Walk-in'**
  String get visitorWalkIn;

  /// No description provided for @passUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Not valid yet'**
  String get passUpcoming;

  /// No description provided for @passValid.
  ///
  /// In en, this message translates to:
  /// **'Valid now'**
  String get passValid;

  /// No description provided for @passEnded.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get passEnded;

  /// No description provided for @visitorStatusPreApproved.
  ///
  /// In en, this message translates to:
  /// **'Expected'**
  String get visitorStatusPreApproved;

  /// No description provided for @visitorStatusRequested.
  ///
  /// In en, this message translates to:
  /// **'Waiting for your answer'**
  String get visitorStatusRequested;

  /// No description provided for @visitorStatusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get visitorStatusApproved;

  /// No description provided for @visitorStatusDenied.
  ///
  /// In en, this message translates to:
  /// **'Denied'**
  String get visitorStatusDenied;

  /// No description provided for @visitorStatusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get visitorStatusExpired;

  /// No description provided for @recurringEmpty.
  ///
  /// In en, this message translates to:
  /// **'No recurring visitors. Add a cleaner, a carer or a regular guest.'**
  String get recurringEmpty;

  /// No description provided for @recurringActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get recurringActive;

  /// No description provided for @recurringRevoked.
  ///
  /// In en, this message translates to:
  /// **'Revoked'**
  String get recurringRevoked;

  /// No description provided for @recurringExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get recurringExpired;

  /// No description provided for @recurringDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get recurringDays;

  /// No description provided for @recurringValidity.
  ///
  /// In en, this message translates to:
  /// **'Valid for'**
  String get recurringValidity;

  /// No description provided for @validityNoEnd.
  ///
  /// In en, this message translates to:
  /// **'No end date'**
  String get validityNoEnd;

  /// No description provided for @validityMonth1.
  ///
  /// In en, this message translates to:
  /// **'1 month'**
  String get validityMonth1;

  /// No description provided for @validityMonths3.
  ///
  /// In en, this message translates to:
  /// **'3 months'**
  String get validityMonths3;

  /// No description provided for @validityYear1.
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get validityYear1;

  /// No description provided for @recurringFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get recurringFrom;

  /// No description provided for @recurringTo.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get recurringTo;

  /// No description provided for @recurringQrHint.
  ///
  /// In en, this message translates to:
  /// **'This QR code stays valid on the chosen days and hours until you revoke it. Revoking takes effect at the gate at once.'**
  String get recurringQrHint;

  /// No description provided for @recurringShareText.
  ///
  /// In en, this message translates to:
  /// **'Standing pass for {name} at {site}: {when}. Show this QR code at the gate. Code: {code}'**
  String recurringShareText(String name, String when, String site, String code);

  /// No description provided for @recurringRevoke.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get recurringRevoke;

  /// No description provided for @recurringRevokeTitle.
  ///
  /// In en, this message translates to:
  /// **'Revoke this pass?'**
  String get recurringRevokeTitle;

  /// No description provided for @recurringRevokeBody.
  ///
  /// In en, this message translates to:
  /// **'{name} will no longer be let in with this QR code.'**
  String recurringRevokeBody(String name);

  /// No description provided for @visitorApprovalTitle.
  ///
  /// In en, this message translates to:
  /// **'Visitor at the gate'**
  String get visitorApprovalTitle;

  /// No description provided for @visitorWaitingAtGate.
  ///
  /// In en, this message translates to:
  /// **'{name} is waiting at the gate'**
  String visitorWaitingAtGate(String name);

  /// No description provided for @visitorRequestUnit.
  ///
  /// In en, this message translates to:
  /// **'For unit {door}'**
  String visitorRequestUnit(String door);

  /// No description provided for @visitorAnswer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get visitorAnswer;

  /// No description provided for @visitorApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get visitorApprove;

  /// No description provided for @visitorDeny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get visitorDeny;

  /// No description provided for @visitorExpiresIn.
  ///
  /// In en, this message translates to:
  /// **'Answer within {time}'**
  String visitorExpiresIn(String time);

  /// No description provided for @visitorRequestGone.
  ///
  /// In en, this message translates to:
  /// **'This request is no longer open.'**
  String get visitorRequestGone;

  /// No description provided for @visitorResultApproved.
  ///
  /// In en, this message translates to:
  /// **'You approved this visitor. The guard lets them in.'**
  String get visitorResultApproved;

  /// No description provided for @visitorResultDenied.
  ///
  /// In en, this message translates to:
  /// **'You denied this visitor.'**
  String get visitorResultDenied;

  /// No description provided for @visitorResultExpired.
  ///
  /// In en, this message translates to:
  /// **'The time to answer ran out.'**
  String get visitorResultExpired;

  /// No description provided for @visitorGateContactTitle.
  ///
  /// In en, this message translates to:
  /// **'The guard will call you'**
  String get visitorGateContactTitle;

  /// No description provided for @visitorGateContactSet.
  ///
  /// In en, this message translates to:
  /// **'The guard calls your gate contact number, {phone}.'**
  String visitorGateContactSet(String phone);

  /// No description provided for @visitorGateContactMissing.
  ///
  /// In en, this message translates to:
  /// **'You have not set a gate contact number, so the guard cannot call you. Add one in your profile.'**
  String get visitorGateContactMissing;

  /// No description provided for @visitorGateContactAdd.
  ///
  /// In en, this message translates to:
  /// **'Add gate contact number'**
  String get visitorGateContactAdd;

  /// No description provided for @parcelsTitle.
  ///
  /// In en, this message translates to:
  /// **'Parcels'**
  String get parcelsTitle;

  /// No description provided for @parcelsWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for you'**
  String get parcelsWaiting;

  /// No description provided for @parcelsRecent.
  ///
  /// In en, this message translates to:
  /// **'Recently collected'**
  String get parcelsRecent;

  /// No description provided for @parcelsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No parcels so far.'**
  String get parcelsEmpty;

  /// No description provided for @parcelsNoneWaiting.
  ///
  /// In en, this message translates to:
  /// **'No parcel is waiting.'**
  String get parcelsNoneWaiting;

  /// No description provided for @parcelNoDescription.
  ///
  /// In en, this message translates to:
  /// **'Parcel'**
  String get parcelNoDescription;

  /// No description provided for @parcelUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit {door}'**
  String parcelUnit(String door);

  /// No description provided for @parcelReceived.
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get parcelReceived;

  /// No description provided for @parcelCollected.
  ///
  /// In en, this message translates to:
  /// **'Collected'**
  String get parcelCollected;

  /// No description provided for @parcelCollectedBy.
  ///
  /// In en, this message translates to:
  /// **'by {name}'**
  String parcelCollectedBy(String name);

  /// No description provided for @assemblyTitle.
  ///
  /// In en, this message translates to:
  /// **'Assembly'**
  String get assemblyTitle;

  /// No description provided for @assemblyEmpty.
  ///
  /// In en, this message translates to:
  /// **'No assembly yet.'**
  String get assemblyEmpty;

  /// No description provided for @assemblyUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get assemblyUpcoming;

  /// No description provided for @assemblyPast.
  ///
  /// In en, this message translates to:
  /// **'Earlier assemblies'**
  String get assemblyPast;

  /// No description provided for @meetingKindGeneral.
  ///
  /// In en, this message translates to:
  /// **'General assembly'**
  String get meetingKindGeneral;

  /// No description provided for @meetingKindExtraordinary.
  ///
  /// In en, this message translates to:
  /// **'Extraordinary assembly'**
  String get meetingKindExtraordinary;

  /// No description provided for @meetingStatusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get meetingStatusDraft;

  /// No description provided for @meetingStatusCalled.
  ///
  /// In en, this message translates to:
  /// **'Called'**
  String get meetingStatusCalled;

  /// No description provided for @meetingStatusInSession.
  ///
  /// In en, this message translates to:
  /// **'In session'**
  String get meetingStatusInSession;

  /// No description provided for @meetingStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get meetingStatusClosed;

  /// No description provided for @meetingStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get meetingStatusCancelled;

  /// No description provided for @meetingWhen.
  ///
  /// In en, this message translates to:
  /// **'When'**
  String get meetingWhen;

  /// No description provided for @meetingSecondCall.
  ///
  /// In en, this message translates to:
  /// **'Second call'**
  String get meetingSecondCall;

  /// No description provided for @meetingWhere.
  ///
  /// In en, this message translates to:
  /// **'Where'**
  String get meetingWhere;

  /// No description provided for @meetingCallLetter.
  ///
  /// In en, this message translates to:
  /// **'Call letter (PDF)'**
  String get meetingCallLetter;

  /// No description provided for @meetingAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get meetingAgenda;

  /// No description provided for @meetingAgendaEmpty.
  ///
  /// In en, this message translates to:
  /// **'The agenda has not been published.'**
  String get meetingAgendaEmpty;

  /// No description provided for @agendaVoted.
  ///
  /// In en, this message translates to:
  /// **'Vote'**
  String get agendaVoted;

  /// No description provided for @pollsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pre-meeting polls'**
  String get pollsTitle;

  /// No description provided for @pollsNonBinding.
  ///
  /// In en, this message translates to:
  /// **'Your answer is not binding. One answer per unit.'**
  String get pollsNonBinding;

  /// No description provided for @pollsOwnersOnly.
  ///
  /// In en, this message translates to:
  /// **'Only owners answer polls.'**
  String get pollsOwnersOnly;

  /// No description provided for @pollOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get pollOpen;

  /// No description provided for @pollClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get pollClosed;

  /// No description provided for @pollNotOpen.
  ///
  /// In en, this message translates to:
  /// **'Not open yet'**
  String get pollNotOpen;

  /// No description provided for @pollClosesAt.
  ///
  /// In en, this message translates to:
  /// **'Closes'**
  String get pollClosesAt;

  /// No description provided for @pollYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get pollYes;

  /// No description provided for @pollNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get pollNo;

  /// No description provided for @pollAbstain.
  ///
  /// In en, this message translates to:
  /// **'Abstain'**
  String get pollAbstain;

  /// No description provided for @pollAnswered.
  ///
  /// In en, this message translates to:
  /// **'Answered'**
  String get pollAnswered;

  /// No description provided for @checkInTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance check-in'**
  String get checkInTitle;

  /// No description provided for @checkInOpen.
  ///
  /// In en, this message translates to:
  /// **'Show this QR code at the attendance desk.'**
  String get checkInOpen;

  /// No description provided for @checkInNotYet.
  ///
  /// In en, this message translates to:
  /// **'Check-in opens when the session starts. Keep this QR code ready.'**
  String get checkInNotYet;

  /// No description provided for @checkInDone.
  ///
  /// In en, this message translates to:
  /// **'Checked in'**
  String get checkInDone;

  /// No description provided for @checkInQrLabel.
  ///
  /// In en, this message translates to:
  /// **'Check-in QR code'**
  String get checkInQrLabel;

  /// No description provided for @minutesTitle.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutesTitle;

  /// No description provided for @minutesOpen.
  ///
  /// In en, this message translates to:
  /// **'Open the minutes (PDF)'**
  String get minutesOpen;

  /// No description provided for @minutesNone.
  ///
  /// In en, this message translates to:
  /// **'The minutes are not available yet.'**
  String get minutesNone;

  /// No description provided for @decisionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Decisions'**
  String get decisionsTitle;

  /// No description provided for @decisionsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No decisions to show.'**
  String get decisionsEmpty;

  /// No description provided for @decisionsResidentsOnly.
  ///
  /// In en, this message translates to:
  /// **'You see the decisions that concern residents.'**
  String get decisionsResidentsOnly;

  /// No description provided for @decisionConcernsResidents.
  ///
  /// In en, this message translates to:
  /// **'Concerns residents'**
  String get decisionConcernsResidents;

  /// No description provided for @decisionNumber.
  ///
  /// In en, this message translates to:
  /// **'Decision {year}/{no}'**
  String decisionNumber(int year, int no);

  /// No description provided for @outcomeAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get outcomeAccepted;

  /// No description provided for @outcomeRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get outcomeRejected;

  /// No description provided for @outcomeNoVote.
  ///
  /// In en, this message translates to:
  /// **'No vote'**
  String get outcomeNoVote;

  /// No description provided for @outcomeNoted.
  ///
  /// In en, this message translates to:
  /// **'Noted'**
  String get outcomeNoted;

  /// No description provided for @webOpen.
  ///
  /// In en, this message translates to:
  /// **'Open in web'**
  String get webOpen;

  /// No description provided for @webOpenBody.
  ///
  /// In en, this message translates to:
  /// **'Opens the website and signs you in.'**
  String get webOpenBody;

  /// No description provided for @webOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'The browser could not be opened.'**
  String get webOpenFailed;

  /// No description provided for @notifGeneric.
  ///
  /// In en, this message translates to:
  /// **'New notification'**
  String get notifGeneric;

  /// No description provided for @notifAgentSilent.
  ///
  /// In en, this message translates to:
  /// **'Gate agent silent'**
  String get notifAgentSilent;

  /// No description provided for @notifAgentClockSkew.
  ///
  /// In en, this message translates to:
  /// **'Gate agent clock skew'**
  String get notifAgentClockSkew;

  /// No description provided for @notifAgentStopped.
  ///
  /// In en, this message translates to:
  /// **'Gate agent stopped'**
  String get notifAgentStopped;

  /// No description provided for @notifWebhookFailing.
  ///
  /// In en, this message translates to:
  /// **'Webhook endpoint failing'**
  String get notifWebhookFailing;

  /// No description provided for @notifSignInCode.
  ///
  /// In en, this message translates to:
  /// **'Sign-in code'**
  String get notifSignInCode;

  /// No description provided for @notifInvitation.
  ///
  /// In en, this message translates to:
  /// **'Invitation'**
  String get notifInvitation;

  /// No description provided for @notifPeriodicTitle.
  ///
  /// In en, this message translates to:
  /// **'New notifications'**
  String get notifPeriodicTitle;

  /// No description provided for @notifPeriodicBody.
  ///
  /// In en, this message translates to:
  /// **'You have {count} unread notifications.'**
  String notifPeriodicBody(int count);

  /// No description provided for @notificationsMayBeDelayed.
  ///
  /// In en, this message translates to:
  /// **'Notifications may be delayed'**
  String get notificationsMayBeDelayed;

  /// No description provided for @notificationsMayBeDelayedBody.
  ///
  /// In en, this message translates to:
  /// **'Push is not reaching this phone right now, so the app checks for news from time to time.'**
  String get notificationsMayBeDelayedBody;

  /// No description provided for @channelAnnouncements.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get channelAnnouncements;

  /// No description provided for @channelMoney.
  ///
  /// In en, this message translates to:
  /// **'Payments and statements'**
  String get channelMoney;

  /// No description provided for @channelTickets.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get channelTickets;

  /// No description provided for @channelCommunity.
  ///
  /// In en, this message translates to:
  /// **'Visitors, parcels and bookings'**
  String get channelCommunity;

  /// No description provided for @channelAssembly.
  ///
  /// In en, this message translates to:
  /// **'Assembly'**
  String get channelAssembly;

  /// No description provided for @channelAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get channelAccount;

  /// No description provided for @channelSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get channelSystem;

  /// No description provided for @checkoutChargesTitle.
  ///
  /// In en, this message translates to:
  /// **'Charges to pay'**
  String get checkoutChargesTitle;

  /// No description provided for @checkoutChargesHint.
  ///
  /// In en, this message translates to:
  /// **'Select charges, or leave all unselected to pay what is open, oldest first.'**
  String get checkoutChargesHint;

  /// No description provided for @checkoutAmount.
  ///
  /// In en, this message translates to:
  /// **'Other amount ({currency}, optional)'**
  String checkoutAmount(String currency);

  /// No description provided for @checkoutContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue to payment'**
  String get checkoutContinue;

  /// No description provided for @checkoutStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Card payment'**
  String get checkoutStatusTitle;

  /// No description provided for @checkoutPending.
  ///
  /// In en, this message translates to:
  /// **'Waiting for the payment'**
  String get checkoutPending;

  /// No description provided for @checkoutPendingBody.
  ///
  /// In en, this message translates to:
  /// **'We are checking with the payment provider. You can leave this screen; the receipt arrives as a notification.'**
  String get checkoutPendingBody;

  /// No description provided for @checkoutPaid.
  ///
  /// In en, this message translates to:
  /// **'Payment received'**
  String get checkoutPaid;

  /// No description provided for @checkoutFailed.
  ///
  /// In en, this message translates to:
  /// **'The payment did not go through'**
  String get checkoutFailed;

  /// No description provided for @checkoutExpired.
  ///
  /// In en, this message translates to:
  /// **'The payment page expired'**
  String get checkoutExpired;

  /// No description provided for @checkoutRefunded.
  ///
  /// In en, this message translates to:
  /// **'Payment refunded'**
  String get checkoutRefunded;

  /// No description provided for @checkoutMismatch.
  ///
  /// In en, this message translates to:
  /// **'The provider confirmed {confirmed} instead of {asked}. What was paid is booked; the rest stays open.'**
  String checkoutMismatch(String confirmed, String asked);

  /// No description provided for @checkoutReopen.
  ///
  /// In en, this message translates to:
  /// **'Open payment page'**
  String get checkoutReopen;

  /// No description provided for @checkoutRefresh.
  ///
  /// In en, this message translates to:
  /// **'Check again'**
  String get checkoutRefresh;

  /// No description provided for @myCheckoutsTitle.
  ///
  /// In en, this message translates to:
  /// **'Card payments'**
  String get myCheckoutsTitle;

  /// No description provided for @myCheckoutsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No card payments yet.'**
  String get myCheckoutsEmpty;

  /// No description provided for @joinSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up with your phone number'**
  String get joinSignUp;
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
