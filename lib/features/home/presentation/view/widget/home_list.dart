import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/home/data/model/home_shortcut_model.dart';
import 'package:miqat/features/home/presentation/view/widget/home_shortcut_item.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 54.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: HomeShortcutModel.itemData
          .map((item) => HomeShortcutItem(itemModel: item))
          .toList(),
    ),
  );
}
