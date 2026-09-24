import 'package:json_annotation/json_annotation.dart';
import 'package:miqat/features/quran/data/model/mushaf_model.dart';

part 'reciter_model.g.dart';

@JsonSerializable()
class ReciterModel {
  final int? id;
  final String? name;
  final String? letter;
  final List<MushafModel>? moshaf;

  ReciterModel({this.id, this.name, this.letter, this.moshaf});

  factory ReciterModel.fromJson(Map<String, dynamic> json) =>
      _$ReciterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReciterModelToJson(this);
}
