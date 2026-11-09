import 'package:openbekci_mobile/app/bootstrap.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/features/push/application/push_transport.dart';

/// `foss` flavor: no Google services; push through UnifiedPush (a distributor
/// app such as ntfy or NextPush hands the app an endpoint, the server posts to
/// it directly). Without a distributor the app uses periodic fetching.
Future<void> main() =>
    bootstrap(Flavor.prod, transport: UnifiedPushTransport());
