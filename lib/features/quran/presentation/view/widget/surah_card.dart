import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.trailing,
    required this.onTap,
  });

  final int index;
  final String title;
  final String subtitle;

  final Widget leading;
  final Widget trailing;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              leading,

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.titleMedium.copyWith(
                        color: textTheme.titleMedium?.color,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      subtitle,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: textTheme.bodySmall?.color?.withValues(
                          alpha: .7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12.w),

              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
