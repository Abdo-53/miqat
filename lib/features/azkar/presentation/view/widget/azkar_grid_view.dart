import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/features/azkar/data/model/azkar_category_model.dart';
import 'package:miqat/features/azkar/presentation/view/widget/azkar_card.dart';

class AzkarGrid extends StatelessWidget {
  const AzkarGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(22.w),
      itemCount: AzkarCategoryModel.data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: .95,
      ),

      itemBuilder: (context, index) {
        return AzkarCard(
          model: AzkarCategoryModel.data[index],
          onTap: () {
            context.pushNamed(
              AppRouter.kAzkarDetailsView,
              extra: AzkarCategoryModel.data[index],
            );
          },
        );
      },
    );
  }
}
