import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// First launch: the server address (typed, prefilled or scanned) is checked
/// through discovery (mobile plan section 5.1).
class ServerScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends ConsumerState<ServerScreen>
    with SubmitState<ServerScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final pendingOrigin = ref.read(pendingLinkProvider)?.origin;
    _controller = TextEditingController(
      text: pendingOrigin ?? ref.read(appConfigProvider).defaultServerUrl ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _connect() => submit(() async {
    final handler = ref.read(linkHandlerProvider);
    // A pasted invitation, site or sign-in link carries the server and what to
    // do next (the SMS an invitation arrives in holds the web URL).
    final pasted = AppLink.parseLoose(_controller.text);
    final String input;
    if (pasted != null && pasted is! ServerLink && pasted.origin != null) {
      ref.read(pendingLinkProvider.notifier).set(pasted);
      input = pasted.origin!;
    } else {
      input = _controller.text;
    }
    await handler.connect(input);
    final pending = ref.read(pendingLinkProvider);
    final String location;
    if (pending != null) {
      ref.read(pendingLinkProvider.notifier).set(null);
      location = await handler.resolve(pending);
    } else {
      location = '/sign-in';
    }
    if (mounted) context.go(location);
  });

  String? _banner(AppLocalizations l) =>
      switch (ref.watch(pendingLinkProvider)) {
        InviteLink() => l.serverPendingInvite,
        JoinLink() => l.serverPendingJoin,
        MagicLoginLink() => l.serverPendingMagic,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final banner = _banner(l);
    return FormPage(
      title: l.serverTitle,
      children: [
        Text(l.serverBody, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        if (banner != null) ...[
          Text(
            banner,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 16),
        ],
        TextField(
          key: const Key('serverField'),
          controller: _controller,
          keyboardType: TextInputType.url,
          autocorrect: false,
          enableSuggestions: false,
          textInputAction: TextInputAction.go,
          autofillHints: const [AutofillHints.url],
          decoration: InputDecoration(
            labelText: l.serverFieldLabel,
            hintText: l.serverFieldHint,
          ),
          onSubmitted: (_) => busy ? null : _connect(),
        ),
        const SizedBox(height: 16),
        if (error != null) ...[
          ErrorBanner(error: error!),
          const SizedBox(height: 16),
        ],
        FilledButton(
          key: const Key('serverConnect'),
          onPressed: busy ? null : _connect,
          child: busy ? Text(l.serverChecking) : Text(l.serverConnect),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          key: const Key('serverScan'),
          onPressed: busy ? null : () => context.push('/scan'),
          icon: const Icon(Icons.qr_code_scanner),
          label: Text(l.serverScanQr),
        ),
      ],
    );
  }
}
