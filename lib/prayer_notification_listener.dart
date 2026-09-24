import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/miqat_notification_service.dart';
import 'package:miqat/features/home/data/repo/prayer_repository.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_state.dart';
import 'package:miqat/generated/l10n.dart';

class PrayerNotificationListener extends StatelessWidget {
  const PrayerNotificationListener({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PrayerCubit, PrayerState>(
      listener: (context, state) async {
        if (state is! PrayerSuccess) {
          return;
        }
        if (state.isFromCache) {
          return;
        }
        final notificationService = getIt<MiqatNotificationService>();
        final prayerRepository = getIt<PrayerRepository>();
        try {
          final weeklyData = await prayerRepository.getWeeklyPrayerTimes();
          await notificationService.scheduleWeeklyNotifications(
            weeklyData: weeklyData,
            title: S.of(context).notification_prayerTitle,
            fajrMessage: S.of(context).notification_fajr,
            dhuhrMessage: S.of(context).notification_dhuhr,
            asrMessage: S.of(context).notification_asr,
            maghribMessage: S.of(context).notification_maghrib,
            ishaMessage: S.of(context).notification_isha,
            morningTitle: S.of(context).azkar_morning,
            morningMessage: S.of(context).notification_morningAzkar,
            eveningTitle: S.of(context).azkar_evening,
            eveningMessage: S.of(context).notification_eveningAzkar,
          );
        } catch (_) {
          await notificationService.schedulePrayerNotifications(
            timings: state.prayerTimesResponse.data.timings,
            title: S.of(context).notification_prayerTitle,
            fajrMessage: S.of(context).notification_fajr,
            dhuhrMessage: S.of(context).notification_dhuhr,
            asrMessage: S.of(context).notification_asr,
            maghribMessage: S.of(context).notification_maghrib,
            ishaMessage: S.of(context).notification_isha,
          );
          await notificationService.scheduleAzkarNotifications(
            timings: state.prayerTimesResponse.data.timings,
            morningTitle: S.of(context).azkar_morning,
            morningMessage: S.of(context).notification_morningAzkar,
            eveningTitle: S.of(context).azkar_evening,
            eveningMessage: S.of(context).notification_eveningAzkar,
          );
        }
      },
      child: child,
    );
  }
}
