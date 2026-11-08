import 'package:flutter/foundation.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';

/// Oldest server this app talks to (`0.1.0`: first release with the endpoints
/// of phase A). Newer servers are fine: releases are additive.
const kMinServerVersion = '0.1.0';

/// The only API version this app speaks.
const kApiVersion = 'v1';

/// Result of the version gate (mobile plan section 5.1 step 3).
sealed class VersionGate {
  const new();
}

class GateOpen extends VersionGate {
  const new();
}

/// The app is older than the server's `min_app_version`.
class GateAppTooOld extends VersionGate {
  const new({required this.minVersion, required this.appVersion});
  final String minVersion;
  final String appVersion;
}

/// The server is outside the supported range.
class GateServerUnsupported extends VersionGate {
  const new({required this.serverVersion});
  final String serverVersion;
}

/// A validated discovery document for [origin].
@immutable
class Discovery {
  const new({required this.origin, required this.document});

  /// `scheme://host[:port]` the document was fetched from.
  final String origin;
  final DiscoveryDocument document;

  String get instanceId => document.instanceId;
  String get instanceName => document.instanceName;
  List<String> get authMethodIds => [
    for (final m in document.authMethods) m.id,
  ];
}

/// Sign-in methods this app implements, in order of prominence.
const knownAuthMethods = ['sms_otp', 'password', 'magic_link'];

/// Normalizes what the user typed or scanned into a server origin:
/// adds `https://`, drops path, query and fragment, lowercases the host.
///
/// Plain `http` is accepted only for loopback / emulator hosts and only when
/// [allowInsecureLocal] is true (the `dev` flavor). Throws [AppError] with
/// code `insecure_server` or `not_openbekci` (unparseable input).
String normalizeServerInput(String input, {required bool allowInsecureLocal}) {
  var text = input.trim();
  if (text.isEmpty) throw const AppError(code: 'not_openbekci');
  if (!text.contains('://')) {
    text = 'https://$text';
  }
  final Uri uri;
  try {
    uri = Uri.parse(text);
  } on FormatException {
    throw const AppError(code: 'not_openbekci');
  }
  if (uri.host.isEmpty || !(uri.scheme == 'https' || uri.scheme == 'http')) {
    throw const AppError(code: 'not_openbekci');
  }
  if (uri.scheme == 'http' && !(allowInsecureLocal && isLocalHost(uri.host))) {
    throw const AppError(code: 'insecure_server');
  }
  return Uri(
    scheme: uri.scheme,
    host: uri.host.toLowerCase(),
    port: uri.hasPort ? uri.port : null,
  ).toString();
}

/// Hosts for which plain http is allowed in the dev flavor.
bool isLocalHost(String host) =>
    host == 'localhost' ||
    host == '127.0.0.1' ||
    host == '10.0.2.2' ||
    host == '[::1]' ||
    host == '::1';

/// Fetches and validates `GET /.well-known/openbekci.json` from the client's origin.
Future<Discovery> fetchDiscovery(ApiClient client) async {
  final DiscoveryDocument doc;
  try {
    doc = await unwrap(client.instance.instanceGetDiscovery);
  } on AppError catch (e) {
    // A non-OpenBekci server answers 404 or HTML; keep network errors as is.
    if (e.status == 404 || e.code == 'unknown') {
      throw const AppError(code: 'not_openbekci');
    }
    rethrow;
  }
  return Discovery(origin: client.origin, document: doc);
}

/// Applies the version gate to a discovery document.
VersionGate checkVersionGate(
  DiscoveryDocument doc, {
  required String appVersion,
  String platform = 'android',
}) {
  final minApp = platform == 'ios'
      ? doc.minAppVersion.ios
      : doc.minAppVersion.android;
  if (compareVersions(appVersion, minApp) < 0) {
    return GateAppTooOld(minVersion: minApp, appVersion: appVersion);
  }
  final speaksV1 = doc.apiVersions.contains(kApiVersion);
  // Development builds report `dev` instead of a number: do not gate them.
  final numbered = RegExp(r'^\d+\.\d+').hasMatch(doc.serverVersion);
  final tooOld =
      numbered && compareVersions(doc.serverVersion, kMinServerVersion) < 0;
  if (!speaksV1 || tooOld) {
    return GateServerUnsupported(serverVersion: doc.serverVersion);
  }
  return const GateOpen();
}

/// Compares dotted versions (`1.2.3`, `1.2.3-dev`, `1.2.3+4`) numerically on
/// the first three components; missing ones count as 0. Returns <0, 0, >0.
int compareVersions(String a, String b) {
  List<int> parts(String v) {
    final core = v.split(RegExp('[-+]')).first;
    final p = core.split('.').map((s) => int.tryParse(s) ?? 0).toList();
    while (p.length < 3) {
      p.add(0);
    }
    return p;
  }

  final pa = parts(a);
  final pb = parts(b);
  for (var i = 0; i < 3; i++) {
    if (pa[i] != pb[i]) return pa[i].compareTo(pb[i]);
  }
  return 0;
}
