// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahMetadataModel _$SurahMetadataModelFromJson(Map<String, dynamic> json) =>
    SurahMetadataModel(
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] == null
          ? null
          : SurahNameModel.fromJson(json['name'] as Map<String, dynamic>),
      revelationPlace: json['revelation_place'] == null
          ? null
          : RevelationPlaceModel.fromJson(
              json['revelation_place'] as Map<String, dynamic>,
            ),
      versesCount: (json['verses_count'] as num?)?.toInt(),
      wordsCount: (json['words_count'] as num?)?.toInt(),
      lettersCount: (json['letters_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SurahMetadataModelToJson(SurahMetadataModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'revelation_place': instance.revelationPlace,
      'verses_count': instance.versesCount,
      'words_count': instance.wordsCount,
      'letters_count': instance.lettersCount,
    };

SurahNameModel _$SurahNameModelFromJson(Map<String, dynamic> json) =>
    SurahNameModel(
      ar: json['ar'] as String?,
      en: json['en'] as String?,
      transliteration: json['transliteration'] as String?,
    );

Map<String, dynamic> _$SurahNameModelToJson(SurahNameModel instance) =>
    <String, dynamic>{
      'ar': instance.ar,
      'en': instance.en,
      'transliteration': instance.transliteration,
    };

RevelationPlaceModel _$RevelationPlaceModelFromJson(
  Map<String, dynamic> json,
) => RevelationPlaceModel(ar: json['ar'] as String?, en: json['en'] as String?);

Map<String, dynamic> _$RevelationPlaceModelToJson(
  RevelationPlaceModel instance,
) => <String, dynamic>{'ar': instance.ar, 'en': instance.en};
