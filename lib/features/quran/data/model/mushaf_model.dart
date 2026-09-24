import 'package:json_annotation/json_annotation.dart';

part 'mushaf_model.g.dart';

@JsonSerializable()
class MushafModel {
  final int? id;
  final String? name;
  final String? server;

  @JsonKey(name: 'surah_total')
  final int? surahTotal;

  @JsonKey(name: 'moshaf_type')
  final int? moshafType;

  @JsonKey(name: 'surah_list')
  final String? surahList;

  MushafModel({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory MushafModel.fromJson(Map<String, dynamic> json) =>
      _$MushafModelFromJson(json);

  Map<String, dynamic> toJson() => _$MushafModelToJson(this);
}
