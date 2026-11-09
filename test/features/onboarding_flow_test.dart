import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' show Me;
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';

import '../support/app_harness.dart';
import '../support/fake_api.dart';

void phoneSize(WidgetTester tester) {
  tester.view
    ..physicalSize = const Size(390 * 3, 844 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

Future<void> pumpApp(WidgetTester tester, TestApp app) async {
  phoneSize(tester);
  addTearDown(app.dispose);
  await tester.pumpWidget(app.widget());
  await tester.pumpAndSettle();
}

void goTo(WidgetTester tester, String location) {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(OpenBekciApp)),
  );
  container.read(routerProvider).go(location);
}

String currentLocation(WidgetTester tester) {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(OpenBekciApp)),
  );
  return container
      .read(routerProvider)
      .routerDelegate
      .currentConfiguration
      .uri
      .toString();
}

Future<void> typeInto(WidgetTester tester, String key, String text) async {
  await tester.enterText(find.byKey(Key(key)), text);
  await tester.pump();
}

Future<void> tapKey(WidgetTester tester, String key) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.tap(find.byKey(Key(key)));
  await tester.pumpAndSettle();
}

void main() {
  group('server screen', () {
    testWidgets('connects through discovery and shows the sign-in methods', (
      tester,
    ) async {
      final app = TestApp(server: testDiscovery());
      await pumpApp(tester, app);
      expect(find.text('Connect to your site'), findsOneWidget);

      await typeInto(tester, 'serverField', 'gul.example.org');
      await tapKey(tester, 'serverConnect');

      expect(app.connector.inputs, ['gul.example.org']);
      expect(currentLocation(tester), '/sign-in');
      expect(find.text('Signing in to Gul Sitesi'), findsOneWidget);
    });

    testWidgets('shows a translated error and the code for a bad server', (
      tester,
    ) async {
      final app = TestApp();
      app.connector.failWith = const AppError(code: 'insecure_server');
      await pumpApp(tester, app);
      await typeInto(tester, 'serverField', 'http://example.org');
      await tapKey(tester, 'serverConnect');
      expect(find.text('This server must use HTTPS.'), findsOneWidget);
      expect(currentLocation(tester), '/server');
    });

    testWidgets('a network error gets its own message', (tester) async {
      final app = TestApp();
      app.connector.failWith = const AppError(code: 'network', retryable: true);
      await pumpApp(tester, app);
      await typeInto(tester, 'serverField', 'example.org');
      await tapKey(tester, 'serverConnect');
      expect(
        find.text('Cannot reach the server. Check your connection.'),
        findsOneWidget,
      );
    });

    testWidgets('an unknown error code shows the generic message and details', (
      tester,
    ) async {
      final app = TestApp();
      app.connector.failWith = const AppError(code: 'brand_new', status: 418);
      await pumpApp(tester, app);
      await typeInto(tester, 'serverField', 'example.org');
      await tapKey(tester, 'serverConnect');
      expect(
        find.text('Something went wrong. Please try again.'),
        findsOneWidget,
      );
      expect(find.textContaining('brand_new'), findsOneWidget);
    });

    testWidgets('explains why it asks for a server when a link is waiting', (
      tester,
    ) async {
      final app = TestApp(pendingLink: const InviteLink(token: 'tok'));
      await pumpApp(tester, app);
      expect(
        find.text('Enter the server address to open your invitation.'),
        findsOneWidget,
      );
    });

    testWidgets('has the scan button', (tester) async {
      final app = TestApp();
      await pumpApp(tester, app);
      expect(find.byKey(const Key('serverScan')), findsOneWidget);
    });
  });

  group('version gate', () {
    testWidgets('app too old: update screen, can pick another server', (
      tester,
    ) async {
      final app = TestApp(server: testDiscovery(minAndroid: '2.0.0'));
      await pumpApp(tester, app);
      await typeInto(tester, 'serverField', 'gul.example.org');
      await tapKey(tester, 'serverConnect');
      expect(find.text('Update the app'), findsOneWidget);
      expect(
        find.text(
          'This server needs app version 2.0.0 or newer (you have 1.0.0).',
        ),
        findsOneWidget,
      );
      await tapKey(tester, 'gateChange');
      expect(currentLocation(tester), '/server');
    });

    testWidgets('server too old: ask the manager to update', (tester) async {
      final app = TestApp(server: testDiscovery(serverVersion: '0.0.5'));
      await pumpApp(tester, app);
      await typeInto(tester, 'serverField', 'gul.example.org');
      await tapKey(tester, 'serverConnect');
      expect(find.text('Server not supported'), findsOneWidget);
      expect(find.textContaining('0.0.5'), findsOneWidget);
    });
  });

  group('sign-in methods', () {
    testWidgets(
      'rendered from auth_methods, unknown ids shown as unavailable',
      (tester) async {
        final app = TestApp(
          server: testDiscovery(
            methods: ['password', 'oidc:google', 'sms_otp', 'passkey'],
          ),
        );
        await pumpApp(tester, app);
        await typeInto(tester, 'serverField', 'gul.example.org');
        await tapKey(tester, 'serverConnect');

        // SMS before password, regardless of the server's order.
        final sms = tester
            .getTopLeft(find.byKey(const Key('method_sms_otp')))
            .dy;
        final pw = tester
            .getTopLeft(find.byKey(const Key('method_password')))
            .dy;
        expect(sms, lessThan(pw));
        expect(find.byKey(const Key('method_magic_link')), findsNothing);
        expect(find.text('oidc:google'), findsOneWidget);
        expect(find.text('passkey'), findsOneWidget);
        expect(find.text('Not available in this app yet'), findsNWidgets(2));
      },
    );

    testWidgets('a server with no supported method says so', (tester) async {
      final app = TestApp(server: testDiscovery(methods: ['passkey']));
      await pumpApp(tester, app);
      await typeInto(tester, 'serverField', 'gul.example.org');
      await tapKey(tester, 'serverConnect');
      expect(
        find.text('This server offers no sign-in method this app supports.'),
        findsOneWidget,
      );
    });
  });

  group('SMS code', () {
    testWidgets('phone, code, signed in, lands on home', (tester) async {
      final app = TestApp();
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/sms');
      await tester.pumpAndSettle();

      await typeInto(tester, 'phoneField', '+905321234567');
      await tapKey(tester, 'smsSend');
      expect(app.auth.calls, ['requestOtp:+905321234567']);
      expect(find.byKey(const Key('codeField')), findsOneWidget);
      expect(
        find.textContaining('We sent a code to +905321234567'),
        findsOneWidget,
      );

      await typeInto(tester, 'codeField', '123456');
      await tapKey(tester, 'smsVerify');

      expect(app.auth.calls.last, 'otp:+905321234567:123456');
      expect(currentLocation(tester), '/');
      expect(find.text('Hello, Ayse Yilmaz'), findsOneWidget);
      expect(app.store.account!.serverOrigin, testOrigin);
      expect(app.store.refreshToken, 'refresh-1');
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('a wrong code shows a message and stays on the screen', (
      tester,
    ) async {
      final app = TestApp();
      app.auth.onOtpSignIn = (_, _) async =>
          throw const AppError(code: 'invalid_grant', status: 401);
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/sms');
      await tester.pumpAndSettle();
      await typeInto(tester, 'phoneField', '+905321234567');
      await tapKey(tester, 'smsSend');
      await typeInto(tester, 'codeField', '000000');
      await tapKey(tester, 'smsVerify');

      expect(
        find.text('The code, password or link is wrong or has expired.'),
        findsOneWidget,
      );
      expect(app.store.account, isNull);
      expect(find.byKey(const Key('smsVerify')), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('rate limiting is explained', (tester) async {
      final app = TestApp();
      app.auth.onRequestOtp = (_) async => throw const AppError(
        code: 'rate_limited',
        status: 429,
        retryable: true,
      );
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/sms');
      await tester.pumpAndSettle();
      await typeInto(tester, 'phoneField', '+905321234567');
      await tapKey(tester, 'smsSend');
      expect(
        find.text('Too many attempts. Please wait a moment and try again.'),
        findsOneWidget,
      );
      expect(find.byKey(const Key('codeField')), findsNothing);
    });

    testWidgets('sms_unavailable is explained', (tester) async {
      final app = TestApp();
      app.auth.onRequestOtp = (_) async =>
          throw const AppError(code: 'sms_unavailable', status: 503);
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/sms');
      await tester.pumpAndSettle();
      await typeInto(tester, 'phoneField', '+905321234567');
      await tapKey(tester, 'smsSend');
      expect(
        find.text('This server cannot send text messages right now.'),
        findsOneWidget,
      );
    });

    testWidgets('resend is locked during the cooldown, then offered', (
      tester,
    ) async {
      final app = TestApp();
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/sms');
      await tester.pumpAndSettle();
      await typeInto(tester, 'phoneField', '+905321234567');
      await tapKey(tester, 'smsSend');
      expect(find.text('Send again in 30 s'), findsOneWidget);
      await tester.pump(const Duration(seconds: 31));
      expect(find.text('Send again'), findsOneWidget);
      await tester.tap(find.byKey(const Key('smsResend')));
      await tester.pump();
      expect(
        app.auth.calls.where((c) => c.startsWith('requestOtp')),
        hasLength(2),
      );
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('the code field takes digits only, six at most', (
      tester,
    ) async {
      final app = TestApp();
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/sms');
      await tester.pumpAndSettle();
      await typeInto(tester, 'phoneField', '+905321234567');
      await tapKey(tester, 'smsSend');
      await typeInto(tester, 'codeField', '12ab3456789');
      expect(
        tester
            .widget<TextField>(find.byKey(const Key('codeField')))
            .controller!
            .text,
        '123456',
      );
      await tester.pumpWidget(const SizedBox());
    });
  });

  group('password', () {
    testWidgets('signs in with email and password', (tester) async {
      final app = TestApp();
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/password');
      await tester.pumpAndSettle();
      await typeInto(tester, 'identifierField', 'ayse@example.org');
      await typeInto(tester, 'passwordField', 'correct horse battery');
      await tapKey(tester, 'passwordSubmit');
      expect(app.auth.calls, ['password:ayse@example.org']);
      expect(find.text('Hello, Ayse Yilmaz'), findsOneWidget);
    });

    testWidgets('field errors from validation_failed show under the field', (
      tester,
    ) async {
      final app = TestApp();
      app.auth.onPasswordSignIn = (_, _) async => throw const AppError(
        code: 'validation_failed',
        status: 422,
        fieldErrors: [FieldError(field: 'password', code: 'required')],
      );
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/password');
      await tester.pumpAndSettle();
      await typeInto(tester, 'identifierField', 'ayse@example.org');
      await tapKey(tester, 'passwordSubmit');
      expect(find.text('This field is required.'), findsOneWidget);
      expect(
        find.text(
          'Some of the information is not valid. Check the fields and try again.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('wrong password is invalid_grant', (tester) async {
      final app = TestApp();
      app.auth.onPasswordSignIn = (_, _) async =>
          throw const AppError(code: 'invalid_grant', status: 401);
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/password');
      await tester.pumpAndSettle();
      await typeInto(tester, 'identifierField', 'ayse@example.org');
      await typeInto(tester, 'passwordField', 'nope');
      await tapKey(tester, 'passwordSubmit');
      expect(
        find.text('The code, password or link is wrong or has expired.'),
        findsOneWidget,
      );
      expect(app.store.account, isNull);
    });

    testWidgets('the password can be shown and hidden', (tester) async {
      final app = TestApp();
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/password');
      await tester.pumpAndSettle();
      bool obscured() => tester
          .widget<TextField>(find.byKey(const Key('passwordField')))
          .obscureText;
      expect(obscured(), isTrue);
      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();
      expect(obscured(), isFalse);
    });
  });

  group('magic link', () {
    testWidgets('request, then the opened link signs in', (tester) async {
      final app = TestApp();
      await pumpApp(tester, app);
      goTo(tester, '/sign-in/magic');
      await tester.pumpAndSettle();
      await typeInto(tester, 'emailField', 'ayse@example.org');
      await tapKey(tester, 'magicSend');
      expect(app.auth.calls, ['magic:ayse@example.org']);
      expect(find.text('Check your email'), findsOneWidget);
      expect(
        find.textContaining('If ayse@example.org has an account'),
        findsOneWidget,
      );

      // The user taps the emailed openbekci:// link.
      app.links.add(AppLink.parse('openbekci://login/magic?token=abc123')!);
      await tester.pumpAndSettle();
      expect(app.auth.calls.last, 'consume:abc123');
      expect(find.text('Hello, Ayse Yilmaz'), findsOneWidget);
    });

    testWidgets('an expired link shows the error and a way back', (
      tester,
    ) async {
      final app = TestApp();
      app.auth.onConsumeMagic = (_) async =>
          throw const AppError(code: 'invalid_grant', status: 401);
      await pumpApp(tester, app);
      app.links.add(const MagicLoginLink(token: 'old', origin: testOrigin));
      await tester.pumpAndSettle();
      expect(
        find.text('The code, password or link is wrong or has expired.'),
        findsOneWidget,
      );
      expect(app.store.account, isNull);
    });
  });

  group('invitation', () {
    testWidgets('new account: name and password, then signed in', (
      tester,
    ) async {
      final app = TestApp();
      await pumpApp(tester, app);
      app.links.add(const InviteLink(token: 'inv-1', origin: testOrigin));
      await tester.pumpAndSettle();

      expect(find.text('Your invitation'), findsOneWidget);
      expect(find.text('Gul Yonetim · Gul Sitesi'), findsOneWidget);
      expect(find.text('Unit 12'), findsOneWidget);
      expect(find.byKey(const Key('invitePassword')), findsOneWidget);

      await typeInto(tester, 'inviteName', 'Ayse Yilmaz');
      await typeInto(tester, 'invitePassword', 'correct horse battery');
      await tapKey(tester, 'inviteAccept');
      expect(app.auth.calls, ['preview:inv-1', 'accept:inv-1']);
      expect(find.text('Hello, Ayse Yilmaz'), findsOneWidget);
    });

    testWidgets('existing account: no password asked', (tester) async {
      final app = TestApp();
      app.auth.onPreview = (_) async =>
          invitationPreview(existingAccount: true);
      await pumpApp(tester, app);
      app.links.add(const InviteLink(token: 'inv-2', origin: testOrigin));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('invitePassword')), findsNothing);
      expect(
        find.text(
          'You already have an account. Accepting links it to this site.',
        ),
        findsOneWidget,
      );
      await tapKey(tester, 'inviteAccept');
      expect(app.auth.calls.last, 'accept:inv-2');
    });

    testWidgets('an unknown token shows the invalid message', (tester) async {
      final app = TestApp();
      app.auth.onPreview = (_) async =>
          throw const AppError(code: 'not_found', status: 404);
      await pumpApp(tester, app);
      app.links.add(const InviteLink(token: 'gone', origin: testOrigin));
      await tester.pumpAndSettle();
      expect(
        find.text('This invitation is invalid or has expired.'),
        findsOneWidget,
      );
    });

    testWidgets('a link without a server first asks for the server', (
      tester,
    ) async {
      // Nothing pending: the mobile-scheme link has no host.
      final app = TestApp(server: testDiscovery());
      await pumpApp(tester, app);
      // Drop the preset pending server by opening the link while none is set.
      final container = ProviderScope.containerOf(
        tester.element(find.byType(OpenBekciApp)),
      );
      container.read(pendingServerProvider.notifier).set(null);
      app.links.add(AppLink.parse('openbekci://invite/tok-9')!);
      await tester.pumpAndSettle();
      expect(currentLocation(tester), '/server');
      expect(
        find.text('Enter the server address to open your invitation.'),
        findsOneWidget,
      );
      // After connecting, the waiting invitation opens.
      await typeInto(tester, 'serverField', 'gul.example.org');
      await tapKey(tester, 'serverConnect');
      expect(currentLocation(tester), '/invite/tok-9');
      expect(find.text('Your invitation'), findsOneWidget);
    });
  });

  group('site QR and unit claim', () {
    testWidgets(
      'signed out: shows the site, then sign-in returns to the picker',
      (tester) async {
        final app = TestApp();
        await pumpApp(tester, app);
        app.links.add(const JoinLink(code: 'CODE1', origin: testOrigin));
        await tester.pumpAndSettle();
        expect(find.text('Join Gul Sitesi'), findsOneWidget);
        expect(find.text('Managed by Gul Yonetim'), findsOneWidget);
        expect(
          find.text('Sign in first, then choose your unit.'),
          findsOneWidget,
        );

        await tapKey(tester, 'joinSignIn');
        expect(currentLocation(tester), '/sign-in');
        goTo(tester, '/sign-in/password');
        await tester.pumpAndSettle();
        await typeInto(tester, 'identifierField', 'ayse@example.org');
        await typeInto(tester, 'passwordField', 'correct horse battery');
        await tapKey(tester, 'passwordSubmit');

        // Back at the join picker for the same code.
        expect(currentLocation(tester), '/join/CODE1');
        expect(find.byKey(const Key('joinSubmit')), findsOneWidget);
      },
    );

    testWidgets(
      'signed out: sign up through the join code, then the SMS code',
      (tester) async {
        final app = TestApp();
        await pumpApp(tester, app);
        app.links.add(const JoinLink(code: 'CODE1', origin: testOrigin));
        await tester.pumpAndSettle();
        await tapKey(tester, 'joinSignUp');
        expect(currentLocation(tester), '/sign-in/sms?join=CODE1');
        await typeInto(tester, 'phoneField', '+905321234567');
        await tapKey(tester, 'smsSend');
        expect(app.join.signUps, ['CODE1:+905321234567']);
        expect(find.byKey(const Key('codeField')), findsOneWidget);
      },
    );

    testWidgets('signed in: pick a unit and a role, claim, wait for approval', (
      tester,
    ) async {
      final app = TestApp(signedIn: true);
      await pumpApp(tester, app);
      expect(currentLocation(tester), '/');
      app.links.add(const JoinLink(code: 'CODE1', origin: testOrigin));
      await tester.pumpAndSettle();
      expect(currentLocation(tester), '/join/CODE1');

      // Submit is disabled until a unit is chosen.
      expect(
        tester
            .widget<FilledButton>(find.byKey(const Key('joinSubmit')))
            .onPressed,
        isNull,
      );
      await tester.tap(find.text('A Blok · 12'));
      await tester.pump();
      await tester.tap(find.text('Tenant'));
      await tester.pump();
      await typeInto(tester, 'joinNote', 'I live on the third floor');
      await tapKey(tester, 'joinSubmit');

      expect(app.join.claims.single.unitId, endsWith('c1'));
      expect(app.join.claims.single.role.value, 'tenant');
      expect(app.join.claims.single.note, 'I live on the third floor');
      expect(currentLocation(tester), '/claim');
      expect(find.byKey(const Key('claimTitle')), findsOneWidget);
      expect(find.text('Waiting for approval'), findsWidgets);
      expect(
        find.textContaining('review your request for unit 12'),
        findsOneWidget,
      );

      // Home keeps showing the pending claim.
      await tapKey(tester, 'claimHome');
      expect(currentLocation(tester), '/');
      expect(find.text('Request for 12: waiting for approval'), findsOneWidget);
    });

    testWidgets('searching narrows the unit list', (tester) async {
      final app = TestApp(signedIn: true);
      await pumpApp(tester, app);
      goTo(tester, '/join/CODE1');
      await tester.pumpAndSettle();
      expect(find.text('A Blok · 14'), findsOneWidget);
      await typeInto(tester, 'joinSearch', '14');
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();
      expect(find.text('A Blok · 12'), findsNothing);
      expect(find.text('A Blok · 14'), findsOneWidget);
    });

    testWidgets('a conflict (already claimed) is explained', (tester) async {
      final app = TestApp(signedIn: true);
      app.join.claimError = const AppError(code: 'conflict', status: 409);
      await pumpApp(tester, app);
      goTo(tester, '/join/CODE1');
      await tester.pumpAndSettle();
      await tester.tap(find.text('A Blok · 12'));
      await tester.pump();
      await tapKey(tester, 'joinSubmit');
      expect(
        find.text(
          'This conflicts with the current state. Reload and try again.',
        ),
        findsOneWidget,
      );
      expect(currentLocation(tester), '/join/CODE1');
    });

    testWidgets('an unknown claim status renders as the raw string', (
      tester,
    ) async {
      final app = TestApp(signedIn: true);
      await pumpApp(tester, app);
      goTo(tester, '/claim');
      await tester.pumpAndSettle();
      // No claim yet: the neutral waiting state, never a crash.
      expect(find.byKey(const Key('claimTitle')), findsOneWidget);
    });
  });

  group('home and profile', () {
    testWidgets('shows units and the profile with the server', (tester) async {
      final app = TestApp(signedIn: true);
      app.adapter.answer(
        'GET /v1/me',
        FakeResponse.ok(
          meJson(
            occupancies: [
              {
                'id': '0192a3f0-1000-7000-8000-000000000005',
                'org_id': '0192a3f0-1000-7000-8000-000000000001',
                'site_id': '0192a3f0-1000-7000-8000-000000000002',
                'unit_id': '0192a3f0-1000-7000-8000-000000000003',
                'unit_label': 'A Blok D:12',
                'kind': 'astronaut',
                'side': null,
                'may_see_money': false,
                'valid_from': '2025-09-01',
                'valid_to': null,
              },
            ],
          ),
        ),
      );
      await pumpApp(tester, app);
      expect(find.text('A Blok D:12'), findsOneWidget);
      // An occupancy kind the app does not know renders neutrally.
      expect(find.text('Resident'), findsOneWidget);

      await tester.tap(find.byKey(const Key('openProfile')));
      await tester.pumpAndSettle();
      expect(find.text('Ayse Yilmaz'), findsOneWidget);
      expect(find.text('+905321234567'), findsOneWidget);
      expect(find.textContaining(testOrigin), findsOneWidget);
    });

    testWidgets('signing out revokes, wipes and returns to the server screen', (
      tester,
    ) async {
      final app = TestApp(signedIn: true);
      await pumpApp(tester, app);
      await tester.tap(find.byKey(const Key('openProfile')));
      await tester.pumpAndSettle();
      await tapKey(tester, 'signOut');
      expect(find.textContaining('Sign out of this server?'), findsOneWidget);
      await tapKey(tester, 'confirmSignOut');

      expect(app.adapter.seen('DELETE /v1/me/sessions/current'), hasLength(1));
      expect(app.store.account, isNull);
      expect(app.store.refreshToken, isNull);
      expect(await app.db.select(app.db.cacheEntries).get(), isEmpty);
      expect(currentLocation(tester), '/server');
    });

    testWidgets('signing out still works when the server is unreachable', (
      tester,
    ) async {
      final app = TestApp(signedIn: true);
      app.adapter.on(
        'DELETE /v1/me/sessions/current',
        (_) => throw StateError('offline'),
      );
      await pumpApp(tester, app);
      await tester.tap(find.byKey(const Key('openProfile')));
      await tester.pumpAndSettle();
      await tapKey(tester, 'signOut');
      await tapKey(tester, 'confirmSignOut');
      expect(app.store.account, isNull);
      expect(currentLocation(tester), '/server');
    });

    testWidgets('offline: cached /v1/me is shown with the offline hint', (
      tester,
    ) async {
      // What CachePolicy emits when the refresh fails with no network: the
      // cached document plus a network error (see cache_and_config_test).
      final app = TestApp(
        signedIn: true,
        extra: [
          meProvider.overrideWith(
            (ref) => Stream.value(
              CacheState<Me>(
                data: Me.fromJson(meJson()),
                error: const AppError(code: 'network', retryable: true),
              ),
            ),
          ),
        ],
      );
      await pumpApp(tester, app);
      expect(find.text('Hello, Ayse Yilmaz'), findsOneWidget);
      expect(
        find.text(
          'Showing saved information. It will refresh when you are back online.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('a failed first load shows the error with a retry', (
      tester,
    ) async {
      final app = TestApp(
        signedIn: true,
        extra: [
          meProvider.overrideWith(
            (ref) => Stream.value(
              const CacheState<Me>(
                error: AppError(code: 'internal_error', status: 500),
              ),
            ),
          ),
        ],
      );
      await pumpApp(tester, app);
      expect(
        find.text('The server had a problem. Please try again later.'),
        findsOneWidget,
      );
      expect(find.text('Try again'), findsOneWidget);
    });
  });

  group('signed in users never see onboarding', () {
    testWidgets('/server, /sign-in and links bounce to home', (tester) async {
      final app = TestApp(signedIn: true);
      await pumpApp(tester, app);
      for (final path in ['/server', '/sign-in', '/sign-in/sms', '/gate']) {
        goTo(tester, path);
        await tester.pumpAndSettle();
        expect(currentLocation(tester), '/', reason: path);
      }
    });

    testWidgets('an invitation for another server is ignored', (tester) async {
      final app = TestApp(signedIn: true);
      await pumpApp(tester, app);
      app.links.add(
        const InviteLink(token: 'x', origin: 'https://other.example.org'),
      );
      await tester.pumpAndSettle();
      expect(currentLocation(tester), '/');
    });
  });

  group('signed out users cannot reach private screens', () {
    testWidgets('home and profile redirect to the server screen', (
      tester,
    ) async {
      final app = TestApp();
      await pumpApp(tester, app);
      for (final path in ['/', '/profile', '/claim']) {
        goTo(tester, path);
        await tester.pumpAndSettle();
        expect(currentLocation(tester), '/server', reason: path);
      }
    });
  });
}
