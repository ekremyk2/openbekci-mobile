import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/providers.dart';

import '../support/app_harness.dart';

void main() {
  Future<void> seed(TestApp app, String instance) => app.db.writeEntry(
    instanceId: instance,
    key: 'me',
    payload: '{"pii":"other user"}',
    fetchedAt: DateTime.utc(2026),
  );

  test('sign-in discards cached rows left by an earlier session', () async {
    final app = TestApp();
    final c = ProviderContainer(overrides: app.overrides);
    addTearDown(c.dispose);
    addTearDown(app.dispose);
    await c.read(accountProvider.future);
    final server = testDiscovery();
    await seed(app, server.instanceId);
    await seed(app, 'some-other-instance');

    await c.read(sessionProvider).completeSignIn(server, testSignIn());

    expect(await app.db.readEntry(server.instanceId, 'me'), isNull);
    expect(await app.db.readEntry('some-other-instance', 'me'), isNull);
    expect(app.store.refreshToken, 'refresh-1');
    expect(c.read(tokenManagerProvider)!.currentAccessToken, 'access-1');
  });

  test('sign-out wipes secure storage, memory token and the cache', () async {
    final app = TestApp(signedIn: true);
    final c = ProviderContainer(overrides: app.overrides);
    addTearDown(c.dispose);
    addTearDown(app.dispose);
    final account = (await c.read(accountProvider.future))!;
    await seed(app, account.instanceId);
    final tokens = c.read(tokenManagerProvider)!;
    await tokens.setTokens(
      accessToken: 'a',
      accessExpiresAt: DateTime.utc(2099),
      refreshToken: 'r',
    );

    await c.read(sessionProvider).signOut();

    expect(app.store.account, isNull);
    expect(app.store.refreshToken, isNull);
    expect(tokens.currentAccessToken, isNull);
    expect(await app.db.readEntry(account.instanceId, 'me'), isNull);
    expect(c.read(accountProvider).value, isNull);
  });
}
