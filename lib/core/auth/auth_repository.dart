import 'package:flutter/foundation.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';

/// What every sign-in method yields: an opaque token pair and who signed in.
@immutable
class SignInResult {
  const new({
    required this.accessToken,
    required this.accessExpiresAt,
    required this.refreshToken,
    required this.userId,
    this.displayName,
  });

  final String accessToken;
  final DateTime accessExpiresAt;
  final String refreshToken;
  final String userId;
  final String? displayName;
}

/// Sign-in methods against one server (mobile plan section 6). Anonymous: no
/// bearer token is involved until a [SignInResult] is returned.
abstract class AuthRepository {
  /// Texts a code to [phone] (`202`; the answer never reveals whether the
  /// number has an account).
  Future<void> requestOtp(String phone);

  Future<SignInResult> signInWithOtp({
    required String phone,
    required String code,
  });

  Future<SignInResult> signInWithPassword({
    required String identifier,
    required String password,
  });

  /// Emails a link that opens the app (`client=mobile`).
  Future<void> requestMagicLink(String email);

  Future<SignInResult> consumeMagicLink(String token);

  /// Accepts an invitation; for a new account [password] is required.
  Future<SignInResult> acceptInvitation(
    String token, {
    String? password,
    String? displayName,
    String? locale,
  });

  /// Reads an invitation without a session.
  Future<InvitationPreview> previewInvitation(String token);
}

/// [AuthRepository] on the generated client.
class ApiAuthRepository implements AuthRepository {
  new(this._api, {required this.deviceName});

  final ApiClient _api;
  final String deviceName;

  @override
  Future<void> requestOtp(String phone) => unwrapVoid(
    () => _api.auth.authRequestOtp(otpRequest: OtpRequest(phone: phone)),
  );

  @override
  Future<SignInResult> signInWithOtp({
    required String phone,
    required String code,
  }) async {
    final token = await unwrap(
      () => _api.auth.authCreateToken(
        credentials: Credentials(
          method: 'sms_otp',
          identifier: phone,
          code: code,
          client: CredentialsClientEnum.mobile,
          deviceName: deviceName,
        ),
      ),
    );
    return _fromToken(token);
  }

  @override
  Future<SignInResult> signInWithPassword({
    required String identifier,
    required String password,
  }) async {
    final token = await unwrap(
      () => _api.auth.authCreateToken(
        credentials: Credentials(
          method: 'password',
          identifier: identifier,
          password: password,
          client: CredentialsClientEnum.mobile,
          deviceName: deviceName,
        ),
      ),
    );
    return _fromToken(token);
  }

  @override
  Future<void> requestMagicLink(String email) => unwrapVoid(
    () => _api.auth.authRequestMagicLink(
      magicLinkRequest: MagicLinkRequest(
        email: email,
        client: MagicLinkRequestClientEnum.mobile,
      ),
    ),
  );

  @override
  Future<SignInResult> consumeMagicLink(String token) async {
    final result = await unwrap(
      () => _api.auth.authConsumeMagicLink(
        magicLinkConsumeRequest: MagicLinkConsumeRequest(
          token: token,
          client: MagicLinkConsumeRequestClientEnum.mobile,
          deviceName: deviceName,
        ),
      ),
    );
    return _fromAuthResult(result);
  }

  @override
  Future<SignInResult> acceptInvitation(
    String token, {
    String? password,
    String? displayName,
    String? locale,
  }) async {
    final result = await unwrap(
      () => _api.people.peopleAcceptInvitation(
        token: token,
        invitationAccept: InvitationAccept(
          password: password,
          displayName: displayName,
          locale: locale,
          client: InvitationAcceptClientEnum.mobile,
        ),
      ),
    );
    return _fromAuthResult(result);
  }

  @override
  Future<InvitationPreview> previewInvitation(String token) =>
      unwrap(() => _api.people.peoplePreviewInvitation(token: token));

  SignInResult _fromToken(TokenResponse t) => SignInResult(
    accessToken: t.accessToken,
    accessExpiresAt: t.accessExpiresAt,
    refreshToken: t.refreshToken,
    userId: t.user.id,
  );

  SignInResult _fromAuthResult(AuthResult r) {
    final access = r.accessToken;
    final refresh = r.refreshToken;
    if (access == null || refresh == null) {
      // The server answered with a web (cookie) session: not usable here.
      throw const AppError(
        code: 'unknown',
        detail: 'server did not return tokens for client=mobile',
      );
    }
    return SignInResult(
      accessToken: access,
      accessExpiresAt: r.expiresAt, // for client=mobile: access token expiry
      refreshToken: refresh,
      userId: r.user.id,
    );
  }
}
