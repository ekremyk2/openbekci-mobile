import 'package:openbekci_mobile/app/bootstrap.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';

/// `dev` flavor: plain http allowed for localhost / 10.0.2.2.
Future<void> main() => bootstrap(Flavor.dev);
