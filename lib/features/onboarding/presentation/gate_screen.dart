import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// "Update the app" / "ask your manager to update the server" (mobile plan
/// section 5.1 step 3). Both allow choosing another server.
class GateScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final gate = ref.watch(gateProvider);
    final String title;
    final String body;
    switch (gate) {
      case GateAppTooOld(:final minVersion, :final appVersion):
        title = l.gateUpdateTitle;
        body = l.gateUpdateBody(minVersion, appVersion);
      case GateServerUnsupported(:final serverVersion):
        title = l.gateServerTitle;
        body = l.gateServerBody(serverVersion);
      case GateOpen():
      case null:
        title = '';
        body = '';
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.system_update,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(body, textAlign: TextAlign.center),
                const SizedBox(height: 24),
                OutlinedButton(
                  key: const Key('gateChange'),
                  onPressed: () {
                    ref.read(pendingServerProvider.notifier).set(null);
                    context.go('/server');
                  },
                  child: Text(l.gateChangeServer),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
