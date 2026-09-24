import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_state.dart';
import 'package:miqat/generated/l10n.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 275.h,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppAsset.islamicPattern,
                  fit: BoxFit.cover,
                  color: AppColor.secondary.withValues(alpha: .22),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  height: 150.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).home_greeting,
                            style: AppTextStyle.titleLarge.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          BlocBuilder<PrayerCubit, PrayerState>(
                            builder: (context, state) {
                              if (state is! PrayerSuccess) {
                                return const SizedBox.shrink();
                              }

                              final date = state.prayerTimesResponse.data.date;

                              final gregorian = date.gregorian;
                              final hijri = date.hijri;

                              final gregorianMonth = _getGregorianMonth(
                                context,
                                gregorian.month.number,
                              );

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${gregorian.day} $gregorianMonth ${gregorian.year}',
                                    style: AppTextStyle.bodyMedium.copyWith(
                                      color: colorScheme.onPrimary.withValues(
                                        alpha: .85,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    '${hijri.day} ${hijri.month.ar} ${hijri.year}',
                                    style: AppTextStyle.bodyMedium.copyWith(
                                      color: colorScheme.onPrimary.withValues(
                                        alpha: .85,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),

                      Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          color: colorScheme.surface.withValues(alpha: .18),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorScheme.onPrimary.withValues(alpha: .18),
                          ),
                        ),
                        child: Icon(
                          Icons.person_outline_rounded,
                          color: colorScheme.onPrimary,
                          size: 27.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _getGregorianMonth(BuildContext context, int month) {
  switch (month) {
    case 1:
      return S.of(context).month_january;
    case 2:
      return S.of(context).month_february;
    case 3:
      return S.of(context).month_march;
    case 4:
      return S.of(context).month_april;
    case 5:
      return S.of(context).month_may;
    case 6:
      return S.of(context).month_june;
    case 7:
      return S.of(context).month_july;
    case 8:
      return S.of(context).month_august;
    case 9:
      return S.of(context).month_september;
    case 10:
      return S.of(context).month_october;
    case 11:
      return S.of(context).month_november;
    case 12:
      return S.of(context).month_december;
    default:
      return '';
  }
}
