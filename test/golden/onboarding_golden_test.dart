import 'package:flutter/material.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/gate_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/invite_join_screens.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/server_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/sign_in_screens.dart';

import '../support/app_harness.dart';
import '../support/golden_support.dart';

/// Golden suite of the onboarding screens: light, dark, Turkish and an RTL
/// run in a pseudo `ar` locale (mobile plan sections 11 and 14). Update with
/// `flutter test --update-goldens test/golden` and review the images; CI never
/// updates them.
void main() {
  List<Override> base({
    bool signedIn = false,
    Discovery? server,
    List<Override> more = const [],
  }) {
    final store = MemoryAccountStore();
    if (signedIn) {
      store.account = const Account(
        serverOrigin: testOrigin,
        instanceId: '0192a3f0-1000-7000-8000-000000000999',
        instanceName: 'Gul Sitesi',
        userId: '0192a3f0-1000-7000-8000-0000000000aa',
      );
    }
    return [
      appConfigProvider.overrideWithValue(testConfig()),
      appInfoProvider.overrideWithValue(
        const AppInfo(version: '1.0.0', build: '1'),
      ),
      accountStoreProvider.overrideWithValue(store),
      pendingServerProvider.overrideWith(
        () => PreSetServer(signedIn ? null : (server ?? testDiscovery())),
      ),
      ...more,
    ];
  }

  testWidgets('server screen', (tester) async {
    await expectGolden(
      tester,
      'server_screen',
      screen: ServerScreen.new,
      overrides: (_) => base(),
    );
  });

  testWidgets('server screen with an error', (tester) async {
    await expectGolden(
      tester,
      'server_screen_error',
      screen: ServerScreen.new,
      overrides: (_) => base(
        more: [
          serverConnectorProvider.overrideWithValue(
            FakeServerConnector()..failWith = const AppError(code: 'network'),
          ),
        ],
      ),
      interact: (tester) async {
        final fields = find.byKey(const Key('serverField'));
        final buttons = find.byKey(const Key('serverConnect'));
        for (var i = 0; i < fields.evaluate().length; i++) {
          await tester.enterText(fields.at(i), 'gul.example.org');
          await tester.tap(buttons.at(i));
          await tester.pumpAndSettle();
        }
      },
    );
  });

  testWidgets('sign-in methods', (tester) async {
    await expectGolden(
      tester,
      'sign_in_methods',
      screen: SignInScreen.new,
      overrides: (_) => base(
        server: testDiscovery(
          methods: ['password', 'oidc:google', 'sms_otp', 'magic_link'],
        ),
      ),
    );
  });

  testWidgets('sign-in methods at 200 percent text', (tester) async {
    await expectGolden(
      tester,
      'sign_in_methods_large_text',
      screen: SignInScreen.new,
      textScale: 2,
      variants: const [lightEn, rtlAr],
      overrides: (_) => base(),
    );
  });

  testWidgets('SMS: phone', (tester) async {
    await expectGolden(
      tester,
      'sms_phone',
      screen: SmsSignInScreen.new,
      overrides: (_) => base(more: [_auth()]),
    );
  });

  testWidgets('SMS: code', (tester) async {
    await expectGolden(
      tester,
      'sms_code',
      screen: SmsSignInScreen.new,
      overrides: (_) => base(more: [_auth()]),
      interact: (tester) async {
        final phone = find.byKey(const Key('phoneField'));
        final send = find.byKey(const Key('smsSend'));
        final count = phone.evaluate().length;
        for (var i = 0; i < count; i++) {
          await tester.enterText(phone.at(i), '+905321234567');
          await tester.tap(send.first);
          await tester.pumpAndSettle();
        }
      },
    );
  });

  testWidgets('password', (tester) async {
    await expectGolden(
      tester,
      'password',
      screen: PasswordSignInScreen.new,
      overrides: (_) => base(more: [_auth()]),
    );
  });

  testWidgets('password at 200 percent text', (tester) async {
    await expectGolden(
      tester,
      'password_large_text',
      screen: PasswordSignInScreen.new,
      textScale: 2,
      variants: const [lightEn, rtlAr],
      overrides: (_) => base(more: [_auth()]),
    );
  });

  testWidgets('magic link request', (tester) async {
    await expectGolden(
      tester,
      'magic_link',
      screen: MagicLinkRequestScreen.new,
      overrides: (_) => base(more: [_auth()]),
    );
  });

  testWidgets('invitation (new account)', (tester) async {
    await expectGolden(
      tester,
      'invitation',
      screen: () => const InviteScreen(token: 'tok'),
      overrides: (_) => base(more: [_auth()]),
    );
  });

  testWidgets('invitation (existing account)', (tester) async {
    await expectGolden(
      tester,
      'invitation_existing',
      screen: () => const InviteScreen(token: 'tok'),
      overrides: (_) => base(
        more: [
          _auth(
            (a) =>
                a.onPreview = (_) async =>
                    invitationPreview(existingAccount: true),
          ),
        ],
      ),
    );
  });

  testWidgets('site QR: signed out', (tester) async {
    await expectGolden(
      tester,
      'join_signed_out',
      screen: () => const JoinScreen(code: 'CODE1'),
      overrides: (_) => base(
        more: [joinRepositoryProvider.overrideWithValue(FakeJoinRepository())],
      ),
    );
  });

  testWidgets('site QR: unit picker', (tester) async {
    await expectGolden(
      tester,
      'join_picker',
      screen: () => const JoinScreen(code: 'CODE1'),
      overrides: (_) => base(
        signedIn: true,
        more: [joinRepositoryProvider.overrideWithValue(FakeJoinRepository())],
      ),
      interact: (tester) async {
        final tiles = find.text('A Blok · 12');
        for (var i = 0; i < tiles.evaluate().length; i++) {
          await tester.tap(tiles.at(i));
          await tester.pump();
        }
      },
    );
  });

  testWidgets('claim: waiting for approval', (tester) async {
    final claim = UnitClaim.fromJson({
      'id': '0192a3f0-1000-7000-8000-0000000000d1',
      'org_id': '0192a3f0-1000-7000-8000-000000000001',
      'user_id': '0192a3f0-1000-7000-8000-0000000000aa',
      'display_name': 'Ayse Yilmaz',
      'unit_id': '0192a3f0-1000-7000-8000-0000000000c1',
      'unit_door_number': '12',
      'claimed_role': 'owner',
      'status': 'pending',
      'decided_by': null,
      'decided_at': null,
      'decision_note': null,
      'note': null,
      'created_at': '2026-11-08T10:00:00Z',
      'updated_at': '2026-11-08T10:00:00Z',
    });
    await expectGolden(
      tester,
      'claim_waiting',
      screen: () => const ClaimStatusScreen(),
      overrides: (_) => base(
        signedIn: true,
        more: [lastClaimProvider.overrideWith(() => _PreClaim(claim))],
      ),
    );
  });

  testWidgets('version gate: app too old', (tester) async {
    await expectGolden(
      tester,
      'gate_app_too_old',
      screen: () => const GateScreen(),
      overrides: (_) => base(server: testDiscovery(minAndroid: '2.0.0')),
    );
  });

  testWidgets('shared states, money and dates', (tester) async {
    await expectGolden(
      tester,
      'shared_states',
      screen: () => const _StatesShowcase(),
      overrides: (_) => base(),
    );
  });
}

class _PreClaim extends LastClaimController {
  new(this.claim);
  final UnitClaim claim;
  @override
  UnitClaim? build() => claim;
}

Override _auth([void Function(FakeAuthRepository a)? configure]) {
  final repo = FakeAuthRepository();
  configure?.call(repo);
  return authRepositoryProvider.overrideWithValue(repo);
}

class _StatesShowcase extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('States')),
      body: ListView(
        children: const [
          OfflineBanner(),
          SizedBox(
            height: 220,
            child: EmptyState(message: 'No announcements.'),
          ),
          SizedBox(
            height: 380,
            child: ErrorState(
              error: AppError(code: 'network', retryable: true),
            ),
          ),
          SkeletonList(rows: 2),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MoneyText(amountMinor: 123450, currency: 'TRY'),
                MoneyText(amountMinor: -5000, currency: 'TRY'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
