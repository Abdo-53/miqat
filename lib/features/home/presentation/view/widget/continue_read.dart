import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_state.dart';
import 'package:miqat/features/home/presentation/view/widget/continue_card.dart';
import 'package:miqat/features/quran/presentation/view/widget/mushaf_view_args.dart';
import 'package:miqat/generated/l10n.dart';

class ContinueRead extends StatelessWidget {
  const ContinueRead({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContinueCubit, HomeContinueState>(
      builder: (context, state) {
        final lastRead = state.lastRead;

        final isArabic = Localizations.localeOf(context).languageCode == 'ar';

        final String? surahName = lastRead == null
            ? null
            : isArabic
            ? 'سورة ${lastRead.surahNameAr}'
            : 'Surah ${lastRead.surahNameEn}';

        return ContinueCard(
          title: S.of(context).home_continueReading,

          primaryText: lastRead == null
              ? S.of(context).home_noReadingYet
              : surahName!,

          secondaryText: lastRead == null
              ? null
              : '${S.of(context).page} ${lastRead.page}',

          icon: Image.asset(
            AppAsset.quran,
            width: 20.r,
            height: 20.r,
            color: AppColor.primary,
          ),

          onTap: lastRead == null
              ? null
              : () {
                  context.pushNamed(
                    AppRouter.kMushafView,
                    extra: MushafViewArgs(
                      startPage: lastRead.page,
                      surahName: surahName ?? '',
                    ),
                  );
                },
        );
      },
    );
  }
}
