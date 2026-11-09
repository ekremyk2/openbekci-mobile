import 'package:openbekci_mobile/app/bootstrap.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/features/push/application/push_transport.dart';

/// `dev` flavor: plain http allowed for localhost / 10.0.2.2. The dev build
/// has no Firebase project, so push goes through UnifiedPush when a
/// distributor is installed (the server posts to its endpoint), else periodic
/// fetching.
Future<void> main() => bootstrap(Flavor.dev, transport: UnifiedPushTransport());
