import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: Color.lerp(AppColor.warmWhite, AppColor.background1, .28)!,
      secondaryContainer: AppColor.background1,
    ),

    scaffoldBackgroundColor: AppColor.background1,

    cardTheme: const CardThemeData(color: AppColor.white, elevation: 0),

    dividerColor: AppColor.border.withValues(alpha: .15),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColor.black,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColor.black),
      bodyMedium: TextStyle(color: AppColor.black),
      bodySmall: TextStyle(color: AppColor.black),
      titleLarge: TextStyle(color: AppColor.black),
      titleMedium: TextStyle(color: AppColor.black),
      titleSmall: TextStyle(color: AppColor.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.dark(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.surface,
      secondaryContainer: AppColor.primary.withValues(alpha: .18),
    ),

    scaffoldBackgroundColor: AppColor.background2,

    cardTheme: const CardThemeData(color: AppColor.surface, elevation: 0),

    dividerColor: Colors.white24,

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.surface,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColor.white,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColor.white),
      bodyMedium: TextStyle(color: AppColor.white),
      bodySmall: TextStyle(color: AppColor.white),
      titleLarge: TextStyle(color: AppColor.white),
      titleMedium: TextStyle(color: AppColor.white),
      titleSmall: TextStyle(color: AppColor.white),
    ),
  );
}
