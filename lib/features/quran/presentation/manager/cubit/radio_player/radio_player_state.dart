import 'package:miqat/features/quran/data/model/radio_model.dart';

class RadioPlayerState {
  final RadioModel? selectedRadio;
  final bool isPlaying;
  final bool isMuted;

  const RadioPlayerState({
    this.selectedRadio,
    this.isPlaying = false,
    this.isMuted = false,
  });

  RadioPlayerState copyWith({
    RadioModel? selectedRadio,
    bool? isPlaying,
    bool? isMuted,
  }) {
    return RadioPlayerState(
      selectedRadio: selectedRadio ?? this.selectedRadio,
      isPlaying: isPlaying ?? this.isPlaying,
      isMuted: isMuted ?? this.isMuted,
    );
  }
}
