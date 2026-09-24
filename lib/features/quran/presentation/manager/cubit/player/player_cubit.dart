import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/model/surah_metadata_model.dart';
import 'package:miqat/core/service/audio_handler.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/home/data/model/last_listening_model.dart';
import 'package:miqat/features/home/data/model/listening_type.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';
import 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
PlayerCubit(this.repository) : super(const PlayerState(isPlaying: false)) {
    _listenToPlayingState();
    _listenToProgress();
    _listenToCompletion();

    MiqatAudioHandler.instance.setQueueControls(
      onNext: playNext,
      onPrevious: playPrevious,
    );
  }
  String _reciterName = '';
  String _moshafName = '';

  int? _reciterId;
  int? _moshafId;

  final QuranAudioRepository repository;
  List<SurahMetadataModel> _surahs = [];
  String _server = '';

  StreamSubscription<bool>? _playingSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _bufferedPositionSubscription;
  StreamSubscription<Duration?>? _durationSubscription;
  StreamSubscription<bool>? _completedSubscription;

  void _listenToPlayingState() {
    _playingSubscription = repository.playingStream.listen((isPlaying) {
      emit(state.copyWith(isPlaying: isPlaying));
    });
  }

  void _listenToCompletion() {
    _completedSubscription = repository.completedStream.listen((
      completed,
    ) async {
      if (!completed) return;

      if (state.isRepeatEnabled) {
        await repository.seek(Duration.zero);
        await repository.play();
      } else {
        await playNext();
      }
    });
  }

  void toggleRepeat() {
    emit(state.copyWith(isRepeatEnabled: !state.isRepeatEnabled));
  }

  void _listenToProgress() {
    _positionSubscription = repository.positionStream.listen((position) {
      emit(state.copyWith(position: position));
    });

    _bufferedPositionSubscription = repository.bufferedPositionStream.listen((
      bufferedPosition,
    ) {
      emit(state.copyWith(bufferedPosition: bufferedPosition));
    });

    _durationSubscription = repository.durationStream.listen((duration) {
      emit(state.copyWith(duration: duration ?? Duration.zero));
    });
  }

  void selectSurah(SurahMetadataModel surah) {
    emit(state.copyWith(selectedSurah: surah));
  }

  Future<void> seek(Duration position) async {
    await repository.seek(position);
  }

  String buildAudioUrl({required String server, required int surahNumber}) {
    final formattedNumber = surahNumber.toString().padLeft(3, '0');

    final normalizedServer = server.endsWith('/') ? server : '$server/';

    return '$normalizedServer$formattedNumber.mp3';
  }

  Future<void> playSurah({
    required SurahMetadataModel surah,
    required String server,
    required List<SurahMetadataModel> surahs,
    required int reciterId,
    required int moshafId,
    required String reciterName,
    required String moshafName,
  }) async {
    _surahs = surahs;
    _server = server;

    _reciterId = reciterId;
    _moshafId = moshafId;

    _reciterName = reciterName;
    _moshafName = moshafName;

    await _playSurah(surah);
  }

  Future<void> downloadSurah({
    required SurahMetadataModel surah,
    required String server,
  }) async {
    final audioUrl = buildAudioUrl(
      server: server,
      surahNumber: surah.number ?? 0,
    );

    final fileName = '${surah.number}_${surah.name?.ar ?? 'surah'}';

    await repository.downloadAudio(audioUrl: audioUrl, fileName: fileName);
  }

  Future<void> togglePlayPause() async {
    if (repository.isPlaying) {
      await repository.pause();
    } else {
      await repository.play();
    }
  }

  Future<void> _playSurah(SurahMetadataModel surah) async {
    selectSurah(surah);

    final audioUrl = buildAudioUrl(
      server: _server,
      surahNumber: surah.number ?? 0,
    );

    await repository.saveLastListening(
      LastListeningModel(
        type: ListeningType.recitation,
        title: _reciterName,
        subtitle: _moshafName,
        url: audioUrl,
        reciterId: _reciterId,
        moshafId: _moshafId,
        surahNumber: surah.number,
      ),
    );
    getIt<HomeContinueCubit>().refresh();

  await repository.playAudio(
      audioUrl,
      title: surah.name?.ar ?? '',
      artist: _reciterName,
    );
  }

  Future<void> playNext() async {
    final currentSurah = state.selectedSurah;

    if (currentSurah == null || _surahs.isEmpty) return;

    final currentIndex = _surahs.indexWhere(
      (surah) => surah.number == currentSurah.number,
    );

    if (currentIndex == -1) return;

    final nextIndex = currentIndex + 1;

    if (nextIndex >= _surahs.length) return;

    await _playSurah(_surahs[nextIndex]);
  }

  Future<void> playPrevious() async {
    final currentSurah = state.selectedSurah;

    if (currentSurah == null || _surahs.isEmpty) return;

    final currentIndex = _surahs.indexWhere(
      (surah) => surah.number == currentSurah.number,
    );

    if (currentIndex == -1) return;

    final previousIndex = currentIndex - 1;

    if (previousIndex < 0) return;

    await _playSurah(_surahs[previousIndex]);
  }

  @override
  Future<void> close() async {
    await _playingSubscription?.cancel();
    await _positionSubscription?.cancel();
    await _bufferedPositionSubscription?.cancel();
    await _durationSubscription?.cancel();
    await _completedSubscription?.cancel();
    MiqatAudioHandler.instance.clearQueueControls();
    return super.close();
  }
}
