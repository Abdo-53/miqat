import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/azkar/data/model/azkar_category_model.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({
    super.key,
    required this.model,
    this.onTap,
  });

  final AzkarCategoryModel model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(
            color: AppColor.primary,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 72.h,
              width: double.infinity,
              child: Image.asset(
                model.image,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: 12.h),

            SizedBox(
              height: 42.h,
              child: Center(
                child: Text(
                  model.title(context),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
