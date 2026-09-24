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
import 'package:miqat/features/quran/presentation/view/widget/favorites/empty_favorite.dart';
import 'package:miqat/features/quran/presentation/view/widget/mushaf_view_args.dart';
import 'package:miqat/features/quran/presentation/view/widget/surah_card.dart';

import 'package:miqat/generated/l10n.dart';

class FavoriteSurahs extends StatelessWidget {
  const FavoriteSurahs({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = getIt<QuranAudioRepository>();

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, favoriteState) {
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

            final allSurahs = snapshot.data ?? [];

            final favoriteSurahs = allSurahs.where((surah) {
              final id = surah.number;

              if (id == null) return false;

              return favoriteState.surahIds.contains(id);
            }).toList();

            if (favoriteSurahs.isEmpty) {
              return EmptyFavorite(message: S.of(context).noFavoritesSurahs);
            }

            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteSurahs.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final surah = favoriteSurahs[index];
                final surahNumber = surah.number ?? 0;

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
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleSurahFavorite(
                        surahNumber,
                      );
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.solidHeart,
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
