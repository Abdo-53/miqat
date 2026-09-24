import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class QuranTabItem extends StatelessWidget {
  const QuranTabItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        height: 52.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            style: AppTextStyle.buttonLarge.copyWith(
              color: isSelected
                  ? Theme.of(context).colorScheme.onSurface
                  : AppColor.primary,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.titleLarge.copyWith(
                  color: isSelected
                      ? Theme.of(context).colorScheme.onSurface
                      : AppColor.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
