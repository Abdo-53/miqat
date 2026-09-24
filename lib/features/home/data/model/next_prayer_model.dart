enum PrayerType { fajr, dhuhr, asr, maghrib, isha }

class NextPrayerModel {
  final PrayerType prayer;
  final DateTime time;

  const NextPrayerModel({required this.prayer, required this.time});
}
