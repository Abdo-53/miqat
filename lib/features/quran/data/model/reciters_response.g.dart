// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecitersResponse _$RecitersResponseFromJson(Map<String, dynamic> json) =>
    RecitersResponse(
      reciters: (json['reciters'] as List<dynamic>?)
          ?.map((e) => ReciterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecitersResponseToJson(RecitersResponse instance) =>
    <String, dynamic>{'reciters': instance.reciters};
