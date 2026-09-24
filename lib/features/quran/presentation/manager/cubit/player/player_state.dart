import 'package:miqat/core/model/surah_metadata_model.dart';

class PlayerState {
  final SurahMetadataModel? selectedSurah;
  final bool isPlaying;

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
  final bool isRepeatEnabled;

  const PlayerState({
    this.isRepeatEnabled = false,
    this.selectedSurah,
    required this.isPlaying,
    this.position = Duration.zero,
    this.bufferedPosition = Duration.zero,
    this.duration = Duration.zero,
  });

  PlayerState copyWith({
    SurahMetadataModel? selectedSurah,
    bool? isPlaying,
    bool? isRepeatEnabled,
    Duration? position,
    Duration? bufferedPosition,
    Duration? duration,
  }) {
    return PlayerState(
      isRepeatEnabled: isRepeatEnabled ?? this.isRepeatEnabled,
      selectedSurah: selectedSurah ?? this.selectedSurah,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      bufferedPosition: bufferedPosition ?? this.bufferedPosition,
      duration: duration ?? this.duration,
    );
  }
}
