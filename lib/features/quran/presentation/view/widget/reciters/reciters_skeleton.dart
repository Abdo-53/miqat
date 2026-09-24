import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciter_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecitersSkeleton extends StatelessWidget {
  const RecitersSkeleton({super.key});

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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return ReciterTile(
                  name: '000 000000',
                  mushafCount: '122 عدد المصاحف',
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
