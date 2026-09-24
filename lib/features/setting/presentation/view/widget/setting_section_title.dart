import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class SettingSectionTitle extends StatelessWidget {
  const SettingSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.heading2.copyWith(
        color: AppColor.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
