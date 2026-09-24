import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miqat/core/const/app_color.dart';

class RadioControls extends StatelessWidget {
  const RadioControls({
    super.key,
    required this.isPlaying,
    required this.isMuted,
    required this.onPlayPause,
    required this.onMute,
  });

  final bool isPlaying;
  final bool isMuted;

  final VoidCallback onPlayPause;
  final VoidCallback onMute;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onMute,
          splashRadius: 24.r,
          icon: Icon(
            isMuted
                ? FontAwesomeIcons.volumeXmark
                : FontAwesomeIcons.volumeHigh,
            color: colorScheme.primary,
            size: 26.sp,
          ),
        ),

        SizedBox(width: 22.w),

        InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: onPlayPause,
          child: Ink(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primary,
            ),
            child: Icon(
              isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,

              size: 32.sp,
            ),
          ),
        ),

      ],
    );
  }
}
