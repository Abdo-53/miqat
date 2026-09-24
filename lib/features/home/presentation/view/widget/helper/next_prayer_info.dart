import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/home/data/model/next_prayer_model.dart';
import 'package:miqat/generated/l10n.dart';

class NextPrayerInfo extends StatelessWidget {
  const NextPrayerInfo({super.key, required this.nextPrayer});

  final NextPrayerModel nextPrayer;

  String _getPrayerName(BuildContext context) {
    switch (nextPrayer.prayer) {
      case PrayerType.fajr:
        return S.of(context).home_fajr;

      case PrayerType.dhuhr:
        return S.of(context).home_dhr;

      case PrayerType.asr:
        return S.of(context).home_asr;

      case PrayerType.maghrib:
        return S.of(context).home_mghrb;

      case PrayerType.isha:
        return S.of(context).home_isa;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
        children: [
          Text(
            S.of(context).home_nextPrayer,
            style: AppTextStyle.bodyLarge.copyWith(color: AppColor.primary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            _getPrayerName(context),
            style: AppTextStyle.heading1.copyWith(color: AppColor.primary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
