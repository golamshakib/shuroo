import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:shuroo/features/search_notification_chat/presentation/screen/notification_screen.dart';

class NotificationService extends GetxController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  int _badgeCount = 0;

  Future<void> initialize() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    log('Notification permission: ${settings.authorizationStatus}');

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) async {
        final payload = response.payload;
        log("Tapped from local notification with payload: $payload");

        if (payload != null && payload.isNotEmpty) {
          final data = jsonDecode(payload);
          Get.to(() =>  NotificationScreen(), arguments: data);
        } else {
          Get.to(() =>  NotificationScreen());
        }
      },
    );

    await setupIOSNotifications();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _firebaseMessaging.getToken().then((token) => log("FCM Token: $token"));

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Foreground message: ${message.notification?.title}");
      _showLocalNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Tapped background notification: ${message.notification?.title}");
      //clearBadge();
      Get.to(() =>  NotificationScreen, arguments: {
        "title": message.notification?.title,
        "body": message.notification?.body,
      });
    });

    final RemoteMessage? initialMessage =
    await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      log("Tapped from terminated state: ${initialMessage.notification?.title}");
      //clearBadge();
      Get.to(() =>  NotificationScreen(), arguments: {
        "title": initialMessage.notification?.title,
        "body": initialMessage.notification?.body,
      });
    }
  }

  Future<void> setupIOSNotifications() async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }



  Future<void> _showLocalNotification(RemoteMessage message) async {
    _badgeCount++;

    final notification = {
      "title": message.notification?.title ?? "No Title",
      "body": message.notification?.body ?? "No Body",
      "timestamp": DateTime.now().toIso8601String(),
    };

    // Store to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final List<String> existing = prefs.getStringList('notifications') ?? [];
    existing.insert(0, jsonEncode(notification)); // latest on top
    await prefs.setStringList('notifications', existing);

    // Show system notification
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'Used for important notifications.',
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(badgeNumber: _badgeCount),
    );

    await _flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      notification['title'],
      notification['body'],
      details,
      payload: jsonEncode(notification),
    );
  }


 /* Future<void> clearBadge() async {
    _badgeCount = 0;
    await _flutterLocalNotificationsPlugin.show(
      0,
      null,
      null,
      const NotificationDetails(
        iOS: DarwinNotificationDetails(badgeNumber: 0),
      ),
    );
  }*/

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log('Background message received: ${message.notification?.title}');
  }
}