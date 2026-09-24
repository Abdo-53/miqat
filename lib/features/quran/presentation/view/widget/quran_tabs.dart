import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/quran/presentation/view/widget/quran_tab_item.dart';
import 'package:miqat/generated/l10n.dart';

class QuranTabs extends StatelessWidget {
  const QuranTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      S.of(context).quran_surahs,

      S.of(context).quran_audios,
      S.of(context).favorite,
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        tabs.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: QuranTabItem(
            title: tabs[index],
            isSelected: selectedIndex == index,
            onTap: () => onChanged(index),
          ),
        ),
      ),
    );
  }
}
