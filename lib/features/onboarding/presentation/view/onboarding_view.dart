import 'package:flutter/material.dart';
import 'package:miqat/features/onboarding/presentation/view/widget/onboarding_view_body_.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const OnboardingViewBody(),
    );
  }
}
