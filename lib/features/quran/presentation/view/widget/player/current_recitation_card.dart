import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class CurrentRecitationCard extends StatelessWidget {
  const CurrentRecitationCard({
    super.key,
    required this.reciterName,
    required this.mushafName,
    required this.surahName,
    required this.versesCount,
    this.isFavorite = false,
    this.onFavorite,
    this.onDownload,
    this.onRepeat,
    required this.isRepeatEnabled,
  });
  final bool isRepeatEnabled;
  final String reciterName;
  final String mushafName;
  final String surahName;
  final int versesCount;
  final bool isFavorite;
  final VoidCallback? onRepeat;
  final VoidCallback? onFavorite;
  final VoidCallback? onDownload;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  Icons.graphic_eq_rounded,
                  color: colorScheme.primary,
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mushafName,
                      style: AppTextStyle.titleMedium.copyWith(
                        color: textTheme.titleMedium?.color,
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Row(
                      children: [
                        Text(
                          reciterName,
                          style: AppTextStyle.bodySmall.copyWith(
                            color: textTheme.bodySmall?.color?.withValues(
                              alpha: .65,
                            ),
                          ),
                        ),
                        const Spacer(),
                          IconButton(
                          tooltip: S.of(context).favorite,
                          onPressed: onFavorite,
                          icon: FaIcon(
                            isFavorite
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: colorScheme.primary,
                            size: 18.sp,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          Divider(color: Theme.of(context).dividerColor, height: 1),

          SizedBox(height: 16.h),

          Text(
            surahName,
            style: AppTextStyle.heading3.copyWith(
              color: textTheme.titleLarge?.color,
            ),
          ),

          Row(
            children: [
              Text(
                '$versesCount ${S.of(context).verses}',
                style: AppTextStyle.bodySmall.copyWith(
                  color: textTheme.bodySmall?.color?.withValues(alpha: .65),
                ),
              ),

              const Spacer(),
              Center(
                child: IconButton(
                  onPressed: onRepeat,
                  icon: FaIcon(
                    FontAwesomeIcons.repeat,
                    size: 18.sp,
                    color: isRepeatEnabled
                        ? colorScheme.primary
                        : colorScheme.primary.withValues(alpha: .45),
                  ),
                ),
              ),

              IconButton(
                tooltip: S.of(context).download,
                onPressed: onDownload,
                icon: FaIcon(
                  FontAwesomeIcons.download,
                  color: colorScheme.primary,
                  size: 17.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
