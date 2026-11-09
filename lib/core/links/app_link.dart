import 'package:flutter/foundation.dart';

/// A link the app understands (backend plan section 6, mobile plan section 6).
///
/// Web form: `https://host/invite/{token}`, `https://host/join/{code}`,
/// `https://host/login/magic?token=...`; bare `https://host` is a server QR.
/// Mobile form: the same path under `openbekci://` (`openbekci://invite/{token}`,
/// `openbekci://join/{code}`, `openbekci://login/magic?token=...`). The mobile
/// form carries no host, so [origin] is null unless the link adds an optional
/// `server=<url>` query parameter; the app then uses the server it is
/// connecting to.
@immutable
sealed class AppLink {
  const new({this.origin});

  /// `scheme://host[:port]` when the link names its server.
  final String? origin;

  /// Parses a URI or text; null when it is not an OpenBekci link.
  static AppLink? parse(String text) {
    final Uri uri;
    try {
      uri = Uri.parse(text.trim());
    } on FormatException {
      return null;
    }
    return fromUri(uri);
  }

  /// Like [parse] for text a person typed or pasted: a missing scheme counts
  /// as `https://`, so `gul.example.org/invite/abc` works.
  static AppLink? parseLoose(String text) {
    final t = text.trim();
    if (t.isEmpty) return null;
    return parse(t.contains('://') ? t : 'https://$t');
  }

  /// Parses an already built [Uri].
  static AppLink? fromUri(Uri uri) {
    if (uri.scheme == 'openbekci') return _fromMobileScheme(uri);
    if (uri.scheme == 'https' || uri.scheme == 'http') return _fromWeb(uri);
    return null;
  }

  static String? _originOf(Uri uri) {
    if (uri.host.isEmpty) return null;
    return Uri(
      scheme: uri.scheme,
      host: uri.host.toLowerCase(),
      port: uri.hasPort ? uri.port : null,
    ).toString();
  }

  static String? _serverParam(Uri uri) {
    final raw = uri.queryParameters['server'];
    if (raw == null || raw.isEmpty) return null;
    final parsed = Uri.tryParse(raw.contains('://') ? raw : 'https://$raw');
    if (parsed == null) return null;
    return _originOf(parsed);
  }

  static AppLink? _fromMobileScheme(Uri uri) {
    // openbekci://invite/TOKEN parses as host=invite, path=/TOKEN.
    final segments = [
      if (uri.host.isNotEmpty) uri.host,
      ...uri.pathSegments.where((s) => s.isNotEmpty),
    ];
    // openbekci://<host>[:port]/<path>: the server puts the instance host
    // first (plain http only with scheme=http). The local forms (invite, join,
    // login, connect, pay) start with their own word instead.
    if (segments.length >= 2 && !_localForms.contains(segments.first)) {
      final plain = uri.queryParameters['scheme'] == 'http';
      final origin = Uri(
        scheme: plain ? 'http' : 'https',
        host: uri.host.toLowerCase(),
        port: uri.hasPort ? uri.port : null,
      ).toString();
      return _fromSegments(segments.sublist(1), uri, origin);
    }
    return _fromSegments(segments, uri, _serverParam(uri));
  }

  static const _localForms = {'invite', 'join', 'login', 'connect', 'pay'};

  static AppLink? _fromWeb(Uri uri) {
    final origin = _originOf(uri);
    if (origin == null) return null;
    final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    if (segments.isEmpty) return ServerLink(origin: origin);
    return _fromSegments(segments, uri, origin) ?? ServerLink(origin: origin);
  }

  static AppLink? _fromSegments(List<String> s, Uri uri, String? origin) {
    if (s.isEmpty) return null;
    switch (s.first) {
      case 'invite':
        if (s.length >= 2 && s[1].isNotEmpty) {
          return InviteLink(token: s[1], origin: origin);
        }
      case 'join':
        if (s.length >= 2 && s[1].isNotEmpty) {
          return JoinLink(code: s[1], origin: origin);
        }
      case 'login':
        if (s.length >= 2 && s[1] == 'magic') {
          final token = uri.queryParameters['token'];
          if (token != null && token.isNotEmpty) {
            return MagicLoginLink(token: token, origin: origin);
          }
        }
      case 'pay':
        // openbekci://pay/return?org_id=...&checkout_id=... (card checkout)
        final org = uri.queryParameters['org_id'];
        final id = uri.queryParameters['checkout_id'];
        if (s.length >= 2 && s[1] == 'return' && org != null && id != null) {
          return PayReturnLink(orgId: org, checkoutId: id, origin: origin);
        }
      case 'connect':
        // openbekci://connect?server=<url>[&invite=<token>]
        final invite = uri.queryParameters['invite'];
        if (origin != null && invite != null && invite.isNotEmpty) {
          return InviteLink(token: invite, origin: origin);
        }
        if (origin != null) return ServerLink(origin: origin);
    }
    return null;
  }
}

/// A site QR / server address: just connect.
class ServerLink extends AppLink {
  const new({required String super.origin});

  @override
  String toString() => 'ServerLink($origin)';
}

/// `.../invite/{token}`.
class InviteLink extends AppLink {
  const new({required this.token, super.origin});
  final String token;

  @override
  String toString() => 'InviteLink($origin, ***)';

  @override
  bool operator ==(Object other) =>
      other is InviteLink && other.token == token && other.origin == origin;

  @override
  int get hashCode => Object.hash(token, origin);
}

/// `.../join/{code}`: the site QR with unit claim.
class JoinLink extends AppLink {
  const new({required this.code, super.origin});
  final String code;

  @override
  String toString() => 'JoinLink($origin, ***)';

  @override
  bool operator ==(Object other) =>
      other is JoinLink && other.code == code && other.origin == origin;

  @override
  int get hashCode => Object.hash(code, origin);
}

/// `.../login/magic?token=...`.
class MagicLoginLink extends AppLink {
  const new({required this.token, super.origin});
  final String token;

  @override
  String toString() => 'MagicLoginLink($origin, ***)';

  @override
  bool operator ==(Object other) =>
      other is MagicLoginLink && other.token == token && other.origin == origin;

  @override
  int get hashCode => Object.hash(token, origin);
}

/// `openbekci://pay/return?org_id&checkout_id`: the payer is back from the
/// provider's page.
class PayReturnLink extends AppLink {
  const new({required this.orgId, required this.checkoutId, super.origin});
  final String orgId;
  final String checkoutId;

  @override
  bool operator ==(Object other) =>
      other is PayReturnLink &&
      other.checkoutId == checkoutId &&
      other.orgId == orgId &&
      other.origin == origin;

  @override
  int get hashCode => Object.hash(orgId, checkoutId, origin);
}
