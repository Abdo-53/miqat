import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/setting/presentation/view/widget/setting_section_card.dart';
import 'package:miqat/features/setting/presentation/view/widget/setting_section_title.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key, required this.title, required this.tiles});

  final String title;

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          SettingSectionTitle(title: title),

          SizedBox(height: 16.h),

          SettingSectionCard(tiles: tiles),
        ],
      ),
    );
  }
}
