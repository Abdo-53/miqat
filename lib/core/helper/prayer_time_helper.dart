import 'package:miqat/features/home/data/model/next_prayer_model.dart';
import 'package:miqat/features/home/data/model/prayer_times_model.dart';

class PrayerTimeHelper {
  PrayerTimeHelper._();

  static NextPrayerModel getNextPrayer(
    PrayerTimesModel timings, {
    DateTime? currentTime,
  }) {
    final now = currentTime ?? DateTime.now();

    final prayers = [
      NextPrayerModel(
        prayer: PrayerType.fajr,
        time: _parseTime(now, timings.fajr),
      ),
      NextPrayerModel(
        prayer: PrayerType.dhuhr,
        time: _parseTime(now, timings.dhuhr),
      ),
      NextPrayerModel(
        prayer: PrayerType.asr,
        time: _parseTime(now, timings.asr),
      ),
      NextPrayerModel(
        prayer: PrayerType.maghrib,
        time: _parseTime(now, timings.maghrib),
      ),
      NextPrayerModel(
        prayer: PrayerType.isha,
        time: _parseTime(now, timings.isha),
      ),
    ];

    for (final prayer in prayers) {
      if (prayer.time.isAfter(now)) {
        return prayer;
      }
    }

    return NextPrayerModel(
      prayer: PrayerType.fajr,
      time: _parseTime(now.add(const Duration(days: 1)), timings.fajr),
    );
  }

  static Duration getRemainingTime(
    NextPrayerModel nextPrayer, {
    DateTime? currentTime,
  }) {
    final now = currentTime ?? DateTime.now();

    final difference = nextPrayer.time.difference(now);

    if (difference.isNegative) {
      return Duration.zero;
    }

    return difference;
  }

  static DateTime _parseTime(DateTime date, String time) {
    final cleanTime = time.split(' ').first;
    final parts = cleanTime.split(':');

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}
