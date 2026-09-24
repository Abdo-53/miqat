import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';

class AdhanNotificationOption extends StatelessWidget {
  const AdhanNotificationOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: selected
              ? colorScheme.primary.withValues(alpha: .08)
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected
                ? colorScheme.primary
                : colorScheme.primary.withValues(alpha: .12),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 26.sp,
              color: selected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),

            SizedBox(width: 14.w),

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

                  SizedBox(height: 4.h),

                  Text(
                    subtitle,
                    style: AppTextStyle.bodyMedium,
                  ),
                ],
              ),
            ),

            Radio<bool>(
              value: true,
              groupValue: selected ? true : false,
              onChanged: (_) => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}
