import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  /// ===========================
  /// Display
  /// ===========================

  static final TextStyle displayLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static final TextStyle displayMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColor.primary
  );

  /// ===========================
  /// Headings
  /// ===========================

  static final TextStyle heading1 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static final TextStyle heading2 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static final TextStyle heading3 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  /// ===========================
  /// Titles
  /// ===========================

  static final TextStyle titleLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static final TextStyle titleMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  /// ===========================
  /// Body
  /// ===========================

  static final TextStyle bodyLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static final TextStyle bodySmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  /// ===========================
  /// Buttons
  /// ===========================

  static final TextStyle buttonLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1,
  );

  static final TextStyle buttonMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 1,
  );

  /// ===========================
  /// Caption
  /// ===========================

  static final TextStyle caption = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}
