import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/onboarding/data/model/onboarding_data.dart';
import 'package:miqat/features/onboarding/presentation/view/widget/nav_bar.dart';
import 'package:miqat/features/onboarding/presentation/view/widget/onboarding_page.dart';
import 'package:miqat/generated/l10n.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentIndex = 0;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final sharedPreferencesService = getIt<SharedPreferencesService>();

    await sharedPreferencesService.saveOnboardingCompleted();

    if (!mounted) return;

    context.pushReplacement(AppRouter.kMainView);
  }

  void _goToNextPage() {
    final pages = OnboardingData.getPages(context);

    final lastPage = currentIndex == pages.length - 1;

    if (lastPage) {
      _completeOnboarding();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  void _goToPreviousPage() {
    if (currentIndex == 0) {
      return;
    }

    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = OnboardingData.getPages(context);

    final isLastPage = currentIndex == pages.length - 1;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAsset.islamicPattern,
            color: AppColor.secondary.withValues(alpha: 0.06),
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          top: 16.h,
          left: 0,
          child: SizedBox(
            height: 155.h,
            child: Image.asset(
              AppAsset.shape2,
              color: AppColor.primary.withValues(alpha: 0.35),
            ),
          ),
        ),

        Positioned.fill(
          child: PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final page = pages[index];

              return OnboardingPage(
                isActive: index == currentIndex,
                image: page.image,
                title: page.title,
                description: page.description,
              );
            },
          ),
        ),

        Positioned(
          top: 42.h,
          right: 16.w,
          child: TextButton(
            onPressed: _completeOnboarding,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 4.h,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: AppColor.primary.withValues(alpha: 0.75),
            ),
            child: Text(
              S.of(context).common_skip,
              style: AppTextStyle.bodyMedium,
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 20.h,
          child: NavBar(
            currentIndex: currentIndex,
            count: pages.length,
            controller: _pageController,
            text1: isLastPage
                ? S.of(context).common_startNow
                : S.of(context).common_next,
            text2: S.of(context).common_back,
            onBack: _goToNextPage,
            onNext: _goToPreviousPage,
          ),
        ),
      ],
    );
  }
}
