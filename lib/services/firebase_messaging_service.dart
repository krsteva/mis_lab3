import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_service.dart';

class FirebaseMessagingService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // Handle the incoming message
      if (message.notification != null) {
        await NotificationService.showNotification(
            message.notification!.title ?? "New Notification",
            message.notification!.body ?? "You have a new notification");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification tap
      print("Notification tapped: ${message.data}");
    });
  }

  static Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}
