import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.isActive,
  });

  final String image;
  final String title;
  final String description;
  final bool isActive;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _imageOpacity;
  late final Animation<double> _imageScale;
  late final Animation<Offset> _imageSlide;

  late final Animation<double> _titleOpacity;
  late final Animation<Offset> _titleSlide;

  late final Animation<double> _descriptionOpacity;
  late final Animation<Offset> _descriptionSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );

    _imageOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
    );

    _imageScale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOutCubic),
      ),
    );

    _imageSlide = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.75, curve: Curves.easeOutCubic),
          ),
        );

    _titleOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.20, 0.75, curve: Curves.easeOut),
    );

    _titleSlide = Tween<Offset>(begin: const Offset(0, 0.10), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.20, 0.80, curve: Curves.easeOutCubic),
          ),
        );

    _descriptionOpacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.35, 1.0, curve: Curves.easeOut),
    );

    _descriptionSlide =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.35, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    if (widget.isActive) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant OnboardingPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive && !oldWidget.isActive) {
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _imageOpacity,
                child: SlideTransition(
                  position: _imageSlide,
                  child: ScaleTransition(
                    scale: _imageScale,
                    child: Image.asset(
                      widget.image,
                      height: 260.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              FadeTransition(
                opacity: _titleOpacity,
                child: SlideTransition(
                  position: _titleSlide,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.displayMedium,
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              FadeTransition(
                opacity: _descriptionOpacity,
                child: SlideTransition(
                  position: _descriptionSlide,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primary.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColor.primary.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Text(
                      widget.description,
                      style: AppTextStyle.heading3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
