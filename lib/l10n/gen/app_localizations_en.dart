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

  @override
  String get aboutLicenses => 'Open-source licenses';

  @override
  String get aboutTitle => 'About';

  @override
  String aboutVersion(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get accruedLateFeeToday => 'Late fee accrued to today';

  @override
  String actionCopyValue(String label) {
    return 'Copy $label';
  }

  @override
  String get actionSave => 'Save';

  @override
  String get announcementAttachments => 'Attachments';

  @override
  String get announcementPinned => 'Pinned';

  @override
  String get announcementTitle => 'Announcement';

  @override
  String get announcementUnread => 'Unread';

  @override
  String get announcementsEmpty => 'No announcements yet.';

  @override
  String get announcementsTitle => 'Announcements';

  @override
  String get appLockBody =>
      'Ask for your fingerprint, face or device PIN when you open the app.';

  @override
  String get appLockEnable => 'Lock the app';

  @override
  String get appLockTitle => 'App lock';

  @override
  String get attachmentPhoto => 'Photo';

  @override
  String get balanceToday => 'Balance today';

  @override
  String get bankDetailsMissing =>
      'The manager has not published bank details for this site yet.';

  @override
  String get bankDetailsTitle => 'Bank details';

  @override
  String get bankHolder => 'Account holder';

  @override
  String get bankIban => 'IBAN';

  @override
  String get bankName => 'Bank';

  @override
  String get bankReference => 'Reference to use';

  @override
  String get closingBalance => 'Closing balance';

  @override
  String get consentAccepted => 'Accepted';

  @override
  String get consentDeclined => 'Declined';

  @override
  String consentDirectory(String site) {
    return 'Listed in the directory of $site';
  }

  @override
  String get consentsBody =>
      'Consents you have given or declined. You can change them at any time.';

  @override
  String get consentsOtherNote =>
      'This server does not publish other consent texts yet.';

  @override
  String get consentsTitle => 'Consents';

  @override
  String get copiedToClipboard => 'Copied';

  @override
  String get creditLabel => 'Credit';

  @override
  String declareAmount(String currency) {
    return 'Amount ($currency)';
  }

  @override
  String get declareBody =>
      'Made the transfer? Tell the manager so they can match it. Nothing changes on your statement until they confirm.';

  @override
  String get declareDate => 'Date of the transfer';

  @override
  String get declareNeedsConnection =>
      'Needs a connection. If sending fails, try again: it will not be declared twice.';

  @override
  String get declareNote => 'Note (optional)';

  @override
  String get declareReference => 'Reference (optional)';

  @override
  String get declareSent => 'Declared, awaiting confirmation';

  @override
  String get declareSentBody =>
      'The manager will confirm it once the money arrives.';

  @override
  String get declareSubmit => 'I\'ve paid by transfer';

  @override
  String get declareTitle => 'I\'ve paid by transfer';

  @override
  String get declaredSection => 'Declared, awaiting confirmation';

  @override
  String get directoryBody =>
      'Neighbours see your name in the site directory only if you opt in.';

  @override
  String get directoryListMe => 'List me in the directory';

  @override
  String get directoryShowPhone => 'Show my phone number';

  @override
  String get directoryTitle => 'Directory';

  @override
  String get documentGenerated => 'Generated';

  @override
  String get documentOpening => 'Opening…';

  @override
  String get documentShare => 'Share';

  @override
  String get documentsEmpty => 'No documents here.';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get folderSite => 'Site folder';

  @override
  String get folderUnit => 'Your unit\'s folder';

  @override
  String get formerPeriodNote => 'You see your own period of residence only.';

  @override
  String get gatePhoneHelp =>
      'The gate guard calls this number if you do not answer a visitor request in the app.';

  @override
  String get gatePhoneLabel => 'Gate contact phone';

  @override
  String get homeAssemblyUntitled => 'General assembly';

  @override
  String get homeBookings => 'Bookings';

  @override
  String get homeComingSoon => 'Coming soon';

  @override
  String get homeNextAssembly => 'Next assembly';

  @override
  String get homeNoAssembly => 'No assembly is scheduled.';

  @override
  String get homeNoMoneyAccess =>
      'Balances are not shown to you. Ask the unit owner for access.';

  @override
  String get homeOpenTickets => 'Open tickets';

  @override
  String get homeParcels => 'Parcels waiting';

  @override
  String get homeSectionCommunity => 'Community';

  @override
  String get homeSectionNews => 'News and requests';

  @override
  String get homeUnreadAnnouncements => 'Unread announcements';

  @override
  String get homeVisitors => 'Visitors';

  @override
  String get householdNoMoney => 'Household, no money access';

  @override
  String get householdSeesMoney => 'Household, sees money';

  @override
  String get includesLateFee => 'includes late fee';

  @override
  String get languageDevice => 'Same as the device';

  @override
  String get languageTitle => 'Language';

  @override
  String get lockFailed => 'Could not confirm it is you.';

  @override
  String get lockReason => 'Unlock OpenBekci';

  @override
  String get lockUnavailable =>
      'This device has no screen lock or biometrics set up.';

  @override
  String get lockUnlock => 'Unlock';

  @override
  String get lockedTitle => 'OpenBekci is locked';

  @override
  String get methodBankTransfer => 'Bank transfer';

  @override
  String get methodCard => 'Card';

  @override
  String get methodCash => 'Cash';

  @override
  String get moneyTitle => 'Money';

  @override
  String get navMoney => 'Money';

  @override
  String get navMore => 'More';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navTickets => 'Tickets';

  @override
  String get nextDue => 'Next due:';

  @override
  String get nextDueNone => 'Nothing due';

  @override
  String get notBookedYet => 'Not booked yet';

  @override
  String get notifAnnouncementPublished => 'New announcement';

  @override
  String get notifBookingCancelled => 'Booking cancelled';

  @override
  String get notifBookingConfirmed => 'Booking confirmed';

  @override
  String get notifChargeDueSoon => 'Charge due soon';

  @override
  String get notifChargeOverdue => 'Charge overdue';

  @override
  String get notifClaimDecided => 'Unit claim decided';

  @override
  String get notifClaimRequested => 'Unit claim requested';

  @override
  String get notifDeliveryReceived => 'Parcel received';

  @override
  String get notifDeliveryWaiting => 'Parcel waiting';

  @override
  String get notifDunningReminder => 'Payment reminder';

  @override
  String get notifMeetingAssemblyDue => 'Assembly due';

  @override
  String get notifMeetingCalled => 'Meeting called';

  @override
  String get notifMeetingDecisions => 'Meeting decisions';

  @override
  String get notifPaymentConfirmed => 'Payment confirmed';

  @override
  String get notifPaymentDeclared => 'Payment declared';

  @override
  String get notifPaymentReceipt => 'Payment receipt';

  @override
  String get notifPaymentRejected => 'Payment not confirmed';

  @override
  String get notifStatementSent => 'Statement sent';

  @override
  String get notifTermExpiring => 'Term expiring';

  @override
  String get notifTicketCommented => 'New comment on a ticket';

  @override
  String get notifTicketUpdated => 'Ticket updated';

  @override
  String get notifVisitorApproval => 'Visitor waiting for approval';

  @override
  String get notifVisitorArrived => 'Visitor arrived';

  @override
  String get notifVisitorQrRotated => 'Visitor code renewed';

  @override
  String get notificationsCannotMute => 'Always on';

  @override
  String get notificationsEmpty => 'No notifications.';

  @override
  String get notificationsMarkAll => 'Mark all as read';

  @override
  String get notificationsMutesBody =>
      'Choose which notifications you get. Sign-in codes and invitations cannot be turned off.';

  @override
  String get notificationsSettings => 'Notification settings';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get openingBalance => 'Opening balance';

  @override
  String get payByCard => 'Pay by card';

  @override
  String get payByTransfer => 'Pay by transfer';

  @override
  String get payTitle => 'Pay by bank transfer';

  @override
  String get paymentConfirmed => 'Confirmed';

  @override
  String get paymentDeclaredWaiting => 'Declared, awaiting confirmation';

  @override
  String get paymentHistoryTitle => 'Payments';

  @override
  String get paymentRefunded => 'Refunded';

  @override
  String get paymentVoided => 'Voided';

  @override
  String get paymentsEmpty => 'No payments yet.';

  @override
  String get periodAll => 'All';

  @override
  String get periodLast3Months => 'Last 3 months';

  @override
  String get periodLastYear => 'Last year';

  @override
  String get periodThisYear => 'This year';

  @override
  String get profileContactsNote =>
      'Your phone and email are your sign-in details; ask the manager to change them.';

  @override
  String get profileEditMe => 'My details';

  @override
  String get profileEditMeBody => 'Name, gate contact phone and language';

  @override
  String receiptNo(String no) {
    return 'Receipt $no';
  }

  @override
  String get runningBalance => 'Balance';

  @override
  String get saved => 'Saved';

  @override
  String get sessionMobile => 'Mobile app';

  @override
  String get sessionRevoke => 'Sign out';

  @override
  String get sessionRevokeConfirm => 'Sign this device out of your account?';

  @override
  String get sessionThisDevice => 'This device';

  @override
  String get sessionWeb => 'Web browser';

  @override
  String get sessionsTitle => 'Signed-in devices';

  @override
  String get shareReceipt => 'Share receipt';

  @override
  String sideCardTitle(String door) {
    return 'Unit $door';
  }

  @override
  String sideChip(String unit, String side) {
    return '$unit · $side';
  }

  @override
  String get sideOwner => 'Owner side';

  @override
  String get sideTenant => 'Tenant side';

  @override
  String get statementLines => 'Statement';

  @override
  String get statementNoLines => 'No entries in this period.';

  @override
  String get statementPdf => 'PDF';

  @override
  String get stmtKindAdjustment => 'Adjustment';

  @override
  String get stmtKindCharge => 'Charge';

  @override
  String get stmtKindCredit => 'Credit';

  @override
  String get stmtKindLateFee => 'Late fee';

  @override
  String get stmtKindOpening => 'Opening balance';

  @override
  String get stmtKindPayment => 'Payment';

  @override
  String get stmtKindRefund => 'Refund';

  @override
  String get stmtKindWaiver => 'Waiver';

  @override
  String get stmtKindReversal => 'Reversal';

  @override
  String get switchOrganization => 'Switch organization';

  @override
  String get ticketCategory => 'Category';

  @override
  String get ticketCommentHint => 'Write a comment';

  @override
  String get ticketCommentSend => 'Send comment';

  @override
  String ticketComments(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comments',
      one: '1 comment',
    );
    return '$_temp0';
  }

  @override
  String get ticketCommon => 'Common';

  @override
  String get ticketCommonHint =>
      'Everyone in the site sees it and can add a +1.';

  @override
  String get ticketDescription => 'Describe the problem';

  @override
  String get ticketDraftKept =>
      'If sending fails, your text and photos are kept and the retry will not create a duplicate.';

  @override
  String get ticketMerged => 'This ticket was merged into another one.';

  @override
  String get ticketNew => 'New ticket';

  @override
  String get ticketNoThread => 'No updates yet.';

  @override
  String get ticketNoUnit => 'No unit';

  @override
  String get ticketPhotoCamera => 'Camera';

  @override
  String ticketPhotoCount(int count, int max) {
    return '$count of $max photos';
  }

  @override
  String get ticketPhotoGallery => 'Gallery';

  @override
  String get ticketPhotoRemove => 'Remove photo';

  @override
  String get ticketPhotos => 'Photos';

  @override
  String ticketPlusOne(int count) {
    return '+1 ($count)';
  }

  @override
  String get ticketPrivate => 'Private';

  @override
  String get ticketPrivateHint => 'Only you and the management see it.';

  @override
  String ticketStatusChanged(String from, String to) {
    return 'Status: $from to $to';
  }

  @override
  String ticketStatusSet(String to) {
    return 'Status: $to';
  }

  @override
  String get ticketSubmit => 'Send ticket';

  @override
  String get ticketThread => 'Updates';

  @override
  String get ticketTitle => 'Ticket';

  @override
  String get ticketTitleLabel => 'Title';

  @override
  String ticketUnit(String door) {
    return 'Unit $door';
  }

  @override
  String get ticketUnitOptional => 'Unit (optional)';

  @override
  String get ticketVisibility => 'Who can see it';

  @override
  String ticketVoted(int count) {
    return '+1 given ($count)';
  }

  @override
  String ticketVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count +1',
      one: '1 +1',
      zero: 'No +1 yet',
    );
    return '$_temp0';
  }

  @override
  String get ticketsAll => 'All';

  @override
  String get ticketsClosed => 'Closed';

  @override
  String get ticketsCommon => 'Common';

  @override
  String get ticketsEmpty => 'No tickets here.';

  @override
  String get ticketsEmptyTitle => 'No tickets yet';

  @override
  String get ticketsMine => 'Mine';

  @override
  String get ticketsOpen => 'Open';

  @override
  String get ticketsTitle => 'Tickets';

  @override
  String get totalDueToday => 'Total due today';

  @override
  String get valueOther => 'Other';

  @override
  String get ticketNoCategories =>
      'No ticket categories are set up for this site yet. Ask the manager.';

  @override
  String get bookingsTitle => 'Bookings';

  @override
  String get bookingsFacilities => 'Facilities';

  @override
  String get bookingsMine => 'My bookings';

  @override
  String get facilitiesEmpty => 'No facility can be booked here.';

  @override
  String get bookingsEmpty => 'You have no bookings.';

  @override
  String get facilityNotFound => 'This facility is no longer available.';

  @override
  String get bookingBook => 'Book';

  @override
  String get bookingUnit => 'Unit';

  @override
  String get bookingPickDay => 'Day';

  @override
  String get bookingNoDays => 'No day can be booked.';

  @override
  String get bookingDuration => 'Duration';

  @override
  String get bookingPickTime => 'Start time';

  @override
  String get bookingNoSlots => 'No time fits the opening hours.';

  @override
  String get bookingSummary => 'Your booking';

  @override
  String get bookingFee => 'Fee';

  @override
  String get bookingNoFee => 'Free of charge.';

  @override
  String get bookingConfirm => 'Confirm booking';

  @override
  String get bookingConfirmedDone => 'Booked. Your booking is confirmed.';

  @override
  String get bookingNeedsConnection =>
      'Booking needs a connection. It is confirmed at once if the slot is free.';

  @override
  String get bookingConfirmed => 'Confirmed';

  @override
  String get bookingCancelled => 'Cancelled';

  @override
  String get bookingRefunded => 'Fee refunded';

  @override
  String get actionCancelBooking => 'Cancel booking';

  @override
  String get actionKeepBooking => 'Keep booking';

  @override
  String get cancelBookingTitle => 'Cancel this booking?';

  @override
  String get bookingCancelledDone => 'Booking cancelled.';

  @override
  String get feeFree => 'Free';

  @override
  String get refundNoFee => 'There is no fee, so nothing to refund.';

  @override
  String refundGiven(String amount) {
    return 'Cancelling now refunds the fee of $amount to your account.';
  }

  @override
  String refundKept(String amount, String until) {
    return 'The fee of $amount is refunded if you cancel before $until; after that it is kept.';
  }

  @override
  String refundNever(String amount) {
    return 'The fee of $amount is not refunded on cancellation.';
  }

  @override
  String durationMinutes(int m) {
    return '$m min';
  }

  @override
  String durationHours(int h) {
    return '$h h';
  }

  @override
  String durationHoursMinutes(int h, int m) {
    return '$h h $m min';
  }

  @override
  String ruleHours(String days, String start, String end) {
    return 'Open $days, $start to $end';
  }

  @override
  String ruleMaxDuration(String duration) {
    return 'Up to $duration per booking';
  }

  @override
  String ruleLeadTime(String duration) {
    return 'Book at least $duration ahead';
  }

  @override
  String ruleMaxDaysAhead(int n) {
    return 'Up to $n days ahead';
  }

  @override
  String ruleQuotaWeek(int n) {
    return '$n per unit per week';
  }

  @override
  String ruleQuotaMonth(int n) {
    return '$n per unit per month';
  }

  @override
  String ruleQuotaPerUnit(int n) {
    return '$n per unit';
  }

  @override
  String get bookingProblemClosed => 'Outside the opening hours.';

  @override
  String get bookingProblemTooLong => 'Longer than allowed.';

  @override
  String get bookingProblemTooSoon => 'Too soon: it needs more notice.';

  @override
  String get bookingProblemTooFar => 'Too far ahead.';

  @override
  String get bookingProblemTaken => 'Already taken.';

  @override
  String get bookingProblemQuota =>
      'Your unit has used its quota for this period.';

  @override
  String get bookingProblemNotAllowed =>
      'Your household role cannot book this facility.';

  @override
  String get visitorsTitle => 'Visitors';

  @override
  String get visitorsExpected => 'Expected';

  @override
  String get visitorsRecurring => 'Recurring';

  @override
  String get visitorsHistory => 'History';

  @override
  String get visitorsEmpty =>
      'No visitors expected. Pre-register a guest to get a QR code for the gate.';

  @override
  String get visitorsHistoryEmpty => 'No past visitors.';

  @override
  String get visitorAdd => 'Pre-register a visitor';

  @override
  String get visitorAddRecurring => 'Add recurring visitor';

  @override
  String get visitorName => 'Name';

  @override
  String get visitorPlate => 'Plate (optional)';

  @override
  String get visitorWindow => 'When do they come?';

  @override
  String get visitorFrom => 'From';

  @override
  String get visitorUntil => 'Until';

  @override
  String get visitorRegister => 'Create QR code';

  @override
  String get visitorPass => 'Visitor pass';

  @override
  String get visitorNotFound => 'This visitor pass was not found.';

  @override
  String get visitorNoQr => 'No QR code is available for this pass.';

  @override
  String get visitorQrLabel => 'QR code for the gate';

  @override
  String get visitorQrHint =>
      'Send the QR code to your guest. The guard scans it at the gate; it is valid for the time window and 30 minutes either side.';

  @override
  String get visitorShare => 'Share QR code';

  @override
  String get shareFailed => 'The share sheet could not be opened.';

  @override
  String visitorShareText(String name, String range, String site, String code) {
    return 'Visitor pass for $name at $site: $range. Show this QR code at the gate. Code: $code';
  }

  @override
  String get visitorCancel => 'Cancel this pass';

  @override
  String get visitorCancelled => 'Cancelled';

  @override
  String get visitorArrived => 'Arrived';

  @override
  String get visitorWalkIn => 'Walk-in';

  @override
  String get passUpcoming => 'Not valid yet';

  @override
  String get passValid => 'Valid now';

  @override
  String get passEnded => 'Expired';

  @override
  String get visitorStatusPreApproved => 'Expected';

  @override
  String get visitorStatusRequested => 'Waiting for your answer';

  @override
  String get visitorStatusApproved => 'Approved';

  @override
  String get visitorStatusDenied => 'Denied';

  @override
  String get visitorStatusExpired => 'Expired';

  @override
  String get recurringEmpty =>
      'No recurring visitors. Add a cleaner, a carer or a regular guest.';

  @override
  String get recurringActive => 'Active';

  @override
  String get recurringRevoked => 'Revoked';

  @override
  String get recurringExpired => 'Expired';

  @override
  String get recurringDays => 'Days';

  @override
  String get recurringValidity => 'Valid for';

  @override
  String get validityNoEnd => 'No end date';

  @override
  String get validityMonth1 => '1 month';

  @override
  String get validityMonths3 => '3 months';

  @override
  String get validityYear1 => '1 year';

  @override
  String get recurringFrom => 'From';

  @override
  String get recurringTo => 'to';

  @override
  String get recurringQrHint =>
      'This QR code stays valid on the chosen days and hours until you revoke it. Revoking takes effect at the gate at once.';

  @override
  String recurringShareText(
    String name,
    String when,
    String site,
    String code,
  ) {
    return 'Standing pass for $name at $site: $when. Show this QR code at the gate. Code: $code';
  }

  @override
  String get recurringRevoke => 'Revoke';

  @override
  String get recurringRevokeTitle => 'Revoke this pass?';

  @override
  String recurringRevokeBody(String name) {
    return '$name will no longer be let in with this QR code.';
  }

  @override
  String get visitorApprovalTitle => 'Visitor at the gate';

  @override
  String visitorWaitingAtGate(String name) {
    return '$name is waiting at the gate';
  }

  @override
  String visitorRequestUnit(String door) {
    return 'For unit $door';
  }

  @override
  String get visitorAnswer => 'Answer';

  @override
  String get visitorApprove => 'Approve';

  @override
  String get visitorDeny => 'Deny';

  @override
  String visitorExpiresIn(String time) {
    return 'Answer within $time';
  }

  @override
  String get visitorRequestGone => 'This request is no longer open.';

  @override
  String get visitorResultApproved =>
      'You approved this visitor. The guard lets them in.';

  @override
  String get visitorResultDenied => 'You denied this visitor.';

  @override
  String get visitorResultExpired => 'The time to answer ran out.';

  @override
  String get visitorGateContactTitle => 'The guard will call you';

  @override
  String visitorGateContactSet(String phone) {
    return 'The guard calls your gate contact number, $phone.';
  }

  @override
  String get visitorGateContactMissing =>
      'You have not set a gate contact number, so the guard cannot call you. Add one in your profile.';

  @override
  String get visitorGateContactAdd => 'Add gate contact number';

  @override
  String get parcelsTitle => 'Parcels';

  @override
  String get parcelsWaiting => 'Waiting for you';

  @override
  String get parcelsRecent => 'Recently collected';

  @override
  String get parcelsEmpty => 'No parcels so far.';

  @override
  String get parcelsNoneWaiting => 'No parcel is waiting.';

  @override
  String get parcelNoDescription => 'Parcel';

  @override
  String parcelUnit(String door) {
    return 'Unit $door';
  }

  @override
  String get parcelReceived => 'Received';

  @override
  String get parcelCollected => 'Collected';

  @override
  String parcelCollectedBy(String name) {
    return 'by $name';
  }

  @override
  String get assemblyTitle => 'Assembly';

  @override
  String get assemblyEmpty => 'No assembly yet.';

  @override
  String get assemblyUpcoming => 'Upcoming';

  @override
  String get assemblyPast => 'Earlier assemblies';

  @override
  String get meetingKindGeneral => 'General assembly';

  @override
  String get meetingKindExtraordinary => 'Extraordinary assembly';

  @override
  String get meetingStatusDraft => 'Draft';

  @override
  String get meetingStatusCalled => 'Called';

  @override
  String get meetingStatusInSession => 'In session';

  @override
  String get meetingStatusClosed => 'Closed';

  @override
  String get meetingStatusCancelled => 'Cancelled';

  @override
  String get meetingWhen => 'When';

  @override
  String get meetingSecondCall => 'Second call';

  @override
  String get meetingWhere => 'Where';

  @override
  String get meetingCallLetter => 'Call letter (PDF)';

  @override
  String get meetingAgenda => 'Agenda';

  @override
  String get meetingAgendaEmpty => 'The agenda has not been published.';

  @override
  String get agendaVoted => 'Vote';

  @override
  String get pollsTitle => 'Pre-meeting polls';

  @override
  String get pollsNonBinding =>
      'Your answer is not binding. One answer per unit.';

  @override
  String get pollsOwnersOnly => 'Only owners answer polls.';

  @override
  String get pollOpen => 'Open';

  @override
  String get pollClosed => 'Closed';

  @override
  String get pollNotOpen => 'Not open yet';

  @override
  String get pollClosesAt => 'Closes';

  @override
  String get pollYes => 'Yes';

  @override
  String get pollNo => 'No';

  @override
  String get pollAbstain => 'Abstain';

  @override
  String get pollAnswered => 'Answered';

  @override
  String get checkInTitle => 'Attendance check-in';

  @override
  String get checkInOpen => 'Show this QR code at the attendance desk.';

  @override
  String get checkInNotYet =>
      'Check-in opens when the session starts. Keep this QR code ready.';

  @override
  String get checkInDone => 'Checked in';

  @override
  String get checkInQrLabel => 'Check-in QR code';

  @override
  String get minutesTitle => 'Minutes';

  @override
  String get minutesOpen => 'Open the minutes (PDF)';

  @override
  String get minutesNone => 'The minutes are not available yet.';

  @override
  String get decisionsTitle => 'Decisions';

  @override
  String get decisionsEmpty => 'No decisions to show.';

  @override
  String get decisionsResidentsOnly =>
      'You see the decisions that concern residents.';

  @override
  String get decisionConcernsResidents => 'Concerns residents';

  @override
  String decisionNumber(int year, int no) {
    return 'Decision $year/$no';
  }

  @override
  String get outcomeAccepted => 'Accepted';

  @override
  String get outcomeRejected => 'Rejected';

  @override
  String get outcomeNoVote => 'No vote';

  @override
  String get outcomeNoted => 'Noted';

  @override
  String get webOpen => 'Open in web';

  @override
  String get webOpenBody => 'Opens the website and signs you in.';

  @override
  String get webOpenFailed => 'The browser could not be opened.';

  @override
  String get notifGeneric => 'New notification';

  @override
  String get notifAgentSilent => 'Gate agent silent';

  @override
  String get notifAgentClockSkew => 'Gate agent clock skew';

  @override
  String get notifAgentStopped => 'Gate agent stopped';

  @override
  String get notifWebhookFailing => 'Webhook endpoint failing';

  @override
  String get notifSignInCode => 'Sign-in code';

  @override
  String get notifInvitation => 'Invitation';

  @override
  String get notifPeriodicTitle => 'New notifications';

  @override
  String notifPeriodicBody(int count) {
    return 'You have $count unread notifications.';
  }

  @override
  String get notificationsMayBeDelayed => 'Notifications may be delayed';

  @override
  String get notificationsMayBeDelayedBody =>
      'Push is not reaching this phone right now, so the app checks for news from time to time.';

  @override
  String get channelAnnouncements => 'Announcements';

  @override
  String get channelMoney => 'Payments and statements';

  @override
  String get channelTickets => 'Tickets';

  @override
  String get channelCommunity => 'Visitors, parcels and bookings';

  @override
  String get channelAssembly => 'Assembly';

  @override
  String get channelAccount => 'Account';

  @override
  String get channelSystem => 'System';

  @override
  String get checkoutChargesTitle => 'Charges to pay';

  @override
  String get checkoutChargesHint =>
      'Select charges, or leave all unselected to pay what is open, oldest first.';

  @override
  String checkoutAmount(String currency) {
    return 'Other amount ($currency, optional)';
  }

  @override
  String get checkoutContinue => 'Continue to payment';

  @override
  String get checkoutStatusTitle => 'Card payment';

  @override
  String get checkoutPending => 'Waiting for the payment';

  @override
  String get checkoutPendingBody =>
      'We are checking with the payment provider. You can leave this screen; the receipt arrives as a notification.';

  @override
  String get checkoutPaid => 'Payment received';

  @override
  String get checkoutFailed => 'The payment did not go through';

  @override
  String get checkoutExpired => 'The payment page expired';

  @override
  String get checkoutRefunded => 'Payment refunded';

  @override
  String checkoutMismatch(String confirmed, String asked) {
    return 'The provider confirmed $confirmed instead of $asked. What was paid is booked; the rest stays open.';
  }

  @override
  String get checkoutReopen => 'Open payment page';

  @override
  String get checkoutRefresh => 'Check again';

  @override
  String get myCheckoutsTitle => 'Card payments';

  @override
  String get myCheckoutsEmpty => 'No card payments yet.';

  @override
  String get joinSignUp => 'Sign up with your phone number';
}
