import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.prefixIcon,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: AppTextStyle.bodyLarge,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.heading3.copyWith(
          color: Colors.grey.shade600,
        ),

        prefixIcon: prefixIcon,

        filled: true,
        fillColor: AppColor.pattern.withValues(alpha: .15),

        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: AppColor.primary, width: 1.2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: const BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
