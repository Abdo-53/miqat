import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/home/presentation/view/widget/continue_section.dart';
import 'package:miqat/features/home/presentation/view/widget/home_bar.dart';
import 'package:miqat/features/home/presentation/view/widget/home_list.dart';
import 'package:miqat/features/home/presentation/view/widget/prayer_times_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(top: 0, left: 0, right: 0, child: HomeBar()),

        Positioned(top: 135.h, left: 0, right: 0, child: PrayerTimesCard()),

        Positioned(top: 400.h, left: 0, right: 0, child: HomeList()),

        Positioned(top: 520.h, left: 0, right: 0, child: ContinueSection()),
      ],
    );
  }
}
