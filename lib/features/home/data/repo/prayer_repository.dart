import 'package:miqat/core/model/weekly_prayer_times_response.dart';
import 'package:miqat/core/service/api/prayer_api_service.dart';
import 'package:miqat/core/service/location_service.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/home/data/model/prayer_times_response.dart';

class PrayerRepository {
  final PrayerApiService _prayerApiService;
  final LocationService _locationService;
  final SharedPreferencesService _sharedPreferencesService;

  PrayerRepository(
    this._prayerApiService,
    this._locationService,
    this._sharedPreferencesService,
  );

  PrayerTimesResponse? getCachedPrayerTimes() {
    return _sharedPreferencesService.getPrayerTimes();
  }

  Future<PrayerTimesResponse> getPrayerTimes() async {
    try {
      final position = await _locationService.getCurrentPosition();

      final now = DateTime.now();

      final date =
          '${now.day.toString().padLeft(2, '0')}-'
          '${now.month.toString().padLeft(2, '0')}-'
          '${now.year}';

      final response = await _prayerApiService.getPrayerTimes(
        date: date,
        latitude: position.latitude,
        longitude: position.longitude,
      );

      await _sharedPreferencesService.savePrayerTimes(response);

      return response;
    } catch (error) {
      final cachedPrayerTimes = getCachedPrayerTimes();

      if (cachedPrayerTimes != null) {
        return cachedPrayerTimes;
      }

      rethrow;
    }
  }

  Future<WeeklyPrayerTimesResponse> getWeeklyPrayerTimes() async {
    final position = await _locationService.getCurrentPosition();

    final now = DateTime.now();

    final startDate =
        '${now.day.toString().padLeft(2, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.year}';

    final end = now.add(const Duration(days: 6));

    final endDate =
        '${end.day.toString().padLeft(2, '0')}-'
        '${end.month.toString().padLeft(2, '0')}-'
        '${end.year}';

    return _prayerApiService.getPrayerCalendar(
      start: startDate,
      end: endDate,
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
