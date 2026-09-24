import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService {
  LocalNotificationsService();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();

    final timezoneInfo = await FlutterTimezone.getLocalTimezone();
    final timezoneName = timezoneInfo.identifier;

    tz.setLocalLocation(tz.getLocation(timezoneName));

    const androidSettings = AndroidInitializationSettings(
      'miqat_notification',
    );

    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
    );

    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: _onNotificationResponse,
    );
  }

  void _onNotificationResponse(NotificationResponse response) {
    // TODO: Handle notification tap later.
  }

  Future<bool?> requestNotificationPermission() async {
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    return androidPlugin?.requestNotificationsPermission();
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'miqat_general_notifications',
      'Miqat Notifications',
      channelDescription: 'Miqat application notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
    );
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,

    String? sound,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      sound == null ? 'miqat_scheduled_notifications' : 'miqat_adhan_$sound',
      sound == null
          ? 'Miqat Scheduled Notifications'
          : 'Miqat Adhan Notifications',
      channelDescription: sound == null
          ? 'Scheduled notifications for Miqat'
          : 'Adhan notifications for Miqat',
      importance: Importance.high,
      priority: Priority.high,
      sound: sound == null ? null : RawResourceAndroidNotificationSound(sound),
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    final tzDateTime = tz.TZDateTime.from(
      scheduledDate,
      tz.local,
    );

    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: tzDateTime,
      notificationDetails: notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'miqat_daily_notifications',
      'Miqat Daily Notifications',
      channelDescription: 'Daily notifications for Miqat',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    final now = tz.TZDateTime.now(tz.local);

    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(
        const Duration(days: 1),
      );
    }

    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id: id);
  }

  Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }
}
