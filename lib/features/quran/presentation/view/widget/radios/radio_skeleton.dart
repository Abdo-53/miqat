import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/features/quran/presentation/view/widget/radios/radio_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RadiosSkeleton extends StatelessWidget {
  const RadiosSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColor.primary.withValues(alpha: .05),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              '000  aaaaaaaa',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, index) {
                return RadioTile(
                  isFavorite: false,
                  onFavorite: () {},
                  name: 'إذاعة القرآن الكريم',
                  isPlaying: false,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
