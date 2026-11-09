import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/announcements/presentation/announcements_screens.dart';
import 'package:openbekci_mobile/features/community/presentation/bookings_screens.dart';
import 'package:openbekci_mobile/features/community/presentation/parcels_screen.dart';
import 'package:openbekci_mobile/features/community/presentation/visitors_screens.dart';
import 'package:openbekci_mobile/features/documents/presentation/documents_screens.dart';
import 'package:openbekci_mobile/features/governance/presentation/governance_screens.dart';
import 'package:openbekci_mobile/features/home/home_screen.dart';
import 'package:openbekci_mobile/features/money/presentation/checkout_screens.dart';
import 'package:openbekci_mobile/features/money/presentation/money_screen.dart';
import 'package:openbekci_mobile/features/money/presentation/pay_screens.dart';
import 'package:openbekci_mobile/features/notifications/presentation/notifications_screens.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/gate_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/invite_join_screens.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/scan_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/server_screen.dart';
import 'package:openbekci_mobile/features/onboarding/presentation/sign_in_screens.dart';
import 'package:openbekci_mobile/features/profile/profile_screen.dart';
import 'package:openbekci_mobile/features/shell/presentation/app_shell.dart';
import 'package:openbekci_mobile/features/tickets/presentation/tickets_screens.dart';

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

/// Detail and form screens open over the tabs (no bottom navigation).
final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh(ref);
  ref.onDispose(refresh.dispose);
  final router = GoRouter(
    navigatorKey: _rootKey,
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
          GoRoute(
            path: 'sms',
            builder: (_, state) =>
                SmsSignInScreen(joinCode: state.uri.queryParameters['join']),
          ),
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
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.home, builder: (_, _) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/money',
                builder: (_, state) =>
                    MoneyScreen(initialSide: state.uri.queryParameters['side']),
                routes: [
                  GoRoute(
                    path: 'pay',
                    parentNavigatorKey: _rootKey,
                    builder: (_, state) => PayScreen(
                      sideId: state.uri.queryParameters['side'] ?? '',
                    ),
                  ),
                  GoRoute(
                    path: 'card',
                    parentNavigatorKey: _rootKey,
                    builder: (_, state) => CheckoutScreen(
                      sideId: state.uri.queryParameters['side'] ?? '',
                    ),
                  ),
                  GoRoute(
                    path: 'checkout/:id',
                    parentNavigatorKey: _rootKey,
                    builder: (_, state) => CheckoutStatusScreen(
                      checkoutId: state.pathParameters['id']!,
                      orgId: state.uri.queryParameters['org'],
                    ),
                  ),
                  GoRoute(
                    path: 'checkouts',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const MyCheckoutsScreen(),
                  ),
                  GoRoute(
                    path: 'payments',
                    parentNavigatorKey: _rootKey,
                    builder: (_, state) => PaymentsScreen(
                      sideId: state.uri.queryParameters['side'] ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tickets',
                builder: (_, _) => const TicketsScreen(),
                routes: [
                  GoRoute(
                    path: 'new',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const NewTicketScreen(),
                  ),
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: _rootKey,
                    builder: (_, state) => TicketDetailScreen(
                      ticketId: state.pathParameters['id']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                builder: (_, _) => const MoreScreen(),
                routes: [
                  GoRoute(
                    path: 'announcements',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const AnnouncementsScreen(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => AnnouncementDetailScreen(
                          announcementId: state.pathParameters['id']!,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'bookings',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const BookingsScreen(),
                    routes: [
                      GoRoute(
                        path: 'facility/:id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => FacilityScreen(
                          facilityId: state.pathParameters['id']!,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'visitors',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const VisitorsScreen(),
                    routes: [
                      GoRoute(
                        path: 'new',
                        parentNavigatorKey: _rootKey,
                        builder: (_, _) => const NewVisitorScreen(),
                      ),
                      GoRoute(
                        path: 'entry/:id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => VisitorEntryScreen(
                          entryId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: 'recurring/new',
                        parentNavigatorKey: _rootKey,
                        builder: (_, _) => const NewRecurringVisitorScreen(),
                      ),
                      GoRoute(
                        path: 'recurring/:id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => RecurringVisitorScreen(
                          recurringId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: 'requests/:id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => ApprovalRequestScreen(
                          requestId: state.pathParameters['id']!,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'parcels',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const ParcelsScreen(),
                  ),
                  GoRoute(
                    path: 'assembly',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const AssemblyScreen(),
                    routes: [
                      GoRoute(
                        path: 'decisions',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => DecisionsScreen(
                          meetingId: state.uri.queryParameters['meeting'],
                        ),
                      ),
                      GoRoute(
                        path: ':id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => MeetingScreen(
                          meetingId: state.pathParameters['id']!,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'documents',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const DocumentsScreen(),
                    routes: [
                      GoRoute(
                        path: 'folder/:id',
                        parentNavigatorKey: _rootKey,
                        builder: (_, state) => DocumentsScreen(
                          folderId: state.pathParameters['id'],
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'notifications',
                    parentNavigatorKey: _rootKey,
                    builder: (_, _) => const NotificationsScreen(),
                    routes: [
                      GoRoute(
                        path: 'settings',
                        parentNavigatorKey: _rootKey,
                        builder: (_, _) => const NotificationSettingsScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'pdf',
                    parentNavigatorKey: _rootKey,
                    redirect: (_, state) =>
                        state.extra is PdfArgs ? null : '/more/documents',
                    builder: (_, state) =>
                        PdfScreen(args: state.extra! as PdfArgs),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.profile,
        builder: (_, _) => const ProfileScreen(),
        routes: [
          GoRoute(path: 'me', builder: (_, _) => const EditMeScreen()),
          GoRoute(
            path: 'directory',
            builder: (_, _) => const DirectoryScreen(),
          ),
          GoRoute(path: 'sessions', builder: (_, _) => const SessionsScreen()),
          GoRoute(path: 'lock', builder: (_, _) => const AppLockScreen()),
          GoRoute(path: 'consents', builder: (_, _) => const ConsentsScreen()),
          GoRoute(path: 'about', builder: (_, _) => const AboutScreen()),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
