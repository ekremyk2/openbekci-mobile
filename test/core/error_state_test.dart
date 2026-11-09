import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

void main() {
  testWidgets('a long error on a small screen scrolls instead of overflowing', (
    tester,
  ) async {
    tester.view
      ..physicalSize = const Size(320, 400)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ErrorState(
            error: AppError(
              code: 'a_very_long_error_code_' * 12,
              requestId: 'request-id-' * 20,
            ),
            onRetry: () {},
          ),
        ),
      ),
    );
    await tester.tap(find.byType(ExpansionTile));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
