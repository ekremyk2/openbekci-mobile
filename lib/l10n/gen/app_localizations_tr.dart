// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'OpenBekci';

  @override
  String get actionContinue => 'Devam';

  @override
  String get actionBack => 'Geri';

  @override
  String get actionCancel => 'Vazgeç';

  @override
  String get actionRetry => 'Tekrar dene';

  @override
  String get actionSignOut => 'Çıkış yap';

  @override
  String get actionCopy => 'Kopyala';

  @override
  String get stateEmptyTitle => 'Henüz bir şey yok';

  @override
  String get stateErrorTitle => 'Bir şeyler ters gitti';

  @override
  String get stateOfflineTitle => 'Çevrimdışısınız';

  @override
  String get stateOfflineBody =>
      'Kayıtlı bilgiler gösteriliyor. Bağlantı gelince yenilenir.';

  @override
  String stateUpdatedAt(String when) {
    return '$when güncellendi';
  }

  @override
  String get errorDetails => 'Ayrıntılar';

  @override
  String errorCodeLabel(String code) {
    return 'Kod: $code';
  }

  @override
  String get errorGeneric => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

  @override
  String get errorCode_validation_failed =>
      'Bazı bilgiler geçerli değil. Alanları kontrol edip tekrar deneyin.';

  @override
  String get errorCode_bad_request =>
      'İstek anlaşılamadı. Lütfen tekrar deneyin.';

  @override
  String get errorCode_unauthenticated =>
      'Oturumunuz sona erdi. Lütfen yeniden giriş yapın.';

  @override
  String get errorCode_not_found => 'Aradığınız bulunamadı.';

  @override
  String get errorCode_conflict =>
      'Bu işlem mevcut durumla çakışıyor. Yenileyip tekrar deneyin.';

  @override
  String get errorCode_version_conflict =>
      'Bu kayıt başkası tarafından değiştirildi. Yenileyip değişikliğinizi tekrar yapın.';

  @override
  String get errorCode_idempotency_mismatch =>
      'Bu istek daha önce farklı içerikle gönderildi.';

  @override
  String get errorCode_locked_period => 'Bu dönem kapatıldı ve değiştirilemez.';

  @override
  String get errorCode_insufficient_permission => 'Bunu yapmaya yetkiniz yok.';

  @override
  String get errorCode_reauth_required =>
      'Devam etmek için kimliğinizi doğrulayın.';

  @override
  String get errorCode_invalid_grant =>
      'Kod, şifre veya bağlantı hatalı ya da süresi dolmuş.';

  @override
  String get errorCode_rate_limited =>
      'Çok fazla deneme yapıldı. Biraz bekleyip tekrar deneyin.';

  @override
  String get errorCode_site_offboarded =>
      'Bu site artık bu sunucuda etkin değil.';

  @override
  String get errorCode_internal_error =>
      'Sunucuda bir sorun oluştu. Lütfen daha sonra tekrar deneyin.';

  @override
  String get errorCode_sms_unavailable =>
      'Bu sunucu şu anda kısa mesaj gönderemiyor.';

  @override
  String get errorCode_mail_unavailable =>
      'Bu sunucu şu anda e-posta gönderemiyor.';

  @override
  String get errorCode_payload_too_large =>
      'Veri gönderilemeyecek kadar büyük.';

  @override
  String get errorCode_timeout =>
      'Sunucu çok geç yanıt verdi. Lütfen tekrar deneyin.';

  @override
  String get errorCode_network =>
      'Sunucuya ulaşılamıyor. Bağlantınızı kontrol edin.';

  @override
  String get errorCode_insecure_server => 'Bu sunucu HTTPS kullanmalıdır.';

  @override
  String get errorCode_not_openbekci =>
      'Bu adres bir OpenBekci sunucusuna benzemiyor.';

  @override
  String get fieldErrorRequired => 'Bu alan zorunludur.';

  @override
  String get fieldErrorInvalid => 'Bu değer geçerli değil.';

  @override
  String get fieldErrorTooShort => 'Bu değer çok kısa.';

  @override
  String get fieldErrorTooLong => 'Bu değer çok uzun.';

  @override
  String get serverTitle => 'Sitenize bağlanın';

  @override
  String get serverBody =>
      'OpenBekci sunucunuzun adresini girin veya yöneticinizin verdiği QR kodunu okutun.';

  @override
  String get serverFieldLabel => 'Sunucu adresi';

  @override
  String get serverFieldHint => 'ornek.org';

  @override
  String get serverConnect => 'Bağlan';

  @override
  String get serverScanQr => 'QR kodu okut';

  @override
  String get serverChecking => 'Sunucu denetleniyor…';

  @override
  String get serverPendingInvite =>
      'Davetinizi açmak için sunucu adresini girin.';

  @override
  String get serverPendingJoin =>
      'Sitenize katılmak için sunucu adresini girin.';

  @override
  String get serverPendingMagic =>
      'Girişi tamamlamak için sunucu adresini girin.';

  @override
  String get scanTitle => 'QR kodu okut';

  @override
  String get scanHint => 'Kamerayı site veya davet QR koduna doğrultun.';

  @override
  String get scanNotRecognized => 'Bu QR kod bir OpenBekci bağlantısı değil.';

  @override
  String get scanPermissionDenied =>
      'Taramak için kamera erişimi gerekir. Bunun yerine adresi girebilirsiniz.';

  @override
  String get gateUpdateTitle => 'Uygulamayı güncelleyin';

  @override
  String gateUpdateBody(String min, String current) {
    return 'Bu sunucu $min veya daha yeni bir uygulama sürümü gerektiriyor (sizde $current).';
  }

  @override
  String get gateServerTitle => 'Sunucu desteklenmiyor';

  @override
  String gateServerBody(String version) {
    return 'Bu sunucu $version sürümünü çalıştırıyor ve bu uygulama onunla çalışamıyor. Yöneticinizden sunucuyu güncellemesini isteyin.';
  }

  @override
  String get gateChangeServer => 'Başka bir sunucu kullan';

  @override
  String get signInTitle => 'Giriş yap';

  @override
  String signInServerLine(String name) {
    return '$name sunucusuna giriş yapılıyor';
  }

  @override
  String get signInMethodSms => 'Kısa mesaj kodu';

  @override
  String get signInMethodSmsHint => 'Telefonunuza 6 haneli bir kod göndeririz.';

  @override
  String get signInMethodPassword => 'Şifre';

  @override
  String get signInMethodPasswordHint =>
      'E-posta veya telefon ve şifrenizi kullanın.';

  @override
  String get signInMethodMagic => 'E-posta bağlantısı';

  @override
  String get signInMethodMagicHint =>
      'Giriş yapan bir bağlantıyı e-postayla göndeririz.';

  @override
  String get signInMethodUnavailable => 'Bu uygulamada henüz kullanılamıyor';

  @override
  String get signInNoMethods =>
      'Bu sunucu, uygulamanın desteklediği bir giriş yöntemi sunmuyor.';

  @override
  String get smsPhoneLabel => 'Telefon numarası';

  @override
  String get smsPhoneHint => '+90 5xx xxx xx xx';

  @override
  String get smsSendCode => 'Kod gönder';

  @override
  String get smsCodeTitle => 'Kodu girin';

  @override
  String smsCodeSent(String phone) {
    return 'Bu numaranın hesabı varsa $phone numarasına bir kod gönderdik.';
  }

  @override
  String get smsCodeLabel => '6 haneli kod';

  @override
  String get smsVerify => 'Giriş yap';

  @override
  String get smsResend => 'Tekrar gönder';

  @override
  String smsResendIn(int seconds) {
    return '$seconds sn sonra tekrar gönder';
  }

  @override
  String get passwordIdentifierLabel => 'E-posta veya telefon';

  @override
  String get passwordLabel => 'Şifre';

  @override
  String get passwordSignIn => 'Giriş yap';

  @override
  String get passwordShow => 'Şifreyi göster';

  @override
  String get passwordHide => 'Şifreyi gizle';

  @override
  String get magicEmailLabel => 'E-posta adresi';

  @override
  String get magicSend => 'Bağlantı gönder';

  @override
  String get magicSentTitle => 'E-postanızı kontrol edin';

  @override
  String magicSentBody(String email) {
    return '$email adresinin hesabı varsa bir bağlantı gönderdik. Giriş için bu telefonda açın.';
  }

  @override
  String get magicConsuming => 'Giriş yapılıyor…';

  @override
  String get inviteTitle => 'Davetiniz';

  @override
  String inviteBody(String org, String site) {
    return '$org · $site';
  }

  @override
  String inviteUnit(String door) {
    return 'Daire $door';
  }

  @override
  String get inviteExistingAccount =>
      'Zaten bir hesabınız var. Kabul ederseniz bu siteye bağlanır.';

  @override
  String get inviteNewAccount =>
      'Hesabınızı oluşturmak için bir şifre belirleyin.';

  @override
  String get inviteDisplayName => 'Adınız';

  @override
  String get invitePassword => 'Yeni şifre (en az 10 karakter)';

  @override
  String get inviteAccept => 'Daveti kabul et';

  @override
  String get inviteInvalid => 'Bu davet geçersiz veya süresi dolmuş.';

  @override
  String joinTitle(String site) {
    return '$site sitesine katıl';
  }

  @override
  String joinOrg(String org) {
    return 'Yöneten: $org';
  }

  @override
  String get joinSignInFirst => 'Önce giriş yapın, sonra dairenizi seçin.';

  @override
  String get joinBlock => 'Blok';

  @override
  String get joinAllBlocks => 'Tüm bloklar';

  @override
  String get joinSearchUnit => 'Daire numarası ara';

  @override
  String get joinNoUnits => 'Daire bulunamadı.';

  @override
  String get joinRoleTitle => 'Ben';

  @override
  String get joinRoleOwner => 'Ev sahibi';

  @override
  String get joinRoleTenant => 'Kiracı';

  @override
  String get joinRoleHousehold => 'Hane üyesi';

  @override
  String get joinNote => 'Yöneticiniz için not (isteğe bağlı)';

  @override
  String get joinSubmit => 'İsteği gönder';

  @override
  String joinUnitLine(String block, String door) {
    return '$block · $door';
  }

  @override
  String get claimWaitingTitle => 'Onay bekleniyor';

  @override
  String claimWaitingBody(String door) {
    return 'Yöneticiniz $door numaralı daire için isteğinizi inceleyecek. Onaylanır onaylanmaz erişiminiz açılır.';
  }

  @override
  String get claimApprovedTitle => 'Onaylandı';

  @override
  String get claimRejectedTitle => 'Onaylanmadı';

  @override
  String get claimRejectedBody => 'Yöneticiniz bu isteği onaylamadı.';

  @override
  String claimUnknownStatus(String status) {
    return 'Durum: $status';
  }

  @override
  String get claimGoHome => 'Ana sayfaya git';

  @override
  String get homeTitle => 'Ana sayfa';

  @override
  String homeWelcome(String name) {
    return 'Merhaba, $name';
  }

  @override
  String get homeNoUnits => 'Hesabınıza bağlı bir daire yok.';

  @override
  String homePendingClaim(String door) {
    return '$door isteği: onay bekleniyor';
  }

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileName => 'Ad';

  @override
  String get profilePhone => 'Telefon';

  @override
  String get profileEmail => 'E-posta';

  @override
  String get profileServer => 'Sunucu';

  @override
  String get profileOrganizations => 'Kuruluşlar';

  @override
  String get profileUnits => 'Dairelerim';

  @override
  String get profileSignOutConfirm =>
      'Bu sunucudan çıkış yapılsın mı? Bu telefondaki kayıtlı veriler silinecek.';

  @override
  String get occupancyOwner => 'Ev sahibi';

  @override
  String get occupancyTenant => 'Kiracı';

  @override
  String get occupancyHousehold => 'Hane üyesi';

  @override
  String get occupancyFormer => 'Eski sakin';

  @override
  String get occupancyUnknown => 'Sakin';

  @override
  String get navHome => 'Ana sayfa';

  @override
  String get navProfile => 'Profil';

  @override
  String get aboutLicenses => 'Açık kaynak lisansları';

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String aboutVersion(String version, String build) {
    return 'Sürüm $version ($build)';
  }

  @override
  String get accruedLateFeeToday => 'Bugüne kadar işleyen gecikme zammı';

  @override
  String actionCopyValue(String label) {
    return '$label değerini kopyala';
  }

  @override
  String get actionSave => 'Kaydet';

  @override
  String get announcementAttachments => 'Ekler';

  @override
  String get announcementPinned => 'Sabitlenmiş';

  @override
  String get announcementTitle => 'Duyuru';

  @override
  String get announcementUnread => 'Okunmadı';

  @override
  String get announcementsEmpty => 'Henüz duyuru yok.';

  @override
  String get announcementsTitle => 'Duyurular';

  @override
  String get appLockBody =>
      'Uygulamayı açarken parmak izi, yüz veya cihaz PIN\'i istenir.';

  @override
  String get appLockEnable => 'Uygulamayı kilitle';

  @override
  String get appLockTitle => 'Uygulama kilidi';

  @override
  String get attachmentPhoto => 'Fotoğraf';

  @override
  String get balanceToday => 'Bugünkü bakiye';

  @override
  String get bankDetailsMissing =>
      'Yönetici bu site için henüz banka bilgisi yayınlamadı.';

  @override
  String get bankDetailsTitle => 'Banka bilgileri';

  @override
  String get bankHolder => 'Hesap sahibi';

  @override
  String get bankIban => 'IBAN';

  @override
  String get bankName => 'Banka';

  @override
  String get bankReference => 'Kullanılacak açıklama';

  @override
  String get closingBalance => 'Dönem sonu bakiye';

  @override
  String get consentAccepted => 'Kabul edildi';

  @override
  String get consentDeclined => 'Reddedildi';

  @override
  String consentDirectory(String site) {
    return '$site rehberinde listelenme';
  }

  @override
  String get consentsBody =>
      'Verdiğiniz veya reddettiğiniz izinler. İstediğiniz zaman değiştirebilirsiniz.';

  @override
  String get consentsOtherNote =>
      'Bu sunucu henüz başka izin metni yayınlamıyor.';

  @override
  String get consentsTitle => 'İzinler';

  @override
  String get copiedToClipboard => 'Kopyalandı';

  @override
  String get creditLabel => 'Alacak';

  @override
  String declareAmount(String currency) {
    return 'Tutar ($currency)';
  }

  @override
  String get declareBody =>
      'Havaleyi yaptınız mı? Yöneticiye bildirin, eşleştirsin. Onaylayana kadar ekstrenizde değişiklik olmaz.';

  @override
  String get declareDate => 'Havale tarihi';

  @override
  String get declareNeedsConnection =>
      'İnternet bağlantısı gerekir. Gönderim başarısız olursa tekrar deneyin: iki kez bildirilmez.';

  @override
  String get declareNote => 'Not (isteğe bağlı)';

  @override
  String get declareReference => 'Açıklama (isteğe bağlı)';

  @override
  String get declareSent => 'Bildirildi, onay bekleniyor';

  @override
  String get declareSentBody => 'Para ulaştığında yönetici onaylayacak.';

  @override
  String get declareSubmit => 'Havale ile ödedim';

  @override
  String get declareTitle => 'Havale ile ödedim';

  @override
  String get declaredSection => 'Bildirildi, onay bekliyor';

  @override
  String get directoryBody =>
      'Komşular adınızı site rehberinde yalnızca siz izin verirseniz görür.';

  @override
  String get directoryListMe => 'Beni rehberde göster';

  @override
  String get directoryShowPhone => 'Telefon numaramı göster';

  @override
  String get directoryTitle => 'Rehber';

  @override
  String get documentGenerated => 'Otomatik oluşturuldu';

  @override
  String get documentOpening => 'Açılıyor…';

  @override
  String get documentShare => 'Paylaş';

  @override
  String get documentsEmpty => 'Burada belge yok.';

  @override
  String get documentsTitle => 'Belgeler';

  @override
  String get folderSite => 'Site klasörü';

  @override
  String get folderUnit => 'Bağımsız bölüm klasörünüz';

  @override
  String get formerPeriodNote =>
      'Yalnızca kendi oturduğunuz dönemi görürsünüz.';

  @override
  String get gatePhoneHelp =>
      'Uygulamada bir ziyaretçi isteğine yanıt vermezseniz kapı görevlisi bu numarayı arar.';

  @override
  String get gatePhoneLabel => 'Kapı iletişim telefonu';

  @override
  String get homeAssemblyUntitled => 'Genel kurul';

  @override
  String get homeBookings => 'Rezervasyonlar';

  @override
  String get homeComingSoon => 'Yakında';

  @override
  String get homeNextAssembly => 'Sonraki genel kurul';

  @override
  String get homeNoAssembly => 'Planlanmış genel kurul yok.';

  @override
  String get homeNoMoneyAccess =>
      'Bakiyeler size gösterilmiyor. Erişim için daire sahibine başvurun.';

  @override
  String get homeOpenTickets => 'Açık talepler';

  @override
  String get homeParcels => 'Bekleyen kargolar';

  @override
  String get homeSectionCommunity => 'Topluluk';

  @override
  String get homeSectionNews => 'Haberler ve talepler';

  @override
  String get homeUnreadAnnouncements => 'Okunmamış duyurular';

  @override
  String get homeVisitors => 'Ziyaretçiler';

  @override
  String get householdNoMoney => 'Hane üyesi, mali bilgi yok';

  @override
  String get householdSeesMoney => 'Hane üyesi, mali bilgileri görür';

  @override
  String get includesLateFee => 'gecikme zammı dahil';

  @override
  String get languageDevice => 'Cihazla aynı';

  @override
  String get languageTitle => 'Dil';

  @override
  String get lockFailed => 'Kimliğiniz doğrulanamadı.';

  @override
  String get lockReason => 'OpenBekci kilidini aç';

  @override
  String get lockUnavailable =>
      'Bu cihazda ekran kilidi veya biyometri kurulu değil.';

  @override
  String get lockUnlock => 'Kilidi aç';

  @override
  String get lockedTitle => 'OpenBekci kilitli';

  @override
  String get methodBankTransfer => 'Havale';

  @override
  String get methodCard => 'Kart';

  @override
  String get methodCash => 'Nakit';

  @override
  String get moneyTitle => 'Aidat';

  @override
  String get navMoney => 'Aidat';

  @override
  String get navMore => 'Daha fazla';

  @override
  String get navNotifications => 'Bildirimler';

  @override
  String get navTickets => 'Talepler';

  @override
  String get nextDue => 'Sonraki vade:';

  @override
  String get nextDueNone => 'Vadesi gelen yok';

  @override
  String get notBookedYet => 'Henüz deftere işlenmedi';

  @override
  String get notifAnnouncementPublished => 'Yeni duyuru';

  @override
  String get notifBookingCancelled => 'Rezervasyon iptal edildi';

  @override
  String get notifBookingConfirmed => 'Rezervasyon onaylandı';

  @override
  String get notifChargeDueSoon => 'Aidat vadesi yaklaşıyor';

  @override
  String get notifChargeOverdue => 'Aidat vadesi geçti';

  @override
  String get notifClaimDecided => 'Bağımsız bölüm talebi sonuçlandı';

  @override
  String get notifClaimRequested => 'Bağımsız bölüm talebi';

  @override
  String get notifDeliveryReceived => 'Kargo teslim alındı';

  @override
  String get notifDeliveryWaiting => 'Kargo bekliyor';

  @override
  String get notifDunningReminder => 'Ödeme hatırlatması';

  @override
  String get notifMeetingAssemblyDue => 'Genel kurul zamanı';

  @override
  String get notifMeetingCalled => 'Toplantıya çağrı';

  @override
  String get notifMeetingDecisions => 'Toplantı kararları';

  @override
  String get notifPaymentConfirmed => 'Ödeme onaylandı';

  @override
  String get notifPaymentDeclared => 'Ödeme bildirildi';

  @override
  String get notifPaymentReceipt => 'Ödeme makbuzu';

  @override
  String get notifPaymentRejected => 'Ödeme onaylanmadı';

  @override
  String get notifStatementSent => 'Ekstre gönderildi';

  @override
  String get notifTermExpiring => 'Görev süresi doluyor';

  @override
  String get notifTicketCommented => 'Talebe yeni yorum';

  @override
  String get notifTicketUpdated => 'Talep güncellendi';

  @override
  String get notifVisitorApproval => 'Ziyaretçi onay bekliyor';

  @override
  String get notifVisitorArrived => 'Ziyaretçi geldi';

  @override
  String get notifVisitorQrRotated => 'Ziyaretçi kodu yenilendi';

  @override
  String get notificationsCannotMute => 'Her zaman açık';

  @override
  String get notificationsEmpty => 'Bildirim yok.';

  @override
  String get notificationsMarkAll => 'Tümünü okundu işaretle';

  @override
  String get notificationsMutesBody =>
      'Hangi bildirimleri alacağınızı seçin. Giriş kodları ve davetler kapatılamaz.';

  @override
  String get notificationsSettings => 'Bildirim ayarları';

  @override
  String get notificationsTitle => 'Bildirimler';

  @override
  String get openingBalance => 'Dönem başı bakiye';

  @override
  String get payByCard => 'Kartla öde';

  @override
  String get payByTransfer => 'Havale ile öde';

  @override
  String get payTitle => 'Havale ile ödeme';

  @override
  String get paymentConfirmed => 'Onaylandı';

  @override
  String get paymentDeclaredWaiting => 'Bildirildi, onay bekleniyor';

  @override
  String get paymentHistoryTitle => 'Ödemeler';

  @override
  String get paymentRefunded => 'İade edildi';

  @override
  String get paymentVoided => 'İptal edildi';

  @override
  String get paymentsEmpty => 'Henüz ödeme yok.';

  @override
  String get periodAll => 'Tümü';

  @override
  String get periodLast3Months => 'Son 3 ay';

  @override
  String get periodLastYear => 'Geçen yıl';

  @override
  String get periodThisYear => 'Bu yıl';

  @override
  String get profileContactsNote =>
      'Telefon ve e-posta giriş bilgilerinizdir; değiştirmek için yöneticiye başvurun.';

  @override
  String get profileEditMe => 'Bilgilerim';

  @override
  String get profileEditMeBody => 'Ad, kapı iletişim telefonu ve dil';

  @override
  String receiptNo(String no) {
    return 'Makbuz $no';
  }

  @override
  String get runningBalance => 'Bakiye';

  @override
  String get saved => 'Kaydedildi';

  @override
  String get sessionMobile => 'Mobil uygulama';

  @override
  String get sessionRevoke => 'Oturumu kapat';

  @override
  String get sessionRevokeConfirm => 'Bu cihazın oturumu kapatılsın mı?';

  @override
  String get sessionThisDevice => 'Bu cihaz';

  @override
  String get sessionWeb => 'Web tarayıcı';

  @override
  String get sessionsTitle => 'Oturum açık cihazlar';

  @override
  String get shareReceipt => 'Makbuzu paylaş';

  @override
  String sideCardTitle(String door) {
    return 'Daire $door';
  }

  @override
  String sideChip(String unit, String side) {
    return '$unit · $side';
  }

  @override
  String get sideOwner => 'Malik tarafı';

  @override
  String get sideTenant => 'Kiracı tarafı';

  @override
  String get statementLines => 'Ekstre';

  @override
  String get statementNoLines => 'Bu dönemde hareket yok.';

  @override
  String get statementPdf => 'PDF';

  @override
  String get stmtKindAdjustment => 'Düzeltme';

  @override
  String get stmtKindCharge => 'Borçlandırma';

  @override
  String get stmtKindCredit => 'Alacak';

  @override
  String get stmtKindLateFee => 'Gecikme zammı';

  @override
  String get stmtKindOpening => 'Devir';

  @override
  String get stmtKindPayment => 'Ödeme';

  @override
  String get stmtKindRefund => 'İade';

  @override
  String get stmtKindWaiver => 'Muafiyet';

  @override
  String get stmtKindReversal => 'Ters kayıt';

  @override
  String get switchOrganization => 'Kuruluş değiştir';

  @override
  String get ticketCategory => 'Kategori';

  @override
  String get ticketCommentHint => 'Yorum yazın';

  @override
  String get ticketCommentSend => 'Yorumu gönder';

  @override
  String ticketComments(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yorum',
      one: '1 yorum',
    );
    return '$_temp0';
  }

  @override
  String get ticketCommon => 'Ortak';

  @override
  String get ticketCommonHint => 'Sitedeki herkes görür ve +1 verebilir.';

  @override
  String get ticketDescription => 'Sorunu anlatın';

  @override
  String get ticketDraftKept =>
      'Gönderim başarısız olursa metniniz ve fotoğraflarınız saklanır; tekrar denemek ikinci bir talep oluşturmaz.';

  @override
  String get ticketMerged => 'Bu talep başka bir talebe birleştirildi.';

  @override
  String get ticketNew => 'Yeni talep';

  @override
  String get ticketNoThread => 'Henüz güncelleme yok.';

  @override
  String get ticketNoUnit => 'Bağımsız bölüm yok';

  @override
  String get ticketPhotoCamera => 'Kamera';

  @override
  String ticketPhotoCount(int count, int max) {
    return '$count / $max fotoğraf';
  }

  @override
  String get ticketPhotoGallery => 'Galeri';

  @override
  String get ticketPhotoRemove => 'Fotoğrafı kaldır';

  @override
  String get ticketPhotos => 'Fotoğraflar';

  @override
  String ticketPlusOne(int count) {
    return '+1 ($count)';
  }

  @override
  String get ticketPrivate => 'Özel';

  @override
  String get ticketPrivateHint => 'Yalnızca siz ve yönetim görür.';

  @override
  String ticketStatusChanged(String from, String to) {
    return 'Durum: $from - $to';
  }

  @override
  String ticketStatusSet(String to) {
    return 'Durum: $to';
  }

  @override
  String get ticketSubmit => 'Talebi gönder';

  @override
  String get ticketThread => 'Gelişmeler';

  @override
  String get ticketTitle => 'Talep';

  @override
  String get ticketTitleLabel => 'Başlık';

  @override
  String ticketUnit(String door) {
    return 'Daire $door';
  }

  @override
  String get ticketUnitOptional => 'Bağımsız bölüm (isteğe bağlı)';

  @override
  String get ticketVisibility => 'Kimler görebilir';

  @override
  String ticketVoted(int count) {
    return '+1 verdiniz ($count)';
  }

  @override
  String ticketVotes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count +1',
      one: '1 +1',
      zero: 'Henüz +1 yok',
    );
    return '$_temp0';
  }

  @override
  String get ticketsAll => 'Tümü';

  @override
  String get ticketsClosed => 'Kapalı';

  @override
  String get ticketsCommon => 'Ortak';

  @override
  String get ticketsEmpty => 'Burada talep yok.';

  @override
  String get ticketsEmptyTitle => 'Henüz talep yok';

  @override
  String get ticketsMine => 'Benimkiler';

  @override
  String get ticketsOpen => 'Açık';

  @override
  String get ticketsTitle => 'Talepler';

  @override
  String get totalDueToday => 'Bugün ödenecek toplam';

  @override
  String get valueOther => 'Diğer';

  @override
  String get ticketNoCategories =>
      'Bu site için henüz talep kategorisi tanımlanmadı. Yöneticiye başvurun.';

  @override
  String get bookingsTitle => 'Rezervasyonlar';

  @override
  String get bookingsFacilities => 'Alanlar';

  @override
  String get bookingsMine => 'Rezervasyonlarım';

  @override
  String get facilitiesEmpty =>
      'Burada rezervasyon yapılabilecek bir alan yok.';

  @override
  String get bookingsEmpty => 'Hiç rezervasyonunuz yok.';

  @override
  String get facilityNotFound => 'Bu alan artık kullanılabilir değil.';

  @override
  String get bookingBook => 'Rezerve et';

  @override
  String get bookingUnit => 'Daire';

  @override
  String get bookingPickDay => 'Gün';

  @override
  String get bookingNoDays => 'Rezervasyon yapılabilecek gün yok.';

  @override
  String get bookingDuration => 'Süre';

  @override
  String get bookingPickTime => 'Başlangıç saati';

  @override
  String get bookingNoSlots => 'Çalışma saatlerine uyan bir saat yok.';

  @override
  String get bookingSummary => 'Rezervasyonunuz';

  @override
  String get bookingFee => 'Ücret';

  @override
  String get bookingNoFee => 'Ücretsiz.';

  @override
  String get bookingConfirm => 'Rezervasyonu onayla';

  @override
  String get bookingConfirmedDone => 'Rezervasyon yapıldı ve onaylandı.';

  @override
  String get bookingNeedsConnection =>
      'Rezervasyon için internet gerekir. Saat boşsa hemen onaylanır.';

  @override
  String get bookingConfirmed => 'Onaylandı';

  @override
  String get bookingCancelled => 'İptal edildi';

  @override
  String get bookingRefunded => 'Ücret iade edildi';

  @override
  String get actionCancelBooking => 'Rezervasyonu iptal et';

  @override
  String get actionKeepBooking => 'Rezervasyonu koru';

  @override
  String get cancelBookingTitle => 'Rezervasyon iptal edilsin mi?';

  @override
  String get bookingCancelledDone => 'Rezervasyon iptal edildi.';

  @override
  String get feeFree => 'Ücretsiz';

  @override
  String get refundNoFee => 'Ücret yok, iade edilecek bir şey yok.';

  @override
  String refundGiven(String amount) {
    return 'Şimdi iptal ederseniz $amount tutarındaki ücret hesabınıza iade edilir.';
  }

  @override
  String refundKept(String amount, String until) {
    return '$amount tutarındaki ücret $until tarihinden önce iptal ederseniz iade edilir; sonrasında iade edilmez.';
  }

  @override
  String refundNever(String amount) {
    return '$amount tutarındaki ücret iptalde iade edilmez.';
  }

  @override
  String durationMinutes(int m) {
    return '$m dk';
  }

  @override
  String durationHours(int h) {
    return '$h sa';
  }

  @override
  String durationHoursMinutes(int h, int m) {
    return '$h sa $m dk';
  }

  @override
  String ruleHours(String days, String start, String end) {
    return 'Açık: $days, $start - $end';
  }

  @override
  String ruleMaxDuration(String duration) {
    return 'Rezervasyon başına en fazla $duration';
  }

  @override
  String ruleLeadTime(String duration) {
    return 'En az $duration önceden rezerve edin';
  }

  @override
  String ruleMaxDaysAhead(int n) {
    return 'En fazla $n gün önceden';
  }

  @override
  String ruleQuotaWeek(int n) {
    return 'Daire başına haftada $n';
  }

  @override
  String ruleQuotaMonth(int n) {
    return 'Daire başına ayda $n';
  }

  @override
  String ruleQuotaPerUnit(int n) {
    return 'Daire başına $n';
  }

  @override
  String get bookingProblemClosed => 'Çalışma saatleri dışında.';

  @override
  String get bookingProblemTooLong => 'İzin verilenden uzun.';

  @override
  String get bookingProblemTooSoon =>
      'Çok yakın: daha önceden rezerve edilmeli.';

  @override
  String get bookingProblemTooFar => 'Çok ileri bir tarih.';

  @override
  String get bookingProblemTaken => 'Dolu.';

  @override
  String get bookingProblemQuota => 'Dairenizin bu dönemdeki hakkı doldu.';

  @override
  String get bookingProblemNotAllowed => 'Bu alanı rezerve etme yetkiniz yok.';

  @override
  String get visitorsTitle => 'Ziyaretçiler';

  @override
  String get visitorsExpected => 'Beklenen';

  @override
  String get visitorsRecurring => 'Sürekli';

  @override
  String get visitorsHistory => 'Geçmiş';

  @override
  String get visitorsEmpty =>
      'Beklenen ziyaretçi yok. Kapı için QR kodu almak üzere bir misafir kaydedin.';

  @override
  String get visitorsHistoryEmpty => 'Geçmiş ziyaretçi yok.';

  @override
  String get visitorAdd => 'Ziyaretçi kaydet';

  @override
  String get visitorAddRecurring => 'Sürekli ziyaretçi ekle';

  @override
  String get visitorName => 'Ad soyad';

  @override
  String get visitorPlate => 'Plaka (isteğe bağlı)';

  @override
  String get visitorWindow => 'Ne zaman gelecek?';

  @override
  String get visitorFrom => 'Başlangıç';

  @override
  String get visitorUntil => 'Bitiş';

  @override
  String get visitorRegister => 'QR kodu oluştur';

  @override
  String get visitorPass => 'Ziyaretçi kartı';

  @override
  String get visitorNotFound => 'Bu ziyaretçi kartı bulunamadı.';

  @override
  String get visitorNoQr => 'Bu kart için QR kodu yok.';

  @override
  String get visitorQrLabel => 'Kapı için QR kodu';

  @override
  String get visitorQrHint =>
      'QR kodunu misafirinize gönderin. Güvenlik kapıda okutur; belirtilen saat aralığında ve öncesinde ile sonrasında 30 dakika geçerlidir.';

  @override
  String get visitorShare => 'QR kodunu paylaş';

  @override
  String get shareFailed => 'Paylaşım açılamadı.';

  @override
  String visitorShareText(String name, String range, String site, String code) {
    return '$site ziyaretçi kartı - $name: $range. Bu QR kodunu kapıda gösterin. Kod: $code';
  }

  @override
  String get visitorCancel => 'Bu kartı iptal et';

  @override
  String get visitorCancelled => 'İptal edildi';

  @override
  String get visitorArrived => 'Geldi';

  @override
  String get visitorWalkIn => 'Kapıdan';

  @override
  String get passUpcoming => 'Henüz geçerli değil';

  @override
  String get passValid => 'Şu an geçerli';

  @override
  String get passEnded => 'Süresi doldu';

  @override
  String get visitorStatusPreApproved => 'Bekleniyor';

  @override
  String get visitorStatusRequested => 'Yanıtınız bekleniyor';

  @override
  String get visitorStatusApproved => 'Onaylandı';

  @override
  String get visitorStatusDenied => 'Reddedildi';

  @override
  String get visitorStatusExpired => 'Süresi doldu';

  @override
  String get recurringEmpty =>
      'Sürekli ziyaretçi yok. Temizlikçi, bakıcı veya düzenli bir misafir ekleyin.';

  @override
  String get recurringActive => 'Geçerli';

  @override
  String get recurringRevoked => 'İptal edildi';

  @override
  String get recurringExpired => 'Süresi doldu';

  @override
  String get recurringDays => 'Günler';

  @override
  String get recurringValidity => 'Geçerlilik';

  @override
  String get validityNoEnd => 'Bitiş yok';

  @override
  String get validityMonth1 => '1 ay';

  @override
  String get validityMonths3 => '3 ay';

  @override
  String get validityYear1 => '1 yıl';

  @override
  String get recurringFrom => 'Başlangıç:';

  @override
  String get recurringTo => 'bitiş:';

  @override
  String get recurringQrHint =>
      'Bu QR kodu, siz iptal edene kadar seçilen gün ve saatlerde geçerlidir. İptal kapıda hemen geçerli olur.';

  @override
  String recurringShareText(
    String name,
    String when,
    String site,
    String code,
  ) {
    return '$site sürekli geçiş kartı - $name: $when. Bu QR kodunu kapıda gösterin. Kod: $code';
  }

  @override
  String get recurringRevoke => 'İptal et';

  @override
  String get recurringRevokeTitle => 'Bu kart iptal edilsin mi?';

  @override
  String recurringRevokeBody(String name) {
    return '$name artık bu QR koduyla içeri alınmayacak.';
  }

  @override
  String get visitorApprovalTitle => 'Kapıda ziyaretçi';

  @override
  String visitorWaitingAtGate(String name) {
    return '$name kapıda bekliyor';
  }

  @override
  String visitorRequestUnit(String door) {
    return '$door numaralı daire için';
  }

  @override
  String get visitorAnswer => 'Yanıtla';

  @override
  String get visitorApprove => 'Onayla';

  @override
  String get visitorDeny => 'Reddet';

  @override
  String visitorExpiresIn(String time) {
    return '$time içinde yanıtlayın';
  }

  @override
  String get visitorRequestGone => 'Bu istek artık açık değil.';

  @override
  String get visitorResultApproved =>
      'Bu ziyaretçiyi onayladınız. Güvenlik içeri alacak.';

  @override
  String get visitorResultDenied => 'Bu ziyaretçiyi reddettiniz.';

  @override
  String get visitorResultExpired => 'Yanıt süresi doldu.';

  @override
  String get visitorGateContactTitle => 'Güvenlik sizi arayacak';

  @override
  String visitorGateContactSet(String phone) {
    return 'Güvenlik, kapı iletişim numaranızı arar: $phone.';
  }

  @override
  String get visitorGateContactMissing =>
      'Kapı iletişim numarası eklemediniz; güvenlik sizi arayamaz. Profilinizden ekleyin.';

  @override
  String get visitorGateContactAdd => 'Kapı iletişim numarası ekle';

  @override
  String get parcelsTitle => 'Kargolar';

  @override
  String get parcelsWaiting => 'Sizi bekleyen';

  @override
  String get parcelsRecent => 'Yakın zamanda teslim alınan';

  @override
  String get parcelsEmpty => 'Henüz kargo yok.';

  @override
  String get parcelsNoneWaiting => 'Bekleyen kargo yok.';

  @override
  String get parcelNoDescription => 'Kargo';

  @override
  String parcelUnit(String door) {
    return 'Daire $door';
  }

  @override
  String get parcelReceived => 'Alındı:';

  @override
  String get parcelCollected => 'Teslim alındı:';

  @override
  String parcelCollectedBy(String name) {
    return '$name tarafından';
  }

  @override
  String get assemblyTitle => 'Genel kurul';

  @override
  String get assemblyEmpty => 'Henüz genel kurul yok.';

  @override
  String get assemblyUpcoming => 'Yaklaşan';

  @override
  String get assemblyPast => 'Önceki toplantılar';

  @override
  String get meetingKindGeneral => 'Genel kurul';

  @override
  String get meetingKindExtraordinary => 'Olağanüstü genel kurul';

  @override
  String get meetingStatusDraft => 'Taslak';

  @override
  String get meetingStatusCalled => 'Toplantıya çağrıldı';

  @override
  String get meetingStatusInSession => 'Toplantı sürüyor';

  @override
  String get meetingStatusClosed => 'Tamamlandı';

  @override
  String get meetingStatusCancelled => 'İptal edildi';

  @override
  String get meetingWhen => 'Ne zaman';

  @override
  String get meetingSecondCall => 'İkinci toplantı';

  @override
  String get meetingWhere => 'Nerede';

  @override
  String get meetingCallLetter => 'Toplantı daveti (PDF)';

  @override
  String get meetingAgenda => 'Gündem';

  @override
  String get meetingAgendaEmpty => 'Gündem henüz yayımlanmadı.';

  @override
  String get agendaVoted => 'Oylanır';

  @override
  String get pollsTitle => 'Toplantı öncesi anketler';

  @override
  String get pollsNonBinding =>
      'Yanıtınız bağlayıcı değildir. Daire başına bir yanıt.';

  @override
  String get pollsOwnersOnly => 'Anketleri yalnızca malikler yanıtlar.';

  @override
  String get pollOpen => 'Açık';

  @override
  String get pollClosed => 'Kapandı';

  @override
  String get pollNotOpen => 'Henüz açık değil';

  @override
  String get pollClosesAt => 'Kapanış:';

  @override
  String get pollYes => 'Evet';

  @override
  String get pollNo => 'Hayır';

  @override
  String get pollAbstain => 'Çekimser';

  @override
  String get pollAnswered => 'Yanıtlandı';

  @override
  String get checkInTitle => 'Toplantıya giriş';

  @override
  String get checkInOpen => 'Bu QR kodunu giriş masasında gösterin.';

  @override
  String get checkInNotYet =>
      'Giriş toplantı başlayınca açılır. Bu QR kodunu hazır tutun.';

  @override
  String get checkInDone => 'Giriş yapıldı';

  @override
  String get checkInQrLabel => 'Giriş QR kodu';

  @override
  String get minutesTitle => 'Toplantı tutanağı';

  @override
  String get minutesOpen => 'Tutanağı aç (PDF)';

  @override
  String get minutesNone => 'Tutanak henüz hazır değil.';

  @override
  String get decisionsTitle => 'Kararlar';

  @override
  String get decisionsEmpty => 'Gösterilecek karar yok.';

  @override
  String get decisionsResidentsOnly =>
      'Sakinleri ilgilendiren kararları görüyorsunuz.';

  @override
  String get decisionConcernsResidents => 'Sakinleri ilgilendirir';

  @override
  String decisionNumber(int year, int no) {
    return 'Karar $year/$no';
  }

  @override
  String get outcomeAccepted => 'Kabul edildi';

  @override
  String get outcomeRejected => 'Reddedildi';

  @override
  String get outcomeNoVote => 'Oylama yok';

  @override
  String get outcomeNoted => 'Bilgiye sunuldu';

  @override
  String get webOpen => 'Web\'de aç';

  @override
  String get webOpenBody => 'Web sitesini açar ve oturumunuzu açar.';

  @override
  String get webOpenFailed => 'Tarayıcı açılamadı.';

  @override
  String get notifGeneric => 'Yeni bildirim';

  @override
  String get notifAgentSilent => 'Geçiş ajanı sessiz';

  @override
  String get notifAgentClockSkew => 'Geçiş ajanı saat farkı';

  @override
  String get notifAgentStopped => 'Geçiş ajanı durdu';

  @override
  String get notifWebhookFailing => 'Webhook uç noktası başarısız';

  @override
  String get notifSignInCode => 'Giriş kodu';

  @override
  String get notifInvitation => 'Davetiye';

  @override
  String get notifPeriodicTitle => 'Yeni bildirimler';

  @override
  String notifPeriodicBody(int count) {
    return '$count okunmamış bildiriminiz var.';
  }

  @override
  String get notificationsMayBeDelayed => 'Bildirimler gecikebilir';

  @override
  String get notificationsMayBeDelayedBody =>
      'Anlık bildirimler şu an bu telefona ulaşmıyor; uygulama arada bir yenilikleri kontrol eder.';

  @override
  String get channelAnnouncements => 'Duyurular';

  @override
  String get channelMoney => 'Ödemeler ve ekstreler';

  @override
  String get channelTickets => 'Talepler';

  @override
  String get channelCommunity => 'Ziyaretçiler, kargolar ve rezervasyonlar';

  @override
  String get channelAssembly => 'Genel kurul';

  @override
  String get channelAccount => 'Hesap';

  @override
  String get channelSystem => 'Sistem';

  @override
  String get checkoutChargesTitle => 'Ödenecek borçlar';

  @override
  String get checkoutChargesHint =>
      'Borç seçin; hiçbirini seçmezseniz açık borçlar en eskiden başlayarak ödenir.';

  @override
  String checkoutAmount(String currency) {
    return 'Başka tutar ($currency, isteğe bağlı)';
  }

  @override
  String get checkoutContinue => 'Ödemeye devam et';

  @override
  String get checkoutStatusTitle => 'Kart ödemesi';

  @override
  String get checkoutPending => 'Ödeme bekleniyor';

  @override
  String get checkoutPendingBody =>
      'Ödeme sağlayıcısı ile kontrol ediyoruz. Bu ekrandan çıkabilirsiniz; makbuz bildirim olarak gelir.';

  @override
  String get checkoutPaid => 'Ödeme alındı';

  @override
  String get checkoutFailed => 'Ödeme tamamlanamadı';

  @override
  String get checkoutExpired => 'Ödeme sayfasının süresi doldu';

  @override
  String get checkoutRefunded => 'Ödeme iade edildi';

  @override
  String checkoutMismatch(String confirmed, String asked) {
    return 'Sağlayıcı $asked yerine $confirmed onayladı. Ödenen tutar işlendi; kalan borç açık kalır.';
  }

  @override
  String get checkoutReopen => 'Ödeme sayfasını aç';

  @override
  String get checkoutRefresh => 'Tekrar kontrol et';

  @override
  String get myCheckoutsTitle => 'Kart ödemeleri';

  @override
  String get myCheckoutsEmpty => 'Henüz kart ödemesi yok.';
}
