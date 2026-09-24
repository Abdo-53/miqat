import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/widget/app_search_field.dart';
import 'package:miqat/features/quran/presentation/view/widget/quran_content.dart';
import 'package:miqat/features/quran/presentation/view/widget/quran_header.dart';
import 'package:miqat/features/quran/presentation/view/widget/quran_tabs.dart';
import 'package:miqat/generated/l10n.dart';

class QuranViewBody extends StatefulWidget {
  const QuranViewBody({super.key});

  @override
  State<QuranViewBody> createState() => _QuranViewBodyState();
}

class _QuranViewBodyState extends State<QuranViewBody> {
  int selectedTab = 0;

  String searchQuery = '';

  void onTabChanged(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const QuranHeader(),
      
            SizedBox(height: 20.h),
      
            AppSearchField(
              hintText: S.of(context).searchSurahOrAya,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.trim();
                });
              },
            ),
      
            SizedBox(height: 14.h),
      
            QuranTabs(selectedIndex: selectedTab, onChanged: onTabChanged),
      
            SizedBox(height: 16.h),
      
            Expanded(
              child: QuranContent(
                selectedIndex: selectedTab,
                searchQuery: searchQuery,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
