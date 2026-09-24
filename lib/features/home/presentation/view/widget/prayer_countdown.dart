import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class PrayerCountdown extends StatelessWidget {
  const PrayerCountdown({super.key, required this.remainingTime});

  final Duration remainingTime;

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');

    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 80.h,
      child: Column(
        children: [
          Text(
            S.of(context).home_remainingTime,
            style: AppTextStyle.bodyLarge.copyWith(color: AppColor.primary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            _formatDuration(remainingTime),
            style: AppTextStyle.displayMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
