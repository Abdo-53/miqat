import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon = Icons.search,
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 54.h,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.bodyLarge.copyWith(
            color: textTheme.bodyMedium?.color?.withValues(alpha: .35),
          ),
          prefixIcon: Icon(prefixIcon, color: colorScheme.primary),
          filled: true,
          fillColor: colorScheme.surface,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.3),
          ),
        ),
      ),
    );
  }
}
