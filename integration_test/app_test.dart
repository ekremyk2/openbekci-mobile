// On-device smoke test: launches the real app (dev flavor) against a server.
//
//   flutter test integration_test/app_test.dart --flavor dev \
//     --dart-define=OPENBEKCI_SERVER=http://10.0.2.2:8484
//
// Needs an emulator or phone. The sign-in methods are exercised against a live
// server by the host-side live tests in test/live (see README); this test only
// proves the release-shaped app boots, shows the server screen and reaches the
// sign-in methods.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/providers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('boots to the server screen and connects', (tester) async {
    ensureTimeZones();
    final config = await AppConfig.load(Flavor.dev);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(config),
          appInfoProvider.overrideWithValue(
            const AppInfo(version: '1.0.0', build: '1'),
          ),
        ],
        child: const OpenBekciApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('serverField')), findsOneWidget);
    final server = config.defaultServerUrl;
    if (server != null) {
      await tester.tap(find.byKey(const Key('serverConnect')));
      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(find.byKey(const Key('method_password')), findsOneWidget);
    }
  });
}
