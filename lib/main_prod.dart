import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:openbekci_mobile/app/bootstrap.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/features/push/application/local_notifier.dart';
import 'package:openbekci_mobile/features/push/application/push_transport.dart';

/// `prod` flavor: HTTPS only, push through Firebase Cloud Messaging and the
/// relay. Needs the build's `google-services.json` (README, "Push"); without
/// it Firebase stays off and the app falls back to periodic fetching.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  } on Object {
    // No Firebase configuration in this build.
  }
  await bootstrap(Flavor.prod, transport: FcmTransport());
}
