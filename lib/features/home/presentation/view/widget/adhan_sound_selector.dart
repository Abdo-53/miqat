import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class AdhanSoundSelector extends StatelessWidget {
  const AdhanSoundSelector({
    super.key,
    required this.selectedSound,
    required this.sounds,
    required this.onChanged,
  });

  final String selectedSound;
  final List<String> sounds;
  final ValueChanged<String> onChanged;

  String _soundName(BuildContext context, String sound) {
    switch (sound) {
      case 'mashare':
        return S.of(context).adhan_mashare;

      case 'nafess':
        return S.of(context).adhan_nafess;

      case 'naser':
        return S.of(context).adhan_naser;

      case 'elyamane':
        return S.of(context).adhan_elyamane;

      case 'minshawi':
        return S.of(context).adhan_minshawi;

      case 'naghshbandi':
        return S.of(context).adhan_naghshbandi;

      case 'zahrane':
        return S.of(context).adhan_zahrane;

      default:
        return sound;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 24.sp,
            color: colorScheme.primary,
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedSound,
                isExpanded: true,
                borderRadius: BorderRadius.circular(18.r),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: colorScheme.primary,
                ),
                items: sounds.map((sound) {
                  return DropdownMenuItem<String>(
                    value: sound,
                    child: Text(
                      _soundName(context, sound),
                      style: AppTextStyle.bodyLarge,
                    ),
                  );
                }).toList(),
                onChanged: (sound) {
                  if (sound != null) {
                    onChanged(sound);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
