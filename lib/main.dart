import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuroo/core/services/notification_service.dart';
import 'package:shuroo/firebase_options.dart';
import 'app.dart';
import 'core/services/Auth_service.dart';
import 'core/utils/logging/loggerformain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeFCM();
  await NotificationService().initialize();
  await AuthService.init();


  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) {
      Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
      runApp(const MyApp());
    },
  );
}

Future<void> initializeFCM() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (Platform.isIOS) {
    String? apnsToken;
    int attempts = 0;
    const int maxAttempts = 10;

    do {
      apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      await Future.delayed(const Duration(milliseconds: 300));
      attempts++;
    } while (apnsToken == null && attempts < maxAttempts);

    log("APNS Token: $apnsToken");
  }

  String? token = await FirebaseMessaging.instance.getToken();
  log("FCM Token: $token");
}
