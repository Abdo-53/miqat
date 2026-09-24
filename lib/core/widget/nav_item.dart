import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/model/nav_item_model.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    this.onTap,
    required this.navItemModel,
    required this.isSelected,
  });

  final NavItemModel navItemModel;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final activeColor = colorScheme.primary;
    final inactiveColor = colorScheme.primary.withValues(alpha: .6);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        height: 58.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withValues(alpha: .10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.06 : 1.0,
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutBack,
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: Image.asset(
                  navItemModel.image,
                  color: isSelected ? activeColor : inactiveColor,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 1.h),

            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              style: AppTextStyle.bodyMedium.copyWith(
                color: isSelected ? activeColor : inactiveColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(
                navItemModel.title(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
