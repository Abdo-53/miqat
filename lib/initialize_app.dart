import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:miqat/core/service/audio_handler.dart';
import 'package:miqat/core/service/database/local_database_service.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/local_notifications_service.dart';

Future<void> initializeApp() async {
  await setupServiceInjection();

  await getIt<LocalNotificationsService>().initialize();

  await getIt<LocalNotificationsService>().requestNotificationPermission();

  await AudioService.init(
    builder: () => MiqatAudioHandler.instance,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.miqat.audio',
      androidNotificationChannelName: 'Miqat Audio',
      androidNotificationOngoing: true,
    ),
  );

  await getIt<LocalDatabaseService>().init();

  if (Platform.isAndroid) {
    await MediaStore.ensureInitialized();
    MediaStore.appFolder = 'Miqat';
  }
}
