import 'package:miqat/core/service/audio_handler.dart';

class AudioPlayerService {
  final MiqatAudioHandler _audioHandler = MiqatAudioHandler.instance;

  Future<void> playFromUrl(
    String url, {
    required String title,
    String? artist,
    String? artUri,
    bool isRadio = false,
  }) async {
    await _audioHandler.playFromUrl(
      url,
      title: title,
      artist: artist,
      artUri: artUri,
      isRadio: isRadio,
    );
  }

  Stream<bool> get completedStream => _audioHandler.completedStream;

  Stream<bool> get playingStream => _audioHandler.playingStream;

  bool get isPlaying => _audioHandler.isPlaying;

  Future<void> pause() async {
    await _audioHandler.pause();
  }

  Future<void> play() async {
    await _audioHandler.play();
  }

  Future<void> stop() async {
    await _audioHandler.stop();
  }

  Future<void> setVolume(double volume) async {
    await _audioHandler.setVolume(volume);
  }

  Stream<Duration> get positionStream => _audioHandler.positionStream;

  Stream<Duration> get bufferedPositionStream =>
      _audioHandler.bufferedPositionStream;

  Stream<Duration?> get durationStream => _audioHandler.durationStream;

  Future<void> seek(Duration position) async {
    await _audioHandler.seek(position);
  }
}