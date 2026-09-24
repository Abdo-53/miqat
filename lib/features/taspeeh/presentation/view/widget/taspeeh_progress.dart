import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class TaspeehProgress extends StatelessWidget {
  const TaspeehProgress({
    super.key,
    required this.current,
    required this.target,
  });

  final int current;
  final int target;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.r,
      height: 250.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 250.r,
            height: 250.r,
            child: CircularProgressIndicator(
              value: current / target,
              strokeWidth: 12,
              backgroundColor: AppColor.black,
              color: AppColor.primary,
              strokeCap: StrokeCap.round,
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(current.toString(), style: AppTextStyle.displayLarge),

              SizedBox(height: 8.h),

              Text("/ $target", style: AppTextStyle.titleLarge),
            ],
          ),
        ],
      ),
    );
  }
}
