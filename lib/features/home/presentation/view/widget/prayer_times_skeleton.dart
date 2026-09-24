import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PrayerTimesSkeleton extends StatelessWidget {
  const PrayerTimesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: AppColor.primary.withValues(alpha: 0.10),
        highlightColor: AppColor.primary.withValues(alpha: 0.22),
        duration: const Duration(milliseconds: 1200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remaining time
              Column(
                children: [
                  Bone(
                    width: 90.w,
                    height: 14.h,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  SizedBox(height: 10.h),
                  Bone(
                    width: 105.w,
                    height: 28.h,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ],
              ),

              SizedBox(width: 55.w),

              // Next prayer
              Column(
                children: [
                  Bone(
                    width: 90.w,
                    height: 16.h,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  SizedBox(height: 10.h),
                  Bone(
                    width: 105.w,
                    height: 26.h,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ],
              ),
            ],
          ),

          Divider(
            color: AppColor.primary.withValues(alpha: .25),
            thickness: .5,
          ),

          Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Column(
                  children: [
                    Bone(
                      width: 38.w,
                      height: 12.h,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    SizedBox(height: 7.h),
                    Bone.circle(size: 20.w),
                    SizedBox(height: 7.h),
                    Bone(
                      width: 32.w,
                      height: 12.h,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
