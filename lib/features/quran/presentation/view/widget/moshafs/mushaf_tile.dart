import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miqat/core/const/app_text_style.dart';

class MushafTile extends StatelessWidget {
  const MushafTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: colorScheme.primary.withValues(alpha: .12),
              child: FaIcon(
                FontAwesomeIcons.bookQuran,
                color: colorScheme.primary,
                size: 17.sp,
              ),
            ),

            SizedBox(width: 16.w),

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
                      color: textTheme.bodySmall?.color?.withValues(alpha: .65),
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17.sp,
              color: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
