import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Shared entry point of `main_dev.dart` and `main_prod.dart`.
Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  ensureTimeZones();
  final config = await AppConfig.load(flavor);
  final info = await PackageInfo.fromPlatform();
  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        appInfoProvider.overrideWithValue(
          AppInfo(
            // Strip a flavor suffix such as `-dev`: the gate compares numbers.
            version: info.version.split('-').first,
            build: info.buildNumber,
          ),
        ),
      ],
      child: const OpenBekciApp(),
    ),
  );
}
