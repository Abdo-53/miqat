import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miqat/core/const/app_text_style.dart';

class ReciterTile extends StatelessWidget {
  const ReciterTile({
    super.key,
    required this.name,
    required this.mushafCount,
    required this.onTap,
  });

  final String name;
  final String mushafCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18.r),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: colorScheme.primary.withValues(alpha: .12),
                child: FaIcon(
                  FontAwesomeIcons.userTie,
                  size: 18.sp,
                  color: colorScheme.primary,
                ),
              ),

              SizedBox(width: 16.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.titleMedium.copyWith(
                        color: textTheme.titleMedium?.color,
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      '$mushafCount  ',
                      style: AppTextStyle.bodySmall.copyWith(
                        color: textTheme.bodySmall?.color?.withValues(
                          alpha: .65,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
