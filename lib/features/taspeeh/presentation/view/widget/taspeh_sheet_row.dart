import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class TaspehSheetRow extends StatelessWidget {
  const TaspehSheetRow({super.key, this.onTap, required this.primaryText});

  final VoidCallback? onTap;
  final String primaryText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Center(
              child: Text(
                primaryText,
                style: AppTextStyle.heading3.copyWith(
                  color: AppColor.background2,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColor.primary, width: 2.w),
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Center(
              child: Text(
                S.of(context).cancel,
                style: AppTextStyle.heading3.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
