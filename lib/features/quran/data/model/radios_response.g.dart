// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radios_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadiosResponse _$RadiosResponseFromJson(Map<String, dynamic> json) =>
    RadiosResponse(
      radios: (json['radios'] as List<dynamic>?)
          ?.map((e) => RadioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RadiosResponseToJson(RadiosResponse instance) =>
    <String, dynamic>{'radios': instance.radios};
