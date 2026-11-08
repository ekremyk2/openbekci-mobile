import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';

/// Turns server input into a validated [Discovery] (mobile plan section 5.1
/// steps 2 and 4). A seam for tests.
abstract class ServerConnector {
  Future<Discovery> connect(String input);
}

/// [ServerConnector] that fetches `/.well-known/openbekci.json` over HTTP.
class HttpServerConnector implements ServerConnector {
  new({required this.allowInsecureLocal, required this.clientFor});

  /// True in the `dev` flavor (http allowed for loopback / emulator hosts).
  final bool allowInsecureLocal;

  /// Builds an anonymous client for an origin.
  final ApiClient Function(String origin) clientFor;

  @override
  Future<Discovery> connect(String input) async {
    final origin = normalizeServerInput(
      input,
      allowInsecureLocal: allowInsecureLocal,
    );
    return await fetchDiscovery(clientFor(origin));
  }
}
