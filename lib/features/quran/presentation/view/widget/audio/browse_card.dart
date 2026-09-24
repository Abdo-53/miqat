import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';

class BrowseCard extends StatelessWidget {
  const BrowseCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,

          borderRadius: BorderRadius.circular(18.r),
          child: Ink(
            height: 120.h,

            padding: EdgeInsets.all(14.r),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Icon(
                        icon,
                        color: colorScheme.primary,
                        size: 22.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),

                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Theme.of(
                          context,
                        ).textTheme.bodySmall?.color?.withValues(alpha: .6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
