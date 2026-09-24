import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/const/app_color.dart';

class SettingExpandableTile extends StatelessWidget {
  const SettingExpandableTile({
    super.key,
    required this.title,
    required this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.isExpanded = false,
    this.expandedChild,
  });

  final String title;
  final String? subtitle;
  final Widget leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isExpanded;
  final Widget? expandedChild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading,

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      if (subtitle != null) ...[
                        SizedBox(height: 4.h),
                        Text(subtitle!, style: AppTextStyle.bodyMedium),
                      ],
                    ],
                  ),
                ),

                trailing ??
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 24.sp,
                      color: AppColor.primary,
                    ),
              ],
            ),
          ),

          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: expandedChild ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
