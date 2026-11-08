import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';

import '../support/app_harness.dart';

/// Links never switch servers on their own: a host the user has not confirmed
/// on the server screen is parked as the pending link (open-redirect guard).
void main() {
  const evil = 'https://evil.example.net';

  ProviderContainer containerFor(TestApp app) {
    final c = ProviderContainer(overrides: app.overrides);
    addTearDown(c.dispose);
    addTearDown(app.dispose);
    return c;
  }

  test('a link naming another server is not followed or connected', () async {
    final app = TestApp(); // signed out, testOrigin pending
    final c = containerFor(app);
    await c.read(accountProvider.future);

    for (final link in <AppLink>[
      const InviteLink(token: 'inv', origin: evil),
      const MagicLoginLink(token: 'magic', origin: evil),
      const JoinLink(code: 'CODE', origin: evil),
      const ServerLink(origin: evil),
    ]) {
      final location = await c.read(linkHandlerProvider).resolve(link);
      expect(location, '/server', reason: '$link');
      expect(c.read(pendingLinkProvider), link);
      expect(c.read(pendingServerProvider)?.origin, testOrigin);
    }
    expect(app.connector.inputs, isEmpty, reason: 'no request to the host');
  });

  test('a link for the confirmed server proceeds', () async {
    final app = TestApp();
    final c = containerFor(app);
    await c.read(accountProvider.future);
    final location = await c
        .read(linkHandlerProvider)
        .resolve(const InviteLink(token: 'a.b.c', origin: testOrigin));
    expect(location, '/invite/a.b.c', reason: 'dots survive');
    expect(app.connector.inputs, isEmpty);
  });

  test('once the user connected to the host the parked link resumes', () async {
    final app = TestApp();
    final c = containerFor(app);
    await c.read(accountProvider.future);
    const link = MagicLoginLink(token: 'm', origin: evil);
    final handler = c.read(linkHandlerProvider);
    expect(await handler.resolve(link), '/server');

    app.connector.result = Discovery(
      origin: evil,
      document: testDiscovery().document,
    );
    await handler.connect(evil); // what the Connect button does
    expect(await handler.resolve(link), '/magic/m');
  });
}
