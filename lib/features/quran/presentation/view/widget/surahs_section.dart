import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/model/surah_metadata_model.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_state.dart';
import 'package:miqat/features/quran/presentation/view/widget/mushaf_view_args.dart';
import 'package:miqat/features/quran/presentation/view/widget/surah_card.dart';
import 'package:miqat/generated/l10n.dart';

class SurahsSection extends StatelessWidget {
  const SurahsSection({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final repository = getIt<QuranAudioRepository>();

    return FutureBuilder<List<SurahMetadataModel>>(
      future: repository.getSurahsMetadata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: AppTextStyle.bodyMedium,
            ),
          );
        }

        final surahs = snapshot.data ?? [];

        final query = searchQuery.trim().toLowerCase();

        final filteredSurahs = query.isEmpty
            ? surahs
            : surahs.where((surah) {
                final arabicName = surah.name?.ar?.toLowerCase() ?? '';

                final englishName = surah.name?.en?.toLowerCase() ?? '';

                final transliteration =
                    surah.name?.transliteration?.toLowerCase() ?? '';

                return arabicName.contains(query) ||
                    englishName.contains(query) ||
                    transliteration.contains(query);
              }).toList();

        if (filteredSurahs.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noResultsFound,
              style: AppTextStyle.bodyMedium.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withValues(alpha: .6),
              ),
            ),
          );
        }
        return BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, favoriteState) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: filteredSurahs.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, index) {
                final surah = filteredSurahs[index];

                final surahNumber = surah.number ?? 0;

                final isFavorite = favoriteState.surahIds.contains(surahNumber);

                return SurahCard(
                  index: surahNumber,
                  title: surah.name?.ar ?? '',
                  subtitle:
                      '${surah.revelationPlace?.ar ?? ''} • '
                      '${surah.versesCount ?? 0} ${S.of(context).verses}',

                  leading: Container(
                    width: 41.w,
                    height: 41.h,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                      child: Text(
                        '$surahNumber',
                        style: AppTextStyle.heading3.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  trailing: IconButton(
                    onPressed: surah.number == null
                        ? null
                        : () {
                            context.read<FavoriteCubit>().toggleSurahFavorite(
                              surahNumber,
                            );
                          },
                    icon: FaIcon(
                      isFavorite
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      color: AppColor.primary,
                      size: 20.sp,
                    ),
                  ),

                  onTap: () async {
                    final startPage = await repository.getSurahStartPage(
                      surahNumber,
                    );

                    if (!context.mounted) return;

                    context.pushNamed(
                      AppRouter.kMushafView,
                      extra: MushafViewArgs(
                        startPage: startPage,
                        surahName: surah.name?.ar ?? '',
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
