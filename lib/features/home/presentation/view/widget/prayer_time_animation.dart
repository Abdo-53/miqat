import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/features/home/presentation/view/widget/helper/prayer_day_period.dart';

class PrayerTimeAnimation extends StatelessWidget {
  const PrayerTimeAnimation({super.key, required this.period});

  final PrayerDayPeriod period;

  @override
  Widget build(BuildContext context) {
    final config = _getAnimationConfig();

    return SizedBox(
      width: 80.w,
      height: 80.h,
      child: Transform.scale(
        scale: config.scale,
        child: Lottie.asset(config.asset, fit: BoxFit.contain, repeat: true),
      ),
    );
  }

  _PrayerAnimationConfig _getAnimationConfig() {
    switch (period) {
      case PrayerDayPeriod.sunrise:
        return const _PrayerAnimationConfig(
          asset: AppAsset.morningAnimation,
          scale: 1,
        );

      case PrayerDayPeriod.day:
        return const _PrayerAnimationConfig(
          asset: AppAsset.dayAnimation,
          scale: 1,
        );

      case PrayerDayPeriod.evening:
        return const _PrayerAnimationConfig(
          asset: AppAsset.sunsetAnimation,
          scale: 1,
        );

      case PrayerDayPeriod.night:
        return const _PrayerAnimationConfig(
          asset: AppAsset.nightAnimation,
          scale: .75,
        );
    }
  }
}

class _PrayerAnimationConfig {
  final String asset;
  final double scale;

  const _PrayerAnimationConfig({required this.asset, required this.scale});
}
