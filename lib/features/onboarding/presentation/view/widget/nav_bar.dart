import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/features/onboarding/presentation/view/widget/nav_button.dart';
import 'package:miqat/features/onboarding/presentation/view/widget/page_indicator.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.count,
    required this.controller,
    required this.text1,
    required this.text2,
    this.onBack,
    this.onNext,
    required this.currentIndex,
  });

  final int count;
  final PageController controller;
  final String text1;
  final String text2;
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final isFirstPage = currentIndex == 0;

    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: isFirstPage ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 250),
              child: IgnorePointer(
                ignoring: isFirstPage,
                child: NavButton(
                  text: text2,
                  onTap: onNext,
                  color: AppColor.primary,
                  isOutlined: true,
                  icon: Icons.arrow_back_rounded,
                  iconAtStart: true,
                ),
              ),
            ),

            PageIndicator(count: count, controller: controller),

            NavButton(
              text: text1,
              onTap: onBack,
              color: AppColor.primary,
              icon: Icons.arrow_forward_rounded,
              iconAtStart: false,
            ),
          ],
        ),
      ),
    );
  }
}
