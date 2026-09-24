import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class AudioProgress extends StatelessWidget {
  const AudioProgress({
    super.key,
    required this.progress,
    required this.buffered,
    required this.total,
    required this.onSeek,
  });

  final Duration progress;
  final Duration buffered;
  final Duration total;

  final ValueChanged<Duration> onSeek;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(
      context,
    ).textTheme.bodySmall?.color?.withValues(alpha: .70);

    return ProgressBar(
      progress: progress,
      buffered: buffered,
      total: total,

      onSeek: onSeek,

      progressBarColor: AppColor.primary,

      bufferedBarColor: Theme.of(context).dividerColor.withValues(alpha: .45),

      baseBarColor: Theme.of(context).dividerColor.withValues(alpha: .18),

      thumbColor: AppColor.primary,

      barHeight: 4.h,

      thumbRadius: 6.r,

      timeLabelTextStyle: AppTextStyle.bodySmall.copyWith(color: textColor),
    );
  }
}
