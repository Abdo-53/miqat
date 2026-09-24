import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/features/quran/presentation/view/widget/audio/browse_card.dart';
import 'package:miqat/generated/l10n.dart';

class AudioSection extends StatelessWidget {
  const AudioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 16.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BrowseCard(
              title: S.of(context).reciters,
              subtitle: S.of(context).browseAllReciters,
              icon: FontAwesomeIcons.microphoneLines,
              onTap: () {
                context.push(AppRouter.kRecitersView);
              },
            ),

            SizedBox(width: 12.w),

            BrowseCard(
              title: S.of(context).radio,
              subtitle: S.of(context).listenLiveRadio,
              icon: FontAwesomeIcons.towerBroadcast,
              onTap: () {
                context.push(AppRouter.kRadioView);
              },
            ),
          ],
        ),
      ],
    );
  }
}
