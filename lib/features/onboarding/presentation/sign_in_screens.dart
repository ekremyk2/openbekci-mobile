import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_mobile/core/auth/auth_repository.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

Future<void> _finishSignIn(WidgetRef ref, SignInResult result) async {
  final server = ref.read(pendingServerProvider)!;
  await ref.read(sessionProvider).completeSignIn(server, result);
}

/// Methods offered by the server, rendered from `auth_methods` in the order of
/// the mobile plan section 6: SMS code, password, email link. Unknown ids show
/// as unavailable instead of failing.
class SignInScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final server = ref.watch(pendingServerProvider);
    final offered = server?.authMethodIds ?? const <String>[];
    final known = [
      for (final id in knownAuthMethods)
        if (offered.contains(id)) id,
    ];
    final unknown = [
      for (final id in offered)
        if (!knownAuthMethods.contains(id)) id,
    ];
    return FormPage(
      title: l.signInTitle,
      leading: BackButton(onPressed: () => context.go('/server')),
      children: [
        if (server != null)
          Text(
            l.signInServerLine(server.instanceName),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        const SizedBox(height: 16),
        if (known.isEmpty) Text(l.signInNoMethods),
        for (final id in known)
          _MethodTile(
            key: Key('method_$id'),
            icon: switch (id) {
              'sms_otp' => Icons.sms_outlined,
              'password' => Icons.password,
              _ => Icons.mark_email_unread_outlined,
            },
            title: switch (id) {
              'sms_otp' => l.signInMethodSms,
              'password' => l.signInMethodPassword,
              _ => l.signInMethodMagic,
            },
            subtitle: switch (id) {
              'sms_otp' => l.signInMethodSmsHint,
              'password' => l.signInMethodPasswordHint,
              _ => l.signInMethodMagicHint,
            },
            onTap: () => context.push(switch (id) {
              'sms_otp' => '/sign-in/sms',
              'password' => '/sign-in/password',
              _ => '/sign-in/magic',
            }),
          ),
        for (final id in unknown)
          _MethodTile(
            key: Key('method_$id'),
            icon: Icons.lock_outline,
            title: id,
            subtitle: l.signInMethodUnavailable,
          ),
      ],
    );
  }
}

class _MethodTile extends StatelessWidget {
  const new({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: onTap == null ? null : const Icon(Icons.chevron_right),
        enabled: onTap != null,
        onTap: onTap,
        minVerticalPadding: 12,
      ),
    );
  }
}

/// Phone number, then the 6-digit code (primary method, decision D5).
class SmsSignInScreen extends ConsumerStatefulWidget {
  const new({this.resendCooldown = 30, super.key});

  final int resendCooldown;

  @override
  ConsumerState<SmsSignInScreen> createState() => _SmsSignInScreenState();
}

