import 'package:flutter/material.dart';
import 'package:miqat/core/widget/custom_nav_bar.dart';
import 'package:miqat/core/widget/dismiss_keyboard.dart';
import 'package:miqat/features/azkar/presentation/view/azkar_view_body.dart';
import 'package:miqat/features/home/presentation/view/home_view_body.dart';
import 'package:miqat/features/quran/presentation/view/quran_view_body.dart';
import 'package:miqat/features/setting/presentation/view/setting_view_body.dart';
import 'package:miqat/features/taspeeh/presentation/view/taspeeh_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 2;

  late final List<Widget> views;

  @override
  void initState() {
    super.initState();

    views = [
      AzkarViewBody(),
      QuranViewBody(),
      HomeViewBody(),
      TaspeehViewBody(),
      SettingViewBody(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: Stack(
          fit: StackFit.expand,
          children: List.generate(views.length, (index) {
            final isSelected = currentIndex == index;

            return IgnorePointer(
              ignoring: !isSelected,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                offset: isSelected
                    ? Offset.zero
                    : Offset(index > currentIndex ? .035 : -.035, 0),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  opacity: isSelected ? 1 : 0,
                  child: views[index],
                ),
              ),
            );
          }),
        ),

        bottomNavigationBar: CustomNavBar(
          currentIndex: currentIndex,
          onChanged: (value) {
            if (value == currentIndex) return;

            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
