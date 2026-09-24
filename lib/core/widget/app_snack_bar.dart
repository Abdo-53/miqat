import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';

class AppSnackBar {
  const AppSnackBar._();
static void show(
    BuildContext context, {
    required String message,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: .30),
              ),
            ),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: colorScheme.primary, size: 20.sp),
                  SizedBox(width: 12.w),
                ],
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: colorScheme.primary,
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
