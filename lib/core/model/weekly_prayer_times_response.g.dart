// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_prayer_times_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyPrayerTimesResponse _$WeeklyPrayerTimesResponseFromJson(
  Map<String, dynamic> json,
) => WeeklyPrayerTimesResponse(
  code: (json['code'] as num).toInt(),
  status: json['status'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => WeeklyPrayerDayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeeklyPrayerTimesResponseToJson(
  WeeklyPrayerTimesResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
  'data': instance.data,
};

WeeklyPrayerDayModel _$WeeklyPrayerDayModelFromJson(
  Map<String, dynamic> json,
) => WeeklyPrayerDayModel(
  timings: PrayerTimesModel.fromJson(json['timings'] as Map<String, dynamic>),
  date: PrayerDateModel.fromJson(json['date'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WeeklyPrayerDayModelToJson(
  WeeklyPrayerDayModel instance,
) => <String, dynamic>{'timings': instance.timings, 'date': instance.date};
