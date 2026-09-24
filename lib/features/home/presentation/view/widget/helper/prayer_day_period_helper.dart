import 'package:miqat/features/home/presentation/view/widget/helper/prayer_day_period.dart';

class PrayerDayPeriodHelper {
  static PrayerDayPeriod getCurrentPeriod({
    required String fajr,
  
    required String dhuhr,
    required String maghrib,
    required String isha,
  }) {
    final now = DateTime.now();

    final fajrTime = _parseTime(fajr, now);
    
    final dhuhrTime = _parseTime(dhuhr, now);
    final maghribTime = _parseTime(maghrib, now);
    final ishaTime = _parseTime(isha, now);

    if (_isBetween(now, fajrTime, dhuhrTime)) {
      return PrayerDayPeriod.sunrise;
    }

    if (_isBetween(now, dhuhrTime, maghribTime)) {
      return PrayerDayPeriod.sunrise;
    }

    if (_isBetween(now, maghribTime, ishaTime)) {
      return PrayerDayPeriod.night;
    }

    return PrayerDayPeriod.day;
  }

  static DateTime _parseTime(String time, DateTime date) {
    final cleanTime = time.split(' ').first;
    final parts = cleanTime.split(':');

    return DateTime(
      date.year,
      date.month,
      date.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  static bool _isBetween(DateTime now, DateTime start, DateTime end) {
    return !now.isBefore(start) && now.isBefore(end);
  }
}
