import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/home/data/model/prayer_time_item_model.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key, required this.item, required this.time});

  final PrayerTimeItemModel item;
  final String time;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 80.h,
      child: Column(
        children: [
          Text(
            item.name(context),
            style: AppTextStyle.titleMedium.copyWith(color: AppColor.primary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3.h),
          Image.asset(
            item.image,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.contain,
            color: AppColor.secondary,
          ),
          SizedBox(height: 3.h),
          Text(
            time,
            style: AppTextStyle.titleMedium.copyWith(color: AppColor.primary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
