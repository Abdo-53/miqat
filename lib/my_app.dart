import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/helper/cubit/localization_cubit.dart';
import 'package:miqat/core/helper/cubit/localization_state.dart';
import 'package:miqat/core/helper/cubit/theme_cubit.dart';
import 'package:miqat/core/helper/cubit/theme_state.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/theme/app_theme.dart';
import 'package:miqat/generated/l10n.dart';
import 'package:miqat/prayer_notification_listener.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme =
        context.watch<ThemeCubit>().state as ThemeChanged;

    final localization =
        context.watch<LocalizationCubit>().state
            as LocalizationChanged;

    return ScreenUtilInit(
      designSize: const Size(430, 870),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        locale: localization.locale,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: theme.themeMode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: (context, child) {
          return PrayerNotificationListener(
            child: child!,
          );
        },
      ),
    );
  }
}
