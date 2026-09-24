class FavoriteState {
  final Set<int> surahIds;
  final Set<int> reciterIds;
  final Set<int> radioIds;

  const FavoriteState({
    this.surahIds = const {},
    this.reciterIds = const {},
    this.radioIds = const {},
  });

  FavoriteState copyWith({
    Set<int>? surahIds,
    Set<int>? reciterIds,
    Set<int>? radioIds,
  }) {
    return FavoriteState(
      surahIds: surahIds ?? this.surahIds,
      reciterIds: reciterIds ?? this.reciterIds,
      radioIds: radioIds ?? this.radioIds,
    );
  }
}
