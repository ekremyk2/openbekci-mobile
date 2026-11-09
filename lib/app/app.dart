import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/app/theme/theme.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/profile/application/profile_providers.dart';
import 'package:openbekci_mobile/features/shell/presentation/app_shell.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Root widget: MaterialApp.router, Material 3 theme from the brand tokens,
/// locale chain, and incoming-link handling.
class OpenBekciApp extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<OpenBekciApp> createState() => _OpenBekciAppState();
}

class _OpenBekciAppState extends ConsumerState<OpenBekciApp> {
  StreamSubscription<Object?>? _links;

  @override
  void initState() {
    super.initState();
    unawaited(Future<void>(() => restoreLocale(ref)));
    _links = ref.read(incomingLinksProvider).listen((link) async {
      // Wait for the account to load so a signed-in user is not bounced.
      await ref.read(accountProvider.future);
      final location = await ref.read(linkHandlerProvider).resolve(link);
      ref.read(routerProvider).go(location);
    });
  }

  @override
  void dispose() {
    unawaited(_links?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(appConfigProvider);
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);
    // Instance branding tints the app once a server is known.
    final branded = parseHexColor(
      ref.watch(
        pendingServerProvider.select((d) => d?.document.branding.primaryColor),
      ),
    );
    final seed = branded ?? config.seedColor;
    return MaterialApp.router(
      title: config.appName,
      debugShowCheckedModeBanner: config.flavor.isDev,
      routerConfig: router,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) =>
          AppLockGate(child: child ?? const SizedBox()),
      theme: buildTheme(seed: seed, brightness: Brightness.light),
      darkTheme: buildTheme(seed: seed, brightness: Brightness.dark),
    );
  }
}
