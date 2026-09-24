import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/home/data/model/home_shortcut_model.dart';

class HomeShortcutItem extends StatelessWidget {
  const HomeShortcutItem({super.key, required this.itemModel});

  final HomeShortcutModel itemModel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 105.w,
      height: 112.h,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.push(itemModel.route);
              },
              borderRadius: BorderRadius.circular(24.r),
              child: Ink(
                width: 70.w,
                height: 70.w,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: .55),
                    width: 1.1,
                  ),
                ),
                child: Icon(
                  itemModel.icon,
                  size: 31.sp,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),

          SizedBox(height: 7.h),

          Text(
            itemModel.text(context),
            style: AppTextStyle.bodyMedium.copyWith(
              color: colorScheme.onSurface.withValues(alpha: .85),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
