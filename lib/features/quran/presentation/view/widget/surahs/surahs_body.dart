import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/widget/app_search_field.dart';
import 'package:miqat/core/widget/app_snack_bar.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_state.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/player/player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/player/player_state.dart';
import 'package:miqat/features/quran/presentation/view/widget/player/current_recitation_card.dart';
import 'package:miqat/features/quran/presentation/view/widget/player/player_controls.dart';
import 'package:miqat/features/quran/presentation/view/widget/player/player_progress.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';
import 'package:miqat/generated/l10n.dart';

import 'surahs_list.dart';

class SurahsBody extends StatefulWidget {
  const SurahsBody(this.args, {super.key});

  final SurahsViewArgs args;

  @override
  State<SurahsBody> createState() => _SurahsBodyState();
}

class _SurahsBodyState extends State<SurahsBody> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final args = widget.args;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        children: [
          AppSearchField(
            hintText: S.of(context).searchSurah,
            onChanged: (value) {
              setState(() {
                searchQuery = value.trim();
              });
            },
          ),

          SizedBox(height: 18.h),

          Expanded(
            child: SurahsList(args: args, searchQuery: searchQuery),
          ),

          SizedBox(height: 16.h),

          Divider(color: Theme.of(context).dividerColor, height: 1),

          SizedBox(height: 16.h),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, favoriteState) {
              return BlocBuilder<PlayerCubit, PlayerState>(
                builder: (context, state) {
                  final selectedSurah = state.selectedSurah;

                  final isFavorite = favoriteState.reciterIds.contains(
                    args.reciterId,
                  );

                  return CurrentRecitationCard(
                    reciterName: args.reciterName,
                    mushafName: args.mushaf.name ?? '',
                    surahName:
                        selectedSurah?.name?.ar ?? S.of(context).selectSurah,
                    versesCount: selectedSurah?.versesCount ?? 0,

                    isFavorite: isFavorite,

                    isRepeatEnabled: state.isRepeatEnabled,

                    onRepeat: () {
                      context.read<PlayerCubit>().toggleRepeat();
                    },

                    onFavorite: () {
                      context.read<FavoriteCubit>().toggleReciterFavorite(
                        args.reciterId,
                      );
                    },

                    onDownload: () async {
                      if (selectedSurah == null) return;

                      AppSnackBar.show(
                        context,
                        message: S.of(context).downloadingSurah,
                        icon: Icons.download_rounded,
                        duration: const Duration(days: 1),
                      );

                      await context.read<PlayerCubit>().downloadSurah(
                        surah: selectedSurah,
                        server: args.mushaf.server ?? '',
                      );

                      if (!context.mounted) return;

                      AppSnackBar.show(
                        context,
                        message: S.of(context).surahDownloadedSuccessfully,
                        icon: Icons.check_circle_outline_rounded,
                      );
                    },
                  );
                },
              );
            },
          ),

          SizedBox(height: 14.h),

          BlocBuilder<PlayerCubit, PlayerState>(
            builder: (context, state) {
              return AudioProgress(
                progress: state.position,
                buffered: state.bufferedPosition,
                total: state.duration,
                onSeek: (duration) {
                  context.read<PlayerCubit>().seek(duration);
                },
              );
            },
          ),

          SizedBox(height: 12.h),

          BlocBuilder<PlayerCubit, PlayerState>(
            builder: (context, state) {
              return PlayerControls(
                isPlaying: state.isPlaying,
                onPlayPause: () {
                  context.read<PlayerCubit>().togglePlayPause();
                },
                onNext: () {
                  context.read<PlayerCubit>().playNext();
                },
                onPrevious: () {
                  context.read<PlayerCubit>().playPrevious();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
