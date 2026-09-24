import 'dart:io';

import 'package:dio/dio.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:path_provider/path_provider.dart';

class AudioDownloadService {
  AudioDownloadService(this.dio);

  final Dio dio;

  final MediaStore _mediaStore = MediaStore();

  Future<String> downloadAudio({
    required String audioUrl,
    required String fileName,
  }) async {
    final tempDirectory = await getTemporaryDirectory();

    final tempFilePath = '${tempDirectory.path}/$fileName.mp3';

    await dio.download(audioUrl, tempFilePath);

    final saveInfo = await _mediaStore.saveFile(
      tempFilePath: tempFilePath,
      dirType: DirType.audio,
      dirName: DirName.music,
      relativePath: 'Miqat',
    );

    if (saveInfo == null) {
      final tempFile = File(tempFilePath);

      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      throw Exception('Failed to save audio file');
    }

    return saveInfo.uri.toString();
  }
}
