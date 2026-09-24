import 'package:json_annotation/json_annotation.dart';

part 'quran_page_model.g.dart';

@JsonSerializable()
class QuranPageModel {
  final int? page;
  final QuranPagePositionModel? start;
  final QuranPagePositionModel? end;

  const QuranPageModel({this.page, this.start, this.end});

  factory QuranPageModel.fromJson(Map<String, dynamic> json) =>
      _$QuranPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageModelToJson(this);
}

@JsonSerializable()
class QuranPagePositionModel {
  @JsonKey(name: 'surah_number')
  final int? surahNumber;

  final int? verse;

  const QuranPagePositionModel({this.surahNumber, this.verse});

  factory QuranPagePositionModel.fromJson(Map<String, dynamic> json) =>
      _$QuranPagePositionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPagePositionModelToJson(this);
}
