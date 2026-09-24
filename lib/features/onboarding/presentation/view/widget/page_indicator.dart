import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.count,
    required this.controller,
  });

  final int count;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotHeight: 7.h,
        dotWidth: 7.w,
        expansionFactor: 3.2,
        spacing: 6.w,
        activeDotColor: AppColor.primary,
        dotColor: AppColor.secondary.withValues(alpha: 0.38),
      ),
    );
  }
}
