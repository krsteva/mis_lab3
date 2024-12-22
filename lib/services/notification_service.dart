import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize the notifications plugin and timezone data
  static Future<void> initialize() async {
    tz_data.initializeTimeZones(); // Initialize the time zone data

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await _notificationsPlugin.initialize(initializationSettings);
  }

  // Show a simple notification
  static Future<void> showNotification(String title, String body) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'Default Channel',
        importance: Importance.high,
        priority: Priority.high,
        // No need to specify androidAllowWhileIdle directly here
      ),
    );
    await _notificationsPlugin.show(0, title, body, notificationDetails);
  }

  // Schedule a daily notification
  static Future<void> scheduleDailyNotification(
      int hour, int minute, String title, String body) async {
    await _notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      _nextInstanceOfTime(hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_notification',
          'Daily Notifications',
          importance: Importance.high,
          priority: Priority.high,
          // Schedule notification even when idle
          // Use the `setAllowWhileIdle` flag for exact scheduling
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // Required for idle notifications
    );
  }

  // Get the next instance of time to schedule the notification
  static tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
