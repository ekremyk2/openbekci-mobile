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
  String get homePhaseNote => 'Diğer ekranlar sonraki sürümlerde gelecek.';

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
}
