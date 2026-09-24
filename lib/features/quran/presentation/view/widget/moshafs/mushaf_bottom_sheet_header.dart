import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class MushafBottomSheetHeader extends StatelessWidget {
  const MushafBottomSheetHeader({super.key, required this.reciterName});

  final String reciterName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: colorScheme.primary.withValues(alpha: .12),
          child: FaIcon(
            FontAwesomeIcons.userLarge,
            color: colorScheme.primary,
            size: 20.sp,
          ),
        ),

        SizedBox(height: 16.h),

        Text(
          reciterName,
          style: AppTextStyle.heading3.copyWith(
            color: textTheme.titleLarge?.color,
          ),
        ),

        SizedBox(height: 6.h),

        Text(
          S.of(context).chooseMushafDescription,
          style: AppTextStyle.bodyMedium.copyWith(
            color: textTheme.bodyMedium?.color?.withValues(alpha: .65),
          ),
        ),
      ],
    );
  }
}
