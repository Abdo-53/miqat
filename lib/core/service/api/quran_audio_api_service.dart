import 'package:dio/dio.dart';
import 'package:miqat/features/quran/data/model/radios_response.dart';
import 'package:miqat/features/quran/data/model/reciters_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'quran_audio_api_service.g.dart';

@RestApi(baseUrl: 'https://www.mp3quran.net/api/v3/')
abstract class QuranAudioApiService {
  factory QuranAudioApiService(Dio dio, {String? baseUrl}) =
      _QuranAudioApiService;

  @GET('reciters')
  Future<RecitersResponse> getReciters({
    @Query('language') String language = 'ar',
  });

  @GET('radios')
  Future<RadiosResponse> getRadios({@Query('language') String language = 'ar'});
}
