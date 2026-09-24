import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class RadioTile extends StatelessWidget {
  const RadioTile({
    super.key,
    required this.name,
    required this.isPlaying,
    required this.isFavorite,
    required this.onTap,
    required this.onFavorite,
  });

  final String name;
  final bool isPlaying;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                width: 46.w,
                height: 46.w,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  isPlaying
                      ? Icons.graphic_eq_rounded
                      : FontAwesomeIcons.towerBroadcast,
                  color: colorScheme.primary,
                  size: 19.sp,
                ),
              ),

              SizedBox(width: 14.w),

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
                      S.of(context).liveBroadcast,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: textTheme.bodySmall?.color?.withValues(
                          alpha: .65,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: onFavorite,
                icon: FaIcon(
                  isFavorite
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: colorScheme.primary,
                  size: 18.sp,
                ),
              ),

              if (isPlaying)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    S.of(context).live,
                    style: AppTextStyle.caption.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else
                Icon(
                  FontAwesomeIcons.radio,
                  color: colorScheme.primary,
                  size: 22.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
