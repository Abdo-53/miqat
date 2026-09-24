import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:miqat/core/helper/cubit/localization_cubit.dart';
import 'package:miqat/core/helper/cubit/theme_cubit.dart';
import 'package:miqat/core/service/api/create_and_setup_dio.dart';
import 'package:miqat/core/service/api/prayer_api_service.dart';
import 'package:miqat/core/service/api/quran_audio_api_service.dart';
import 'package:miqat/core/service/audio_download_service.dart';
import 'package:miqat/core/service/audio_player_service.dart';
import 'package:miqat/core/service/compass_service.dart';
import 'package:miqat/core/service/local_json_service.dart';
import 'package:miqat/core/service/database/local_database_service.dart';
import 'package:miqat/core/service/local_notifications_service.dart';
import 'package:miqat/core/service/location_service.dart';
import 'package:miqat/core/service/miqat_notification_service.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/azkar/data/repo/azkar_repo.dart';
import 'package:miqat/features/azkar/presentation/manager/cubit/azkar_cubit.dart';
import 'package:miqat/features/home/data/repo/prayer_repository.dart';
import 'package:miqat/features/home/data/repo/qibla_repository.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/qibla_cubit.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/player/player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radios/radios_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/reciters/reciters_cubit.dart';
import 'package:miqat/features/taspeeh/data/repository/taspeeh_repo.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miqat/core/service/url_launcher_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  //  ** register Singleton  **
  getIt.registerSingleton<SharedPreferencesService>(
    SharedPreferencesService(sharedPreferences),
  );
  getIt.registerSingleton<LocalDatabaseService>(LocalDatabaseService());

  //  ** register LazySingleton  **
  getIt.registerLazySingleton<Dio>(
    () => CreateAndSetupDio().createAndSetupDio(),
  );
  getIt.registerLazySingleton<PrayerRepository>(
    () => PrayerRepository(getIt(), getIt(), getIt()),
  );
  getIt.registerLazySingleton<QuranAudioApiService>(
    () => QuranAudioApiService(getIt()),
  );
  getIt.registerLazySingleton<LocalNotificationsService>(
    () => LocalNotificationsService(),
  );
  getIt.registerLazySingleton<MiqatNotificationService>(
    () => MiqatNotificationService(
      getIt<LocalNotificationsService>(),
      getIt<SharedPreferencesService>(),
    ),
  );

  getIt.registerLazySingleton<LocationService>(() => LocationService());

  getIt.registerLazySingleton<LocalJsonService>(() => const LocalJsonService());

  getIt.registerLazySingleton<QuranAudioRepository>(
    () => QuranAudioRepository(getIt(), getIt(), getIt(), getIt(), getIt()),
  );
  getIt.registerLazySingleton<AudioPlayerService>(() => AudioPlayerService());
  getIt.registerLazySingleton<UrlLauncherService>(() => UrlLauncherService());

  getIt.registerLazySingleton<TaspeehRepo>(
    () => TaspeehRepo(localDatabaseService: getIt()),
  );
  getIt.registerLazySingleton<AudioDownloadService>(
    () => AudioDownloadService(getIt()),
  );
  getIt.registerLazySingleton<PrayerApiService>(
    () => PrayerApiService(getIt()),
  );
  getIt.registerLazySingleton<HomeContinueCubit>(
    () => HomeContinueCubit(getIt<QuranAudioRepository>()),
  );
  getIt.registerLazySingleton<AzkarRepo>(() => AzkarRepo(getIt()));
  getIt.registerLazySingleton<RadioPlayerCubit>(
    () => RadioPlayerCubit(getIt()),
  );
  getIt.registerLazySingleton<CompassService>(() => CompassService());
  getIt.registerLazySingleton<QiblaRepository>(
    () => QiblaRepository(
      locationService: getIt<LocationService>(),
      compassService: getIt<CompassService>(),
    ),
  );
  //  ** register Cubit **
  getIt.registerFactory<TaspeehCubit>(() => TaspeehCubit(getIt()));

  getIt.registerFactory<AzkarCubit>(() => AzkarCubit(getIt()));

  getIt.registerFactory<ThemeCubit>(() => ThemeCubit(getIt()));

  getIt.registerFactory<LocalizationCubit>(() => LocalizationCubit(getIt()));

  getIt.registerFactory<RecitersCubit>(() => RecitersCubit(getIt()));

  getIt.registerFactory<RadiosCubit>(() => RadiosCubit(getIt()));
  getIt.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(getIt<QuranAudioRepository>()),
  );
  getIt.registerFactory<PrayerCubit>(() => PrayerCubit(getIt()));
  getIt.registerFactory<PlayerCubit>(() => PlayerCubit(getIt()));
  getIt.registerFactory<QiblaCubit>(
    () => QiblaCubit(repository: getIt<QiblaRepository>()),
  );
}
