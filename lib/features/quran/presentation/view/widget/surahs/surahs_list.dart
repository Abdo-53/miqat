import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/model/surah_metadata_model.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/player/player_cubit.dart';
import 'package:miqat/features/quran/presentation/view/widget/surah_card.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';
import 'package:miqat/generated/l10n.dart';

class SurahsList extends StatelessWidget {
  const SurahsList({super.key, required this.args, required this.searchQuery});

  final SurahsViewArgs args;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final surahNumbers = (args.mushaf.surahList ?? '')
        .split(',')
        .map((e) => int.tryParse(e.trim()))
        .whereType<int>()
        .toSet();

    return FutureBuilder<List<SurahMetadataModel>>(
      future: getIt<QuranAudioRepository>().getSurahsMetadata(),
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

        final availableSurahs = allSurahs
            .where((surah) => surahNumbers.contains(surah.number))
            .toList();

        final query = searchQuery.trim().toLowerCase();

        final filteredSurahs = query.isEmpty
            ? availableSurahs
            : availableSurahs.where((surah) {
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

        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: filteredSurahs.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final surah = filteredSurahs[index];

            return SurahCard(
              index: surah.number ?? 0,
              title: surah.name?.ar ?? '',
              subtitle: '${surah.versesCount ?? 0} ${S.of(context).verses}',

              leading: Container(
                width: 41.w,
                height: 41.h,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Text(
                    '${surah.number ?? ''}',
                    style: AppTextStyle.heading3.copyWith(color: Colors.black),
                  ),
                ),
              ),

              trailing: Icon(
                FontAwesomeIcons.headphones,
                color: AppColor.primary,
                size: 24.sp,
              ),

              onTap: () {
                context.read<PlayerCubit>().playSurah(
                  surah: surah,
                  server: args.mushaf.server ?? '',

                  surahs: availableSurahs,
                  reciterId: args.reciterId,
                  reciterName: args.reciterName,

                  moshafId: args.mushaf.id ?? 0,
                  moshafName: args.mushaf.name ?? '',
                );
              },
            );
          },
        );
      },
    );
  }
}
