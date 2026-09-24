import 'package:miqat/features/home/data/model/prayer_times_response.dart';

sealed class PrayerState {}

final class PrayerInitial extends PrayerState {}

final class PrayerLoading extends PrayerState {}

final class PrayerSuccess extends PrayerState {
  final PrayerTimesResponse prayerTimesResponse;
  final bool isFromCache;
  final bool isRefreshing;

  PrayerSuccess(
    this.prayerTimesResponse, {
    this.isFromCache = false,
    this.isRefreshing = false,
  });
}

final class PrayerError extends PrayerState {
  final Object error;

  PrayerError(this.error);
}
