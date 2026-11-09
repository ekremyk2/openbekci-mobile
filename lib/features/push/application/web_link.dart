import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Where "Open in web" goes in the web app: always an `/orgs/{org_id}/...`
/// path (the server refuses anything else with `validation_failed`).
String webNextPath(String orgId, String tail) =>
    '/orgs/$orgId${tail.isEmpty || tail.startsWith('/') ? tail : '/$tail'}';

final _webNextPattern = RegExp(
  r'^/orgs/[A-Za-z0-9_-]{1,64}(/[A-Za-z0-9_-]{1,64})*$',
);

/// True for a `next` the app may send: `/orgs/{org}/...` made only of plain
/// id-like segments (no query, fragment, dots, `//` or other origins).
bool isSafeWebNext(String next) => _webNextPattern.hasMatch(next);

/// The URL to open for a one-time web-login [link]:
/// `{BASE_URL}/login/link/{token}?next=...`. The server composes `url` from
/// its configured base URL; when that is missing or relative the app builds
/// the same URL on the server it is signed in to.
Uri webLoginUri({
  required String serverOrigin,
  required WebLoginLink link,
  required String next,
}) {
  final given = Uri.tryParse(link.url);
  if (given != null &&
      given.hasScheme &&
      (given.scheme == 'https' || given.scheme == 'http') &&
      given.pathSegments.contains(link.token)) {
    // Host and path come from the server (its configured base URL), but
    // `next` is always ours: an in-app `/orgs/{org}/...` path.
    return given.replace(queryParameters: {'next': next});
  }
  return Uri.parse(serverOrigin).replace(
    pathSegments: ['login', 'link', link.token],
    queryParameters: {'next': next},
  );
}

/// Asks the server for a web-login link (`POST /v1/me/web-login-link`) and
/// opens it in the browser, for anything deeper than the app offers: manager
/// actions, the guard console, settings (mobile plan section 7.2).
Future<void> openInWeb(
  BuildContext context,
  WidgetRef ref, {
  required String tail,
}) async {
  final l = AppLocalizations.of(context);
  final messenger = ScaffoldMessenger.of(context);
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  final origin = ref.read(accountProvider).value?.serverOrigin;
  if (scope == null || api == null || origin == null) return;
  final next = webNextPath(scope.orgId, tail);
  if (!isSafeWebNext(next)) return;
  try {
    final link = await unwrap(
      () => api.me.meCreateWebLoginLink(
        webLoginLinkCreate: WebLoginLinkCreate(next: next),
      ),
    );
    final uri = webLoginUri(serverOrigin: origin, link: link, next: next);
    final ok = await ref.read(urlOpenerProvider).open(uri);
    if (!ok) {
      messenger.showSnackBar(SnackBar(content: Text(l.webOpenFailed)));
    }
  } on Object catch (e) {
    messenger.showSnackBar(
      SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
    );
  }
}

/// "Open in web" row: a list tile that opens [tail] of the organization in
/// the web app.
class OpenInWebTile extends ConsumerWidget {
  const new({required this.tail, this.label, super.key});

  final String tail;
  final String? label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return ListTile(
      key: const Key('openInWeb'),
      leading: const Icon(Icons.open_in_new),
      title: Text(label ?? l.webOpen),
      subtitle: Text(l.webOpenBody),
      onTap: () => openInWeb(context, ref, tail: tail),
    );
  }
}
