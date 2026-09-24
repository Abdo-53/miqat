import 'package:json_annotation/json_annotation.dart';

part 'prayer_times_model.g.dart';

@JsonSerializable()
class PrayerTimesModel {
  @JsonKey(name: 'Fajr')
  final String fajr;

  @JsonKey(name: 'Sunrise')
  final String sunrise;

  @JsonKey(name: 'Dhuhr')
  final String dhuhr;

  @JsonKey(name: 'Asr')
  final String asr;

  @JsonKey(name: 'Maghrib')
  final String maghrib;

  @JsonKey(name: 'Isha')
  final String isha;

  PrayerTimesModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesModelToJson(this);
}

@JsonSerializable()
class PrayerDateModel {
  final HijriDateModel hijri;
  final GregorianDateModel gregorian;

  PrayerDateModel({required this.hijri, required this.gregorian});

  factory PrayerDateModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerDateModelToJson(this);
}

@JsonSerializable()
class HijriDateModel {
  final String day;
  final String year;
  final HijriMonthModel month;
  final HijriWeekdayModel weekday;

  HijriDateModel({
    required this.day,
    required this.year,
    required this.month,
    required this.weekday,
  });

  factory HijriDateModel.fromJson(Map<String, dynamic> json) =>
      _$HijriDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$HijriDateModelToJson(this);
}

@JsonSerializable()
class HijriMonthModel {
  final String en;
  final String ar;

  HijriMonthModel({required this.en, required this.ar});

  factory HijriMonthModel.fromJson(Map<String, dynamic> json) =>
      _$HijriMonthModelFromJson(json);

  Map<String, dynamic> toJson() => _$HijriMonthModelToJson(this);
}

@JsonSerializable()
class HijriWeekdayModel {
  final String en;
  final String ar;

  HijriWeekdayModel({required this.en, required this.ar});

  factory HijriWeekdayModel.fromJson(Map<String, dynamic> json) =>
      _$HijriWeekdayModelFromJson(json);

  Map<String, dynamic> toJson() => _$HijriWeekdayModelToJson(this);
}

@JsonSerializable()
class GregorianDateModel {
  final String date;
  final String day;
  final String year;
  final GregorianMonthModel month;
  final GregorianWeekdayModel weekday;

  GregorianDateModel({
    required this.date,
    required this.day,
    required this.year,
    required this.month,
    required this.weekday,
  });

  factory GregorianDateModel.fromJson(Map<String, dynamic> json) =>
      _$GregorianDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianDateModelToJson(this);
}

@JsonSerializable()
class GregorianMonthModel {
  final int number;
  final String en;

  GregorianMonthModel({required this.number, required this.en});

  factory GregorianMonthModel.fromJson(Map<String, dynamic> json) =>
      _$GregorianMonthModelFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianMonthModelToJson(this);
}

@JsonSerializable()
class GregorianWeekdayModel {
  final String en;

  GregorianWeekdayModel({required this.en});

  factory GregorianWeekdayModel.fromJson(Map<String, dynamic> json) =>
      _$GregorianWeekdayModelFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianWeekdayModelToJson(this);
}
