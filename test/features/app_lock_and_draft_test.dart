// Calls on one notifier in sequence read better than cascades here.
// ignore_for_file: cascade_invocations
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/features/profile/application/profile_providers.dart';
import 'package:openbekci_mobile/features/tickets/application/tickets_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../support/resident_harness.dart';

void main() {
  group('app lock timing', () {
    late FakeLock lock;
    late ProviderContainer c;
    late DateTime now;

    Future<void> setUpLock() async {
      SharedPreferences.setMockInitialValues({'app_lock_enabled': true});
      lock = FakeLock();
      c = ProviderContainer(
        overrides: [lockAuthenticatorProvider.overrideWithValue(lock)],
      );
      addTearDown(c.dispose);
      now = DateTime(2026, 11, 9, 12);
      c.read(appLockProvider.notifier).clock = () => now;
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
      expect(c.read(appLockProvider).loaded, isTrue);
      await c.read(appLockProvider.notifier).unlock('x');
      expect(c.read(appLockProvider).locked, isFalse);
    }

    test('a short absence stays open, a long one locks', () async {
      await setUpLock();
      final n = c.read(appLockProvider.notifier);
      n.lifecycle(AppLifecycleState.paused);
      now = now.add(const Duration(seconds: 5));
      n.lifecycle(AppLifecycleState.resumed);
      expect(c.read(appLockProvider).locked, isFalse);
      n.lifecycle(AppLifecycleState.paused);
      now = now.add(const Duration(seconds: 31));
      n.lifecycle(AppLifecycleState.resumed);
      expect(c.read(appLockProvider).locked, isTrue);
    });

    test('setting the clock back does not extend the grace period', () async {
      await setUpLock();
      final n = c.read(appLockProvider.notifier);
      n.lifecycle(AppLifecycleState.paused);
      now = now.subtract(const Duration(days: 1));
      n.lifecycle(AppLifecycleState.resumed);
      expect(c.read(appLockProvider).locked, isTrue);
    });

    test('a failed prompt (also a lock-out) keeps the app locked', () async {
      await setUpLock();
      final n = c.read(appLockProvider.notifier);
      n.lifecycle(AppLifecycleState.paused);
      now = now.add(const Duration(minutes: 5));
      n.lifecycle(AppLifecycleState.resumed);
      lock.result = LockResult.failed;
      await n.unlock('x');
      expect(c.read(appLockProvider).locked, isTrue);
    });
  });

  group('ticket draft and sign-out', () {
    _draftTests();
    test('the saved draft key carries the prefix the wipe removes', () {
      expect(accountScopedPrefPrefixes, contains(ticketDraftPrefPrefix));
    });

    test('wiping forgets the selected org and the saved drafts only', () async {
      SharedPreferences.setMockInitialValues({
        selectedOrgPref: 'org-1',
        '$ticketDraftPrefPrefix/user/org-1': '{}',
        'locale': 'tr',
        'app_lock_enabled': true,
      });
      await wipeAccountPrefs();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getKeys(), unorderedEquals(['locale', 'app_lock_enabled']));
    });
  });
}

void _draftTests() {
  testWidgets('an edited draft gets a new key; an untouched retry keeps it', (
    tester,
  ) async {
    final r = ResidentApp();
    await pumpResident(tester, r);
    final c = ProviderScope.containerOf(
      tester.element(find.byType(OpenBekciApp)),
    );
    final notifier = c.read(ticketDraftProvider.notifier);
    final first = c.read(ticketDraftProvider).key;
    notifier.update((d) => d.copyWith(title: 'Leak'));
    final second = c.read(ticketDraftProvider).key;
    expect(second, isNot(first));
    notifier.update((d) => d.copyWith(title: 'Leak'));
    expect(c.read(ticketDraftProvider).key, second);
    notifier.addPhotos([(name: 'a.jpg', bytes: tinyPng)]);
    expect(c.read(ticketDraftProvider).key, isNot(second));
  });

  testWidgets('no more than ten photos, and sign-out drops the draft', (
    tester,
  ) async {
    final r = ResidentApp();
    await pumpResident(tester, r);
    final c = ProviderScope.containerOf(
      tester.element(find.byType(OpenBekciApp)),
    );
    c.read(ticketDraftProvider.notifier).addPhotos([
      for (var i = 0; i < 14; i++) (name: '$i.jpg', bytes: tinyPng),
    ]);
    expect(c.read(ticketDraftProvider).photos, hasLength(10));
    c.read(ticketDraftProvider.notifier).update((d) => d.copyWith(title: 'x'));
    await tester.runAsync(() => c.read(sessionProvider).signOut());
    await tester.pumpAndSettle();
    expect(c.read(ticketDraftProvider).photos, isEmpty);
    expect(c.read(ticketDraftProvider).title, '');
  });
}
