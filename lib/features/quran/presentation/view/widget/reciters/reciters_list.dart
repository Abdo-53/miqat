import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/widget/network_error_view.dart';
import 'package:miqat/features/quran/data/model/reciter_model.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/reciters/reciters_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/result_state.dart';
import 'package:miqat/features/quran/presentation/view/widget/moshafs/mushaf_bottom_sheet.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciter_tile.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciters_skeleton.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';
import 'package:miqat/generated/l10n.dart';

class RecitersList extends StatelessWidget {
  const RecitersList({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecitersCubit, ResultState<List<ReciterModel>>>(
      builder: (context, state) {
        return state.when(
          idle: () {
            return const SizedBox.shrink();
          },
          loading: () {
            return const RecitersSkeleton();
          },
          success: (reciters) {
            final query = searchQuery.trim().toLowerCase();

            final filteredReciters = query.isEmpty
                ? reciters
                : reciters.where((reciter) {
                    final name = reciter.name?.toLowerCase() ?? '';
                    return name.contains(query);
                  }).toList();

            if (filteredReciters.isEmpty) {
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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: .05),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    S.of(context).reciterCount(reciters.length),
                    style: AppTextStyle.bodySmall.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredReciters.length,
                    separatorBuilder: (_, _) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final reciter = filteredReciters[index];

                      return ReciterTile(
                        name: reciter.name ?? '',
                        mushafCount: '${reciter.moshaf?.length ?? 0} مصحف',
                        onTap: () {
                          final mushafs = reciter.moshaf ?? [];

                          if (mushafs.isEmpty) {
                            return;
                          }

                          if (mushafs.length == 1) {
                            context.pushNamed(
                              AppRouter.kSurahsView,
                              extra: SurahsViewArgs(
                                reciterId: reciter.id!,
                                reciterName: reciter.name ?? '',
                                mushaf: mushafs[0],
                              ),
                            );
                            return;
                          }

                          showMushafsBottomSheet(
                            context: context,
                            reciterId: reciter.id!,
                            reciterName: reciter.name ?? '',
                            mushafs: mushafs,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
          error: (exception) {
            return NetworkErrorView(
              exception: exception,
              onRetry: () {
                context.read<RecitersCubit>().getReciters();
              },
            );
          },
        );
      },
    );
  }
}
