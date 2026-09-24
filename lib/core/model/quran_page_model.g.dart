// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPageModel _$QuranPageModelFromJson(
  Map<String, dynamic> json,
) => QuranPageModel(
  page: (json['page'] as num?)?.toInt(),
  start: json['start'] == null
      ? null
      : QuranPagePositionModel.fromJson(json['start'] as Map<String, dynamic>),
  end: json['end'] == null
      ? null
      : QuranPagePositionModel.fromJson(json['end'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuranPageModelToJson(QuranPageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'start': instance.start,
      'end': instance.end,
    };

QuranPagePositionModel _$QuranPagePositionModelFromJson(
  Map<String, dynamic> json,
) => QuranPagePositionModel(
  surahNumber: (json['surah_number'] as num?)?.toInt(),
  verse: (json['verse'] as num?)?.toInt(),
);

Map<String, dynamic> _$QuranPagePositionModelToJson(
  QuranPagePositionModel instance,
) => <String, dynamic>{
  'surah_number': instance.surahNumber,
  'verse': instance.verse,
};
