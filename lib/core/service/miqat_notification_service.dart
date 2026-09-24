import 'package:miqat/core/model/weekly_prayer_times_response.dart';
import 'package:miqat/core/service/local_notifications_service.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/home/data/model/prayer_times_model.dart';

class MiqatNotificationService {
  final LocalNotificationsService _localNotificationsService;

  final SharedPreferencesService _sharedPreferencesService;

  MiqatNotificationService(
    this._localNotificationsService,
    this._sharedPreferencesService,
  );

  static const int fajrNotificationId = 1;
  static const int dhuhrNotificationId = 2;
  static const int asrNotificationId = 3;
  static const int maghribNotificationId = 4;
  static const int ishaNotificationId = 5;

  static const int morningAzkarNotificationId = 6;
  static const int eveningAzkarNotificationId = 7;

  static const int _weeklyPrayerBaseId = 100;
  static const int _weeklyAzkarBaseId = 200;

  static const List<int> _prayerNotificationIds = [
    fajrNotificationId,
    dhuhrNotificationId,
    asrNotificationId,
    maghribNotificationId,
    ishaNotificationId,
  ];

  //================ Notifications Settings ================//

  Future<void> setNotificationsEnabled(bool enabled) async {
    await _sharedPreferencesService.saveNotificationsEnabled(enabled);

    if (!enabled) {
      await cancelPrayerNotifications();
      await cancelAzkarNotifications();
      await _cancelWeeklyNotifications();
    }
  }

  Future<void> setAdhanSound(String sound) async {
    await _sharedPreferencesService.saveAdhanSound(sound);
  }

  String getAdhanSound() {
    return _sharedPreferencesService.getAdhanSound();
  }

  //================ Helper ================//

  DateTime _createScheduledDate({
    required String prayerTime,
    required int year,
    required int month,
    required int day,
  }) {
    final cleanTime = prayerTime.split(' ').first;
    final timeParts = cleanTime.split(':');

    return DateTime(
      year,
      month,
      day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );
  }

  //================ Daily Prayer Notifications ================//

  Future<void> schedulePrayerNotifications({
    required PrayerTimesModel timings,
    required String title,
    required String fajrMessage,
    required String dhuhrMessage,
    required String asrMessage,
    required String maghribMessage,
    required String ishaMessage,
  }) async {
    if (!_sharedPreferencesService.getNotificationsEnabled()) {
      return;
    }

    await cancelPrayerNotifications();

    final prayers = {
      fajrNotificationId: (timings.fajr, fajrMessage),
      dhuhrNotificationId: (timings.dhuhr, dhuhrMessage),
      asrNotificationId: (timings.asr, asrMessage),
      maghribNotificationId: (timings.maghrib, maghribMessage),
      ishaNotificationId: (timings.isha, ishaMessage),
    };

    final now = DateTime.now();

    for (final entry in prayers.entries) {
      final id = entry.key;
      final prayerTime = entry.value.$1;
      final message = entry.value.$2;

      final scheduledDate = _createScheduledDate(
        prayerTime: prayerTime,
        year: now.year,
        month: now.month,
        day: now.day,
      );

      if (scheduledDate.isBefore(now)) {
        continue;
      }

      await _localNotificationsService.scheduleNotification(
        id: id,
        title: title,
        body: message,
        scheduledDate: scheduledDate,
        sound: getAdhanSound(),
      );
    }
  }

  //================ Daily Azkar Notifications ================//

  Future<void> scheduleAzkarNotifications({
    required PrayerTimesModel timings,
    required String morningTitle,
    required String morningMessage,
    required String eveningTitle,
    required String eveningMessage,
  }) async {
    if (!_sharedPreferencesService.getNotificationsEnabled()) {
      return;
    }

    await cancelAzkarNotifications();

    final now = DateTime.now();

    final fajrTime = _createScheduledDate(
      prayerTime: timings.fajr,
      year: now.year,
      month: now.month,
      day: now.day,
    );

    final asrTime = _createScheduledDate(
      prayerTime: timings.asr,
      year: now.year,
      month: now.month,
      day: now.day,
    );

    final morningTime = fajrTime.add(
      const Duration(minutes: 30),
    );

    final eveningTime = asrTime.add(
      const Duration(minutes: 30),
    );

    if (!morningTime.isBefore(now)) {
      await _localNotificationsService.scheduleNotification(
        id: morningAzkarNotificationId,
        title: morningTitle,
        body: morningMessage,
        scheduledDate: morningTime,
      );
    }

    if (!eveningTime.isBefore(now)) {
      await _localNotificationsService.scheduleNotification(
        id: eveningAzkarNotificationId,
        title: eveningTitle,
        body: eveningMessage,
        scheduledDate: eveningTime,
      );
    }
  }

