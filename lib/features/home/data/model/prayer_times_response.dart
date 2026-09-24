import 'package:json_annotation/json_annotation.dart';
import 'package:miqat/features/home/data/model/prayer_times_model.dart';

part 'prayer_times_response.g.dart';

@JsonSerializable()
class PrayerTimesResponse {
  final int code;
  final String status;
  final PrayerTimesDataModel data;

  PrayerTimesResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesResponseToJson(this);
}

@JsonSerializable()
class PrayerTimesDataModel {
  final PrayerTimesModel timings;
  final PrayerDateModel date;

  PrayerTimesDataModel({required this.timings, required this.date});

  factory PrayerTimesDataModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesDataModelToJson(this);
}
