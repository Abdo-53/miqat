import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/miqat_notification_service.dart';
import 'package:miqat/features/home/presentation/view/widget/adhan_sound_selector.dart';
import 'package:miqat/generated/l10n.dart';

class AdhanViewBody extends StatefulWidget {
  const AdhanViewBody({super.key});

  @override
  State<AdhanViewBody> createState() => _AdhanViewBodyState();
}

class _AdhanViewBodyState extends State<AdhanViewBody> {
  late String selectedSound;

  final notificationService = getIt<MiqatNotificationService>();

  final List<String> adhanSounds = [
    'elyamane',
    'mashare',
    'minshawi',
    'nafess',
    'naghshbandi',
    'naser',
    'zahrane',
  ];

  @override
  void initState() {
    super.initState();

    selectedSound = notificationService.getAdhanSound();
  }

  Future<void> _changeAdhanSound(String sound) async {
    await notificationService.setAdhanSound(sound);

    if (!mounted) return;

    setState(() {
      selectedSound = sound;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).adhan_sound,
            style: AppTextStyle.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12.h),

          AdhanSoundSelector(
            selectedSound: selectedSound,
            sounds: adhanSounds,
            onChanged: _changeAdhanSound,
          ),
        ],
      ),
    );
  }
}
