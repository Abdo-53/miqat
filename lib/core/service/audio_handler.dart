import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MiqatAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  MiqatAudioHandler._() {
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
  }

  static final MiqatAudioHandler instance = MiqatAudioHandler._();

  final AudioPlayer _player = AudioPlayer();

  Future<void> Function()? _onNext;
  Future<void> Function()? _onPrevious;

  bool _isRadio = false;
  String? _currentUrl;
  bool _isLoading = false;
  int _playRequestId = 0;

  void setQueueControls({
    required Future<void> Function() onNext,
    required Future<void> Function() onPrevious,
  }) {
    _onNext = onNext;
    _onPrevious = onPrevious;
  }

  void clearQueueControls() {
    _onNext = null;
    _onPrevious = null;
  }

  @override
  Future<void> onTaskRemoved() async {
    await _player.stop();
    await super.onTaskRemoved();
  }

  Future<void> playFromUrl(
    String url, {
    required String title,
    String? artist,
    String? artUri,
    bool isRadio = false,
  }) async {
    final requestId = ++_playRequestId;

    if (_isLoading) return;

    _isLoading = true;

    try {
      _isRadio = isRadio;
      _currentUrl = url;

      await _player.setUrl(url);

      if (requestId != _playRequestId) return;

      mediaItem.add(
        MediaItem(
          id: url,
          title: title,
          artist: artist,
          artUri: artUri != null ? Uri.parse(artUri) : null,
          duration: _player.duration,
        ),
      );
    } on PlayerInterruptedException {
      return;
    } finally {
      _isLoading = false;
    }

    if (requestId != _playRequestId) return;

    await play();
  }

  Stream<bool> get playingStream =>
      _player.playerStateStream.map((state) => state.playing);

  Stream<bool> get completedStream => _player.playerStateStream.map(
    (state) => state.processingState == ProcessingState.completed,
  );

  bool get isPlaying => _player.playing;

  Stream<Duration> get positionStream => _player.positionStream;

  Stream<Duration> get bufferedPositionStream => _player.bufferedPositionStream;

  Stream<Duration?> get durationStream => _player.durationStream;

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  @override
  Future<void> play() async {
    if (_currentUrl == null) return;

    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> skipToNext() async {
    if (_isRadio) return;

    await _onNext?.call();
  }

  @override
  Future<void> skipToPrevious() async {
    if (_isRadio) return;

    await _onPrevious?.call();
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    final processingState = _player.processingState;

    final controls = <MediaControl>[
      if (!_isRadio) MediaControl.skipToPrevious,
      if (_player.playing) MediaControl.pause else MediaControl.play,
      if (!_isRadio) MediaControl.skipToNext,
      MediaControl.stop,
    ];

    return PlaybackState(
      controls: controls,
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: _isRadio ? const [0, 1] : const [0, 1, 2],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
