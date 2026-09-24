import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miqat/core/helper/prayer_time_helper.dart';
import 'package:miqat/features/home/data/model/next_prayer_model.dart';
import 'package:miqat/features/home/data/model/prayer_times_model.dart';
import 'package:miqat/features/home/presentation/view/widget/helper/next_prayer_info.dart';
import 'package:miqat/features/home/presentation/view/widget/helper/prayer_day_period.dart';
import 'package:miqat/features/home/presentation/view/widget/helper/prayer_day_period_helper.dart';
import 'package:miqat/features/home/presentation/view/widget/prayer_countdown.dart';
import 'package:miqat/features/home/presentation/view/widget/prayer_time_animation.dart';

class PrayerCurrentStatus extends StatefulWidget {
  const PrayerCurrentStatus({super.key, required this.timings});

  final PrayerTimesModel timings;

  @override
  State<PrayerCurrentStatus> createState() => _PrayerCurrentStatusState();
}

class _PrayerCurrentStatusState extends State<PrayerCurrentStatus> {
  Timer? _timer;

  late NextPrayerModel _nextPrayer;
  late PrayerDayPeriod _period;
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();

    _updatePrayerStatus();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updatePrayerStatus(),
    );
  }

  @override
  void didUpdateWidget(covariant PrayerCurrentStatus oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.timings != widget.timings) {
      _updatePrayerStatus();
    }
  }

  void _updatePrayerStatus() {
    final nextPrayer = PrayerTimeHelper.getNextPrayer(widget.timings);

    final remainingTime = PrayerTimeHelper.getRemainingTime(nextPrayer);

    final period = PrayerDayPeriodHelper.getCurrentPeriod(
      fajr: widget.timings.fajr,
      dhuhr: widget.timings.dhuhr,
      maghrib: widget.timings.maghrib,
      isha: widget.timings.isha,
    );

    if (!mounted) return;

    setState(() {
      _nextPrayer = nextPrayer;
      _remainingTime = remainingTime;
      _period = period;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NextPrayerInfo(nextPrayer: _nextPrayer),
        PrayerTimeAnimation(period: _period),
        PrayerCountdown(remainingTime: _remainingTime),
      ],
    );
  }
}
