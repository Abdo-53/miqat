import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/widget/custom_text_field.dart';
import 'package:miqat/features/taspeeh/data/model/user_taspeh_model.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeh_sheet_row.dart';
import 'package:miqat/generated/l10n.dart';

class TaspehSheet extends StatefulWidget {
  const TaspehSheet({super.key, this.onTap});
  final ValueChanged<UserTaspehModel>? onTap;

  @override
  State<TaspehSheet> createState() => _TaspehSheetState();
}

class _TaspehSheetState extends State<TaspehSheet> {
  final titleController = TextEditingController();
  final targetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15.h),
              Text(
                S.of(context).tasbeeh_addzikr,
                style: AppTextStyle.displayMedium,
              ),
              SizedBox(height: 30.h),
              CustomTextField(
                hintText: S.of(context).tasbeeh_zikrName,
                controller: titleController,
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                keyboardType: TextInputType.numberWithOptions(),
                hintText: S.of(context).tasbeeh_zikrCount,
                controller: targetController,
              ),
              SizedBox(height: 26.h),
              TaspehSheetRow(
                primaryText: S.of(context).add,
                onTap: () {
                  final taspeeh = UserTaspehModel(
                    title: titleController.text,
                    target: int.tryParse(targetController.text) ?? 33,
                  );
                  widget.onTap?.call(taspeeh);
                },
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }
}
