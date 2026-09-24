// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciterModel _$ReciterModelFromJson(Map<String, dynamic> json) => ReciterModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  letter: json['letter'] as String?,
  moshaf: (json['moshaf'] as List<dynamic>?)
      ?.map((e) => MushafModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReciterModelToJson(ReciterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'letter': instance.letter,
      'moshaf': instance.moshaf,
    };
