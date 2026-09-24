import 'package:json_annotation/json_annotation.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';

part 'radios_response.g.dart';

@JsonSerializable()
class RadiosResponse {
  final List<RadioModel>? radios;

  RadiosResponse({this.radios});

  factory RadiosResponse.fromJson(Map<String, dynamic> json) =>
      _$RadiosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RadiosResponseToJson(this);
}
