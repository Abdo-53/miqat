import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miqat/core/const/app_color.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    super.key,
    required this.isPlaying,

    this.onPlayPause,
    this.onNext,
    this.onPrevious,
  });

  final bool isPlaying;

  final VoidCallback? onPlayPause;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// Previous
        Center(
          child: IconButton(
            onPressed: onPrevious,
            icon: FaIcon(
              FontAwesomeIcons.backwardStep,
              color: colorScheme.primary,
              size: 22.sp,
            ),
          ),
        ),

        /// Play / Pause
        Center(
          child: Material(
            color: colorScheme.primary,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPlayPause,
              child: SizedBox(
                width: 64.r,
                height: 64.r,
                child: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: AppColor.white,
                  size: 34.sp,
                ),
              ),
            ),
          ),
        ),

        /// Next
        Center(
          child: IconButton(
            onPressed: onNext,
            icon: FaIcon(
              FontAwesomeIcons.forwardStep,
              color: colorScheme.primary,
              size: 22.sp,
            ),
          ),
        ),
      ],
    );
  }
}
