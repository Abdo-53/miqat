import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeh_sheet_row.dart';
import 'package:miqat/generated/l10n.dart';

class TaspeehDeleteSheet extends StatelessWidget {
  const TaspeehDeleteSheet({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).tasbeeh_deleteTitle,
              style: AppTextStyle.displayMedium,
            ),

            SizedBox(height: 12.h),
          
            
            
                      

            Text(
              S.of(context).tasbeeh_deleteMessage,
              textAlign: TextAlign.center,
              style: AppTextStyle.heading3,
            ),

            SizedBox(height: 28.h),

            TaspehSheetRow(onTap: onDelete, primaryText: S.of(context).delete),

            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
