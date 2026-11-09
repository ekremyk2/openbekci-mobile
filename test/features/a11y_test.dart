import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/fake_api.dart';
import '../support/fixtures.dart';
import '../support/resident_harness.dart';

/// Accessibility guidelines (mobile plan section 15) on three key screens, in
/// the light and the dark theme: 48 dp targets, labelled targets, text contrast.
void main() {
  final screens = {
    'home': '/',
    'money': '/money',
    'card checkout': '/money/card?side=$unit12:owner',
  };
  for (final dark in [false, true]) {
    for (final screen in screens.entries) {
      testWidgets(
        '${screen.key} meets the guidelines ${dark ? 'dark' : 'light'}',
        (tester) async {
          final handle = tester.ensureSemantics();
          tester.platformDispatcher.platformBrightnessTestValue = dark
              ? Brightness.dark
              : Brightness.light;
          addTearDown(
            tester.platformDispatcher.clearPlatformBrightnessTestValue,
          );
          final r = ResidentApp();
          r.adapter
            ..answer(
              'GET /v1/orgs/$orgId/sites/$siteId/settings',
              FakeResponse.ok(siteSettingsJson()),
            )
            ..answer(
              'GET /v1/orgs/$orgId/charges',
              FakeResponse.ok(pageOf([chargeJson()])),
            );
          await pumpResident(tester, r);
          await open(tester, screen.value);
          expect(
            Theme.of(tester.element(find.byType(Scaffold).first)).brightness,
            dark ? Brightness.dark : Brightness.light,
          );
          await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
          await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
          await expectLater(tester, meetsGuideline(textContrastGuideline));
          handle.dispose();
        },
      );
    }
  }
}
