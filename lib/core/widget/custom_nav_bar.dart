import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/model/nav_item_model.dart';
import 'package:miqat/core/widget/nav_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 8.h, 14.w, 14.h),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(36.r),
          border: Border.all(
            color: colorScheme.primary.withValues(alpha: .55),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .10),
              blurRadius: 18,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Row(
          children: List.generate(NavItemModel.items.length, (index) {
            return Expanded(
              child: NavItem(
                navItemModel: NavItemModel.items[index],
                isSelected: currentIndex == index,
                onTap: () => onChanged(index),
              ),
            );
          }),
        ),
      ),
    );
  }
}
