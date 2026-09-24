import 'package:json_annotation/json_annotation.dart';

part 'surah_metadata_model.g.dart';

@JsonSerializable()
class SurahMetadataModel {
  final int? number;

  final SurahNameModel? name;

  @JsonKey(name: 'revelation_place')
  final RevelationPlaceModel? revelationPlace;

  @JsonKey(name: 'verses_count')
  final int? versesCount;

  @JsonKey(name: 'words_count')
  final int? wordsCount;

  @JsonKey(name: 'letters_count')
  final int? lettersCount;

  const SurahMetadataModel({
    this.number,
    this.name,
    this.revelationPlace,
    this.versesCount,
    this.wordsCount,
    this.lettersCount,
  });

  factory SurahMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$SurahMetadataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahMetadataModelToJson(this);
}

@JsonSerializable()
class SurahNameModel {
  final String? ar;
  final String? en;
  final String? transliteration;

  const SurahNameModel({this.ar, this.en, this.transliteration});

  factory SurahNameModel.fromJson(Map<String, dynamic> json) =>
      _$SurahNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahNameModelToJson(this);
}

@JsonSerializable()
class RevelationPlaceModel {
  final String? ar;
  final String? en;

  const RevelationPlaceModel({this.ar, this.en});

  factory RevelationPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$RevelationPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$RevelationPlaceModelToJson(this);
}
