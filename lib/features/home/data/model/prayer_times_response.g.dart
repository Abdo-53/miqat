// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesResponse _$PrayerTimesResponseFromJson(Map<String, dynamic> json) =>
    PrayerTimesResponse(
      code: (json['code'] as num).toInt(),
      status: json['status'] as String,
      data: PrayerTimesDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrayerTimesResponseToJson(
  PrayerTimesResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
  'data': instance.data,
};

PrayerTimesDataModel _$PrayerTimesDataModelFromJson(
  Map<String, dynamic> json,
) => PrayerTimesDataModel(
  timings: PrayerTimesModel.fromJson(json['timings'] as Map<String, dynamic>),
  date: PrayerDateModel.fromJson(json['date'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PrayerTimesDataModelToJson(
  PrayerTimesDataModel instance,
) => <String, dynamic>{'timings': instance.timings, 'date': instance.date};
