import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';

class TaspehFloatingButton extends StatelessWidget {
  const TaspehFloatingButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Icon(Icons.add, color: AppColor.background2, size: 38.sp),
      ),
    );
  }
}
