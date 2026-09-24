import 'package:json_annotation/json_annotation.dart';
import 'package:miqat/features/quran/data/model/reciter_model.dart';

part 'reciters_response.g.dart';

@JsonSerializable()
class RecitersResponse {
  final List<ReciterModel>? reciters;

  RecitersResponse({this.reciters});

  factory RecitersResponse.fromJson(Map<String, dynamic> json) =>
      _$RecitersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecitersResponseToJson(this);
}