  //================ Weekly Notifications ================//

  Future<void> scheduleWeeklyNotifications({
    required WeeklyPrayerTimesResponse weeklyData,
    required String title,
    required String fajrMessage,
    required String dhuhrMessage,
    required String asrMessage,
    required String maghribMessage,
    required String ishaMessage,
    required String morningTitle,
    required String morningMessage,
    required String eveningTitle,
    required String eveningMessage,
  }) async {
    if (!_sharedPreferencesService.getNotificationsEnabled()) {
      return;
    }

    await cancelPrayerNotifications();
    await cancelAzkarNotifications();
    await _cancelWeeklyNotifications();

    for (int dayIndex = 0; dayIndex < weeklyData.data.length; dayIndex++) {
      final day = weeklyData.data[dayIndex];

      final dateParts = day.date.gregorian.date.split('-');

      final scheduledYear = int.parse(dateParts[2]);
      final scheduledMonth = int.parse(dateParts[1]);
      final scheduledDay = int.parse(dateParts[0]);

      //================ Prayer Notifications ================//

      final prayers = {
        fajrNotificationId: (day.timings.fajr, fajrMessage),
        dhuhrNotificationId: (day.timings.dhuhr, dhuhrMessage),
        asrNotificationId: (day.timings.asr, asrMessage),
        maghribNotificationId: (day.timings.maghrib, maghribMessage),
        ishaNotificationId: (day.timings.isha, ishaMessage),
      };

      for (final entry in prayers.entries) {
        final scheduledDate = _createScheduledDate(
          prayerTime: entry.value.$1,
          year: scheduledYear,
          month: scheduledMonth,
          day: scheduledDay,
        );

        if (scheduledDate.isBefore(DateTime.now())) {
          continue;
        }

        final notificationId =
            _weeklyPrayerBaseId + (dayIndex * 10) + entry.key;

        await _localNotificationsService.scheduleNotification(
          id: notificationId,
          title: title,
          body: entry.value.$2,
          scheduledDate: scheduledDate,
          sound: getAdhanSound(),
        );
      }

      //================ Morning Azkar ================//

      final fajrTime = _createScheduledDate(
        prayerTime: day.timings.fajr,
        year: scheduledYear,
        month: scheduledMonth,
        day: scheduledDay,
      );

      final morningTime = fajrTime.add(
        const Duration(minutes: 30),
      );

      if (!morningTime.isBefore(DateTime.now())) {
        await _localNotificationsService.scheduleNotification(
          id: _weeklyAzkarBaseId + (dayIndex * 10) + morningAzkarNotificationId,
          title: morningTitle,
          body: morningMessage,
          scheduledDate: morningTime,
        );
      }

      //================ Evening Azkar ================//

      final asrTime = _createScheduledDate(
        prayerTime: day.timings.asr,
        year: scheduledYear,
        month: scheduledMonth,
        day: scheduledDay,
      );

      final eveningTime = asrTime.add(
        const Duration(minutes: 30),
      );

      if (!eveningTime.isBefore(DateTime.now())) {
        await _localNotificationsService.scheduleNotification(
          id: _weeklyAzkarBaseId + (dayIndex * 10) + eveningAzkarNotificationId,
          title: eveningTitle,
          body: eveningMessage,
          scheduledDate: eveningTime,
        );
      }
    }
  }

  //================ Cancel Prayer Notifications ================//

  Future<void> cancelPrayerNotifications() async {
    for (final id in _prayerNotificationIds) {
      await _localNotificationsService.cancelNotification(id);
    }
  }

  //================ Cancel Azkar Notifications ================//

  Future<void> cancelAzkarNotifications() async {
    await _localNotificationsService.cancelNotification(
      morningAzkarNotificationId,
    );

    await _localNotificationsService.cancelNotification(
      eveningAzkarNotificationId,
    );
  }

  //================ Cancel Weekly Notifications ================//

  Future<void> _cancelWeeklyNotifications() async {
    for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
      for (final prayerId in _prayerNotificationIds) {
        await _localNotificationsService.cancelNotification(
          _weeklyPrayerBaseId + (dayIndex * 10) + prayerId,
        );
      }

      await _localNotificationsService.cancelNotification(
        _weeklyAzkarBaseId + (dayIndex * 10) + morningAzkarNotificationId,
      );

      await _localNotificationsService.cancelNotification(
        _weeklyAzkarBaseId + (dayIndex * 10) + eveningAzkarNotificationId,
      );
    }
  }
}
