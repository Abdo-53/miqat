import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/splash/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;

      final sharedPreferencesService = getIt<SharedPreferencesService>();

      if (sharedPreferencesService.isOnboardingCompleted()) {
        context.pushReplacement(AppRouter.kMainView);
      } else {
        context.pushReplacement(AppRouter.kOnboardingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SplashViewBody(),
    );
  }
}