class _SmsSignInScreenState extends ConsumerState<SmsSignInScreen>
    with SubmitState<SmsSignInScreen> {
  final _phone = TextEditingController();
  final _code = TextEditingController();
  bool _codeSent = false;
  int _cooldown = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _phone.dispose();
    _code.dispose();
    super.dispose();
  }

  void _startCooldown() {
    _timer?.cancel();
    setState(() => _cooldown = widget.resendCooldown);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _cooldown = _cooldown - 1);
      if (_cooldown <= 0) t.cancel();
    });
  }

  Future<void> _send() => submit(() async {
    await ref.read(authRepositoryProvider).requestOtp(_phone.text.trim());
    if (!mounted) return;
    setState(() => _codeSent = true);
    _startCooldown();
  });

  Future<void> _verify() => submit(() async {
    final result = await ref
        .read(authRepositoryProvider)
        .signInWithOtp(phone: _phone.text.trim(), code: _code.text.trim());
    await _finishSignIn(ref, result);
    if (mounted) context.go(ref.read(linkHandlerProvider).afterSignIn());
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return FormPage(
      title: _codeSent ? l.smsCodeTitle : l.signInMethodSms,
      children: [
        TextField(
          key: const Key('phoneField'),
          controller: _phone,
          enabled: !_codeSent && !busy,
          keyboardType: TextInputType.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
          decoration: InputDecoration(
            labelText: l.smsPhoneLabel,
            hintText: l.smsPhoneHint,
            errorText: fieldMessage(context, error, 'phone'),
          ),
        ),
        const SizedBox(height: 16),
        if (_codeSent) ...[
          Text(l.smsCodeSent(_phone.text.trim())),
          const SizedBox(height: 16),
          TextField(
            key: const Key('codeField'),
            controller: _code,
            enabled: !busy,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.oneTimeCode],
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            decoration: InputDecoration(
              labelText: l.smsCodeLabel,
              errorText: fieldMessage(context, error, 'code'),
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (error != null) ...[
          ErrorBanner(error: error!),
          const SizedBox(height: 16),
        ],
        if (!_codeSent)
          FilledButton(
            key: const Key('smsSend'),
            onPressed: busy ? null : _send,
            child: Text(l.smsSendCode),
          )
        else ...[
          FilledButton(
            key: const Key('smsVerify'),
            onPressed: busy ? null : _verify,
            child: Text(l.smsVerify),
          ),
          const SizedBox(height: 12),
          TextButton(
            key: const Key('smsResend'),
            onPressed: busy || _cooldown > 0 ? null : _send,
            child: Text(_cooldown > 0 ? l.smsResendIn(_cooldown) : l.smsResend),
          ),
        ],
      ],
    );
  }
}

/// Email or phone with a password.
class PasswordSignInScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<PasswordSignInScreen> createState() =>
      _PasswordSignInScreenState();
}

class _PasswordSignInScreenState extends ConsumerState<PasswordSignInScreen>
    with SubmitState<PasswordSignInScreen> {
  final _identifier = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _identifier.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _signIn() => submit(() async {
    final result = await ref
        .read(authRepositoryProvider)
        .signInWithPassword(
          identifier: _identifier.text.trim(),
          password: _password.text,
        );
    await _finishSignIn(ref, result);
    if (mounted) context.go(ref.read(linkHandlerProvider).afterSignIn());
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return FormPage(
      title: l.signInMethodPassword,
      children: [
        TextField(
          key: const Key('identifierField'),
          controller: _identifier,
          enabled: !busy,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.username],
          decoration: InputDecoration(
            labelText: l.passwordIdentifierLabel,
            errorText: fieldMessage(context, error, 'identifier'),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          key: const Key('passwordField'),
          controller: _password,
          enabled: !busy,
          obscureText: _obscure,
          autofillHints: const [AutofillHints.password],
          onSubmitted: (_) => busy ? null : _signIn(),
          decoration: InputDecoration(
            labelText: l.passwordLabel,
            errorText: fieldMessage(context, error, 'password'),
            suffixIcon: IconButton(
              tooltip: _obscure ? l.passwordShow : l.passwordHide,
              icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (error != null) ...[
          ErrorBanner(error: error!),
          const SizedBox(height: 16),
        ],
        FilledButton(
          key: const Key('passwordSubmit'),
          onPressed: busy ? null : _signIn,
          child: Text(l.passwordSignIn),
        ),
      ],
    );
  }
}

/// Requests the email link (`client=mobile`) and waits for it to be opened.
class MagicLinkRequestScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<MagicLinkRequestScreen> createState() =>
      _MagicLinkRequestScreenState();
}

class _MagicLinkRequestScreenState extends ConsumerState<MagicLinkRequestScreen>
    with SubmitState<MagicLinkRequestScreen> {
  final _email = TextEditingController();
  bool _sent = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _send() => submit(() async {
    await ref.read(authRepositoryProvider).requestMagicLink(_email.text.trim());
    if (mounted) setState(() => _sent = true);
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    if (_sent) {
      return FormPage(
        title: l.magicSentTitle,
        children: [
          const Icon(Icons.mark_email_read_outlined, size: 56),
          const SizedBox(height: 16),
          Text(
            l.magicSentBody(_email.text.trim()),
            key: const Key('magicSentBody'),
          ),
          const SizedBox(height: 16),
          TextButton(onPressed: busy ? null : _send, child: Text(l.smsResend)),
        ],
      );
    }
    return FormPage(
      title: l.signInMethodMagic,
      children: [
        TextField(
          key: const Key('emailField'),
          controller: _email,
          enabled: !busy,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          decoration: InputDecoration(
            labelText: l.magicEmailLabel,
            errorText: fieldMessage(context, error, 'email'),
          ),
        ),
        const SizedBox(height: 16),
        if (error != null) ...[
          ErrorBanner(error: error!),
          const SizedBox(height: 16),
        ],
        FilledButton(
          key: const Key('magicSend'),
          onPressed: busy ? null : _send,
          child: Text(l.magicSend),
        ),
      ],
    );
  }
}

/// Exchanges the token of an opened magic link for a session.
class MagicLinkConsumeScreen extends ConsumerStatefulWidget {
  const new({required this.token, super.key});

  final String token;

  @override
  ConsumerState<MagicLinkConsumeScreen> createState() =>
      _MagicLinkConsumeScreenState();
}

class _MagicLinkConsumeScreenState extends ConsumerState<MagicLinkConsumeScreen>
    with SubmitState<MagicLinkConsumeScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(_consume());
  }

  Future<void> _consume() => submit(() async {
    final result = await ref
        .read(authRepositoryProvider)
        .consumeMagicLink(widget.token);
    await _finishSignIn(ref, result);
    if (mounted) context.go(ref.read(linkHandlerProvider).afterSignIn());
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return FormPage(
      title: l.signInTitle,
      children: [
        if (error == null) ...[
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 16),
          Center(child: Text(l.magicConsuming)),
        ] else ...[
          ErrorBanner(error: error!),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () => context.go('/sign-in'),
            child: Text(l.signInTitle),
          ),
        ],
      ],
    );
  }
}
