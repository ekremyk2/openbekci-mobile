import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/home/home_screen.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/gate_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/invite_join_screens.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/scan_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/server_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/sign_in_screens.dart';
import 'package:openbekci_mobile/features/profile/profile_screen.dart';

/// Routes. Signed-out flow: `/server` -> `/sign-in` -> a method; links land on
/// `/invite/:token`, `/join/:code` and `/magic/:token`.
abstract final class Routes {
  static const splash = '/splash';
  static const server = '/server';
  static const scan = '/scan';
  static const gate = '/gate';
  static const signIn = '/sign-in';
  static const home = '/';
  static const profile = '/profile';
  static const claim = '/claim';
}

/// Paths only reachable while signed out.
const _signedOutOnly = [
  '/server',
  '/scan',
  '/sign-in',
  '/magic',
  '/invite',
  '/gate',
];

/// Paths of the onboarding flow that need a connected server.
const _needServer = ['/sign-in', '/magic', '/invite', '/join', '/gate'];

/// Guards (mobile plan section 4): signed in? server chosen? version gate open?
String? redirectFor(Ref ref, String location) {
  final account = ref.read(accountProvider);
  if (account.isLoading) {
    return location == Routes.splash ? null : Routes.splash;
  }
  final signedIn = account.value != null;
  if (location == Routes.splash) {
    return signedIn ? Routes.home : Routes.server;
  }
  if (signedIn) {
    return _signedOutOnly.any(location.startsWith) ? Routes.home : null;
  }
  if (location == Routes.server || location == Routes.scan) return null;
  if (!_needServer.any(location.startsWith)) return Routes.server;
  if (ref.read(pendingServerProvider) == null) return Routes.server;
  final gate = ref.read(gateProvider);
  if (gate != null && gate is! GateOpen) {
    return location == Routes.gate ? null : Routes.gate;
  }
  if (location == Routes.gate) return Routes.signIn;
  return null;
}

/// Re-runs the redirect when the account, server or gate change.
class _RouterRefresh extends ChangeNotifier {
  new(Ref ref) {
    ref
      ..listen(accountProvider, (_, _) => notifyListeners())
      ..listen(pendingServerProvider, (_, _) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh(ref);
  ref.onDispose(refresh.dispose);
  final router = GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: refresh,
    redirect: (context, state) => redirectFor(ref, state.matchedLocation),
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (_, _) =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      GoRoute(path: Routes.server, builder: (_, _) => const ServerScreen()),
      GoRoute(path: Routes.scan, builder: (_, _) => const ScanScreen()),
      GoRoute(path: Routes.gate, builder: (_, _) => const GateScreen()),
      GoRoute(
        path: Routes.signIn,
        builder: (_, _) => const SignInScreen(),
        routes: [
          GoRoute(path: 'sms', builder: (_, _) => const SmsSignInScreen()),
          GoRoute(
            path: 'password',
            builder: (_, _) => const PasswordSignInScreen(),
          ),
          GoRoute(
            path: 'magic',
            builder: (_, _) => const MagicLinkRequestScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/magic/:token',
        builder: (_, state) =>
            MagicLinkConsumeScreen(token: state.pathParameters['token']!),
      ),
      GoRoute(
        path: '/invite/:token',
        builder: (_, state) =>
            InviteScreen(token: state.pathParameters['token']!),
      ),
      GoRoute(
        path: '/join/:code',
        builder: (_, state) => JoinScreen(code: state.pathParameters['code']!),
      ),
      GoRoute(path: Routes.claim, builder: (_, _) => const ClaimStatusScreen()),
      GoRoute(path: Routes.home, builder: (_, _) => const HomeScreen()),
      GoRoute(path: Routes.profile, builder: (_, _) => const ProfileScreen()),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
