import 'package:openbekci_mobile/app/bootstrap.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';

/// `prod` flavor: HTTPS only.
Future<void> main() => bootstrap(Flavor.prod);
