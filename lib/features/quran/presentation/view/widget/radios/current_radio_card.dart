import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class CurrentRadioCard extends StatelessWidget {
  const CurrentRadioCard({
    super.key,
    required this.radioName,
    this.isLive = true,
    this.isFavorite = false,
    this.onFavorite,
  });

  final String radioName;
  final bool isLive;
  final bool isFavorite;

  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: .12),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: isLive
                  ? Icon(
                      Icons.graphic_eq_rounded,
                      key: const ValueKey('playing'),
                      color: colorScheme.primary,
                      size: 24.sp,
                    )
                  : FaIcon(
                      FontAwesomeIcons.towerBroadcast,
                      key: const ValueKey('idle'),
                      color: colorScheme.primary,
                      size: 20.sp,
                    ),
            ),
          ),

          SizedBox(width: 16.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  radioName,
                  style: AppTextStyle.titleMedium.copyWith(
                    color: textTheme.titleMedium?.color,
                  ),
                ),

                SizedBox(height: 6.h),

                Row(
                  children: [
                    if (isLive)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.success.withValues(alpha: .12),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          S.of(context).live,
                          style: AppTextStyle.caption.copyWith(
                            color: AppColor.success,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: onFavorite,
            icon: FaIcon(
              isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: colorScheme.primary,
              size: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
