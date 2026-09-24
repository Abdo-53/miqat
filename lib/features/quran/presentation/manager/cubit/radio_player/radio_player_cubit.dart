import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/home/data/model/last_listening_model.dart';
import 'package:miqat/features/home/data/model/listening_type.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';

import 'radio_player_state.dart';

class RadioPlayerCubit extends Cubit<RadioPlayerState> {
  RadioPlayerCubit(this.repository) : super(const RadioPlayerState()) {
    _listenToPlayingState();
  }

  final QuranAudioRepository repository;

  StreamSubscription<bool>? _playingSubscription;

  void _listenToPlayingState() {
    _playingSubscription = repository.playingStream.listen((isPlaying) {
      if (isClosed) return;

      emit(state.copyWith(isPlaying: isPlaying));
    });
  }

  void selectRadio(RadioModel radio) {
    if (isClosed) return;

    emit(state.copyWith(selectedRadio: radio));
  }

  Future<void> playRadio(RadioModel radio) async {
    final url = radio.url;

    if (url == null || url.isEmpty) return;

    selectRadio(radio);
    await repository.saveLastListening(
      LastListeningModel(
        type: ListeningType.radio,
        title: radio.name ?? '',
        subtitle: '',
        url: url,
        radioId: radio.id,
      ),
    );
    getIt<HomeContinueCubit>().refresh();

    await repository.playAudio(
      url,
      title: radio.name ?? '',
      isRadio: true,
    );
  }

  Future<void> togglePlayStop() async {
    if (repository.isPlaying) {
      await repository.stop();
      return;
    }

    final radio = state.selectedRadio;

    if (radio == null) return;

    final url = radio.url;

    if (url == null || url.isEmpty) return;

    await repository.playAudio(
      url,
      title: radio.name ?? '',
      isRadio: true,
    );
  }

  Future<void> toggleMute() async {
    final newMutedState = !state.isMuted;

    await repository.setVolume(newMutedState ? 0.0 : 1.0);

    if (isClosed) return;

    emit(state.copyWith(isMuted: newMutedState));
  }

  @override
  Future<void> close() async {
    await _playingSubscription?.cancel();

    return super.close();
  }
}
