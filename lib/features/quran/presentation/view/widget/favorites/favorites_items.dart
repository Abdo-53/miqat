import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class FavoritesItems extends StatelessWidget {
  const FavoritesItems({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final items = [
      S.of(context).quran_surahs,
      S.of(context).reciters,
      S.of(context).radio,
    ];

    return Column(
      children: [
        Divider(color: Theme.of(context).dividerColor, height: 1),

        SizedBox(height: 12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isSelected = selectedIndex == index;

            return InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () => onChanged(index),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      items[index],
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: isSelected
                            ? AppColor.primary
                            : textTheme.bodyMedium?.color?.withValues(
                                alpha: .55,
                              ),
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isSelected ? 24.w : 0,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
