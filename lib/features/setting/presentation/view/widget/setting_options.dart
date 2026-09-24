import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class SettingOptionItem<T> {
  const SettingOptionItem({required this.title, required this.value});

  final String title;
  final T value;
}

class SettingOptions<T> extends StatelessWidget {
  const SettingOptions({
    super.key,
    required this.currentValue,
    required this.items,
    required this.onSelected,
  });

  final T currentValue;
  final List<SettingOptionItem<T>> items;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        final isSelected = item.value == currentValue;

        return InkWell(
          onTap: () => onSelected(item.value),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 54.w,
              end: 16.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    style: AppTextStyle.bodyLarge.copyWith(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? AppColor.primary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),

                Icon(
                  isSelected
                      ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_unchecked_rounded,
                  size: 22.sp,
                  color: isSelected
                      ? AppColor.primary
                      : Theme.of(context).disabledColor,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
