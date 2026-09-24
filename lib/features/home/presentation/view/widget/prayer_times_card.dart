import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/helper/time_formatter.dart';
import 'package:miqat/features/home/data/model/prayer_time_item_model.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_state.dart';
import 'package:miqat/features/home/presentation/view/widget/prayer_current_status.dart';
import 'package:miqat/features/home/presentation/view/widget/prayer_time_item.dart';
import 'package:miqat/features/home/presentation/view/widget/prayer_times_skeleton.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Container(
        height: 230.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(color: colorScheme.primary.withValues(alpha: .12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 18.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Padding(
          padding: .symmetric(horizontal: 20.w, vertical: 14.h),
          child: BlocBuilder<PrayerCubit, PrayerState>(
            builder: (context, state) {
              if (state is PrayerLoading) {
                return const PrayerTimesSkeleton();
              }

              if (state is PrayerSuccess) {
                final timings = state.prayerTimesResponse.data.timings;

                final List<String> prayerTimes = [
                  timings.fajr,
                  timings.dhuhr,
                  timings.asr,
                  timings.maghrib,
                  timings.isha,
                ];

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: state.isRefreshing ? 0.45 : 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                            child: PrayerCurrentStatus(timings: timings),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Theme.of(context).dividerColor,
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 78.h,
                            child: Row(
                              children: List.generate(
                                PrayerTimeItemModel.items.length,
                                (index) {
                                  return Expanded(
                                    child: PrayerTimeItem(
                                      item: PrayerTimeItemModel.items[index],
                                      time: TimeFormatter.to12Hour(
                                        prayerTimes[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (state.isRefreshing)
                      SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: colorScheme.primary,
                        ),
                      ),
                  ],
                );
              }

              if (state is PrayerError) {
                return Center(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: colorScheme.primary,
                    size: 28.sp,
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
