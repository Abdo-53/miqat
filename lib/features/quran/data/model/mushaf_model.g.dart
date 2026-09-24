// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mushaf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MushafModel _$MushafModelFromJson(Map<String, dynamic> json) => MushafModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  server: json['server'] as String?,
  surahTotal: (json['surah_total'] as num?)?.toInt(),
  moshafType: (json['moshaf_type'] as num?)?.toInt(),
  surahList: json['surah_list'] as String?,
);

Map<String, dynamic> _$MushafModelToJson(MushafModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'server': instance.server,
      'surah_total': instance.surahTotal,
      'moshaf_type': instance.moshafType,
      'surah_list': instance.surahList,
    };
