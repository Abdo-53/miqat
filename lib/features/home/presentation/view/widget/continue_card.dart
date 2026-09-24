import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';

class ContinueCard extends StatelessWidget {
  const ContinueCard({
    super.key,
    required this.title,
    required this.primaryText,
    this.secondaryText,
    required this.icon,
    this.onTap,
    this.centerContent = false,
  });

  final String title;
  final String primaryText;
  final String? secondaryText;
  final Widget icon;
  final VoidCallback? onTap;
  final bool centerContent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final hasSecondaryText =
        secondaryText != null && secondaryText!.trim().isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Ink(
          height: 100.h,
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: .45),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: .10),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: icon),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyle.titleMedium.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              if (centerContent)
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        primaryText,
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              else ...[
                const Spacer(),

                Text(
                  primaryText,
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                if (hasSecondaryText) ...[
                  SizedBox(height: 1.h),
                  Text(
                    secondaryText!,
                    style: AppTextStyle.bodySmall.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: .60),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
