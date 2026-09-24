import 'package:dio/dio.dart';
import 'package:miqat/core/model/weekly_prayer_times_response.dart';
import 'package:miqat/features/home/data/model/prayer_times_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'prayer_api_service.g.dart';

@RestApi(baseUrl: 'https://api.aladhan.com/v1/')
abstract class PrayerApiService {
  factory PrayerApiService(Dio dio, {String? baseUrl}) = _PrayerApiService;

  @GET('timings/{date}')
  Future<PrayerTimesResponse> getPrayerTimes({
    @Path('date') required String date,
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
  });

  @GET('calendar/from/{start}/to/{end}')
  Future<WeeklyPrayerTimesResponse> getPrayerCalendar({
    @Path('start') required String start,
    @Path('end') required String end,
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
  });
}
