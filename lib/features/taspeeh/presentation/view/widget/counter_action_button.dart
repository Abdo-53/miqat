import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class CounterActionButton extends StatelessWidget {
  const CounterActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            width: 72.r,
            height: 72.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.border),
            ),
            child: Icon(icon, color: color, size: 30.sp),
          ),
        ),

        SizedBox(height: 8.h),

        Text(label, style: AppTextStyle.bodyMedium),
      ],
    );
  }
}
