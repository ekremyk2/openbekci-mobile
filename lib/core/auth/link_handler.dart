import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';

/// Decides where a link leads (mobile plan section 6). Pure routing logic over
/// providers; the UI calls `router.go(await resolve(link))`.
class LinkHandler {
  new(this._ref);

  final Ref _ref;

  /// Connects to [input] (an address or a QR payload's origin), stores the
  /// validated server as pending and returns it. Throws [AppError].
  Future<Discovery> connect(String input) async {
    final discovery = await _ref.read(serverConnectorProvider).connect(input);
    _ref.read(pendingServerProvider.notifier).set(discovery);
    return discovery;
  }

  /// The location to show for [link]; sets the pending link when the app
  /// first needs a server.
  Future<String> resolve(AppLink link) async {
    final account = _ref.read(accountProvider).value;
    final pending = _ref.read(pendingServerProvider);
    final origin = link.origin ?? account?.serverOrigin ?? pending?.origin;

    if (account != null) {
      // One account in the first release: links for another server are ignored.
      if (link.origin != null && link.origin != account.serverOrigin) {
        return '/';
      }
      return link is JoinLink ? joinLocation(link.code) : '/';
    }

    if (origin == null) {
      _ref.read(pendingLinkProvider.notifier).set(link);
      return '/server';
    }
    if (pending == null || pending.origin != origin) {
      try {
        await connect(origin);
      } on AppError {
        _ref.read(pendingLinkProvider.notifier).set(link);
        return '/server';
      }
    }
    return switch (link) {
      InviteLink(:final token) => '/invite/${Uri.encodeComponent(token)}',
      JoinLink(:final code) => joinLocation(code),
      MagicLoginLink(:final token) => '/magic/${Uri.encodeComponent(token)}',
      ServerLink() => '/sign-in',
    };
  }

  /// Where to go once the user is signed in: the join picker when a site QR
  /// was waiting, else home.
  String afterSignIn() {
    final pending = _ref.read(pendingLinkProvider);
    _ref.read(pendingLinkProvider.notifier).set(null);
    if (pending is JoinLink) return joinLocation(pending.code);
    return '/';
  }

  static String joinLocation(String code) =>
      '/join/${Uri.encodeComponent(code)}';
}

final linkHandlerProvider = Provider<LinkHandler>(LinkHandler.new);

/// Links opened from outside the app (`openbekci://` and https app links):
/// the initial link at launch, then the live stream. A seam for tests.
final incomingLinksProvider = Provider<Stream<AppLink>>((ref) {
  final controller = StreamController<AppLink>.broadcast();
  final appLinks = AppLinks();
  final sub = appLinks.uriLinkStream.listen((uri) {
    final link = AppLink.fromUri(uri);
    if (link != null) controller.add(link);
  });
  // The link that launched the app, delivered after listeners attach.
  unawaited(
    appLinks.getInitialLink().then((uri) {
      final link = uri == null ? null : AppLink.fromUri(uri);
      if (link != null) controller.add(link);
    }),
  );
  ref.onDispose(() {
    unawaited(sub.cancel());
    unawaited(controller.close());
  });
  return controller.stream;
});
