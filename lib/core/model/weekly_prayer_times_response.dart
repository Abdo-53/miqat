import 'package:json_annotation/json_annotation.dart';
import 'package:miqat/features/home/data/model/prayer_times_model.dart';

part 'weekly_prayer_times_response.g.dart';

@JsonSerializable()
class WeeklyPrayerTimesResponse {
  final int code;
  final String status;
  final List<WeeklyPrayerDayModel> data;

  WeeklyPrayerTimesResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory WeeklyPrayerTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPrayerTimesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyPrayerTimesResponseToJson(this);
}

@JsonSerializable()
class WeeklyPrayerDayModel {
  final PrayerTimesModel timings;
  final PrayerDateModel date;

  WeeklyPrayerDayModel({
    required this.timings,
    required this.date,
  });

  factory WeeklyPrayerDayModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPrayerDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyPrayerDayModelToJson(this);
}
