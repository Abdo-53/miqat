import 'package:flutter/material.dart';
import 'package:miqat/features/onboarding/data/model/model.dart';
import 'package:miqat/generated/l10n.dart';

class OnboardingData {
  static List<OnboardingModel> getPages(BuildContext context) {
    final localization = S.of(context);

    return [
      OnboardingModel(
        image: 'asset/image/logoo.png',
        title: localization.onboardingWelcomeTitle,
        description: localization.onboardingWelcomeDescription,
      ),
      OnboardingModel(
        image:'asset/image/1.png',
        title: localization.onboardingPrayerTitle,
        description: localization.onboardingPrayerDescription,
      ),
      OnboardingModel(
        image: 'asset/image/3.png',
        title: localization.onboardingQuranTitle,
        description: localization.onboardingQuranDescription,
      ),
      OnboardingModel(
        image: 'asset/image/2.png',
        title: localization.onboardingAdhkarTitle,
        description: localization.onboardingAdhkarDescription,
      ),
    ];
  }
}
