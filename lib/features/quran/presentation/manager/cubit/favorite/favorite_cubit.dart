import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.repository) : super(const FavoriteState()) {
    loadFavorites();
  }

  final QuranAudioRepository repository;

  void loadFavorites() {
    emit(
      FavoriteState(
        surahIds: repository.getFavoriteSurahs(),
        reciterIds: repository.getFavoriteReciters(),
        radioIds: repository.getFavoriteRadios(),
      ),
    );
  }

  bool isSurahFavorite(int id) {
    return state.surahIds.contains(id);
  }

  bool isReciterFavorite(int id) {
    return state.reciterIds.contains(id);
  }

  bool isRadioFavorite(int id) {
    return state.radioIds.contains(id);
  }

  Future<void> toggleSurahFavorite(int id) async {
    final updatedIds = Set<int>.from(state.surahIds);

    updatedIds.contains(id) ? updatedIds.remove(id) : updatedIds.add(id);

    await repository.saveFavoriteSurahs(updatedIds);

    emit(state.copyWith(surahIds: updatedIds));
  }

  Future<void> toggleReciterFavorite(int id) async {
    final updatedIds = Set<int>.from(state.reciterIds);

    updatedIds.contains(id) ? updatedIds.remove(id) : updatedIds.add(id);

    await repository.saveFavoriteReciters(updatedIds);

    emit(state.copyWith(reciterIds: updatedIds));
  }

  Future<void> toggleRadioFavorite(int id) async {
    final updatedIds = Set<int>.from(state.radioIds);

    updatedIds.contains(id) ? updatedIds.remove(id) : updatedIds.add(id);

    await repository.saveFavoriteRadios(updatedIds);

    emit(state.copyWith(radioIds: updatedIds));
  }
}
