import 'package:miqat/core/err/network_exceptions.dart';
import 'package:miqat/core/model/quran_page_model.dart';
import 'package:miqat/core/model/surah_metadata_model.dart';
import 'package:miqat/core/service/api/api_result/api_result.dart';
import 'package:miqat/core/service/audio_download_service.dart';
import 'package:miqat/core/service/audio_player_service.dart';
import 'package:miqat/core/service/local_json_service.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/home/data/model/last_listening_model.dart';
import 'package:miqat/features/home/data/model/last_read_model.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/features/quran/data/model/reciter_model.dart';
import 'package:miqat/core/service/api/quran_audio_api_service.dart';

class QuranAudioRepository {
  final QuranAudioApiService _apiService;
  final LocalJsonService localJsonService;
  final AudioPlayerService audioPlayerService;
  final AudioDownloadService audioDownloadService;
  final SharedPreferencesService sharedPreferencesService;

  QuranAudioRepository(
    this.sharedPreferencesService,
    this._apiService,
    this.audioPlayerService,
    this.localJsonService,
    this.audioDownloadService,
  );

  Future<ApiResult<List<ReciterModel>>> getReciters({
    String language = 'ar',
  }) async {
    try {
      final response = await _apiService.getReciters(
        language: language,
      );

      return ApiResult.success(
        response.reciters ?? [],
      );
    } catch (e) {
      return ApiResult.failure(
        NetworkExceptions.fromException(e),
      );
    }
  }

  Future<ApiResult<List<RadioModel>>> getRadios({
    String language = 'ar',
  }) async {
    try {
      final response = await _apiService.getRadios(
        language: language,
      );

      return ApiResult.success(
        response.radios ?? [],
      );
    } catch (e) {
      return ApiResult.failure(
        NetworkExceptions.fromException(e),
      );
    }
  }

  Future<List<SurahMetadataModel>> getSurahsMetadata() async {
    final jsonList = await localJsonService.loadJson(
      'asset/json/quran/metadata.json',
    );

    return jsonList
        .map(
          (json) => SurahMetadataModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }

  Future<List<QuranPageModel>> getQuranPages() async {
    final jsonList = await localJsonService.loadJson(
      'asset/json/quran/pagesQuran.json',
    );

    return jsonList
        .map((json) => QuranPageModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<int> getSurahStartPage(int surahNumber) async {
    final pages = await getQuranPages();

    final page = pages.firstWhere((page) {
      final startSurah = page.start?.surahNumber ?? 0;
      final endSurah = page.end?.surahNumber ?? 0;

      return surahNumber >= startSurah && surahNumber <= endSurah;
    });

    return page.page ?? 1;
  }

  Future<void> playAudio(
    String url, {
    required String title,
    String? artist,
    bool isRadio = false,
  }) async {
    await audioPlayerService.playFromUrl(
      url,
      title: title,
      artist: artist,
      isRadio: isRadio,
    );
  }

  Future<void> play() async {
    await audioPlayerService.play();
  }

  Future<void> pause() async {
    await audioPlayerService.pause();
  }

  Stream<bool> get playingStream => audioPlayerService.playingStream;
  bool get isPlaying => audioPlayerService.isPlaying;

  Future<String> downloadAudio({
    required String audioUrl,
    required String fileName,
  }) async {
    return await audioDownloadService.downloadAudio(
      audioUrl: audioUrl,
      fileName: fileName,
    );
  }

  Future<void> saveLastListening(LastListeningModel model) async {
    await sharedPreferencesService.saveLastListening(model: model);
  }

  Future<LastListeningModel?> getLastListening() async {
    return sharedPreferencesService.getLastListening();
  }

  Future<LastReadModel?> getLastRead() async {
    final lastReadPage = sharedPreferencesService.getLastReadPage();

    if (lastReadPage == null) {
      return null;
    }

    final pages = await getQuranPages();

    final page = pages.firstWhere((page) => page.page == lastReadPage);

    final surahNumber = page.start?.surahNumber;

    if (surahNumber == null) {
      return null;
    }

    final surahs = await getSurahsMetadata();

    final surah = surahs.firstWhere((surah) => surah.number == surahNumber);

    return LastReadModel(
      page: lastReadPage,
      surahNameAr: surah.name?.ar ?? '',
      surahNameEn: surah.name?.en ?? '',
    );
  }

  Stream<Duration> get positionStream => audioPlayerService.positionStream;

  Stream<Duration> get bufferedPositionStream =>
      audioPlayerService.bufferedPositionStream;

  Stream<Duration?> get durationStream => audioPlayerService.durationStream;

  Future<void> seek(Duration position) async {
    await audioPlayerService.seek(position);
  }

  Future<void> stop() async {
    await audioPlayerService.stop();
  }

  Future<void> setVolume(double volume) async {
    await audioPlayerService.setVolume(volume);
  }

  Stream<bool> get completedStream => audioPlayerService.completedStream;

  Set<int> getFavoriteSurahs() {
    return sharedPreferencesService.getFavoriteSurahs().map(int.parse).toSet();
  }

  Set<int> getFavoriteReciters() {
    return sharedPreferencesService
        .getFavoriteReciters()
        .map(int.parse)
        .toSet();
  }

  Set<int> getFavoriteRadios() {
    return sharedPreferencesService.getFavoriteRadios().map(int.parse).toSet();
  }

  Future<void> saveFavoriteSurahs(Set<int> ids) async {
    await sharedPreferencesService.saveFavoriteSurahs(
      ids.map((id) => id.toString()).toList(),
    );
  }

  Future<void> saveFavoriteReciters(Set<int> ids) async {
    await sharedPreferencesService.saveFavoriteReciters(
      ids.map((id) => id.toString()).toList(),
    );
  }

  Future<void> saveFavoriteRadios(Set<int> ids) async {
    await sharedPreferencesService.saveFavoriteRadios(
      ids.map((id) => id.toString()).toList(),
    );
  }
}
