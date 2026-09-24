import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/router/app_router.dart';

class TaspehCard extends StatelessWidget {
  const TaspehCard({
    super.key,
    required this.title,
    required this.target,
    this.onLongPress,
  });

  final String title;
  final int target;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        onLongPress?.call();
      },
      onTap: () {
        context.pushNamed(
          AppRouter.kTasbeehCounterView,
          extra: {'title': title, 'target': target},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(color: AppColor.primary, width: 1.8.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                title,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: AppTextStyle.heading3,
              ),
              Container(
                width: 88.w,
                height: 88.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(color: AppColor.primary, width: 1.2.w),
                ),
                child: Center(
                  child: Image.asset(
                    AppAsset.tasbih,
                    width: 42.w,
                    color: AppColor.primary,
                  ),
                ),
              ),
              Text(target.toString(), style: AppTextStyle.heading3),
            ],
          ),
        ),
      ),
    );
  }
}
