// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesModel _$PrayerTimesModelFromJson(Map<String, dynamic> json) =>
    PrayerTimesModel(
      fajr: json['Fajr'] as String,
      sunrise: json['Sunrise'] as String,
      dhuhr: json['Dhuhr'] as String,
      asr: json['Asr'] as String,
      maghrib: json['Maghrib'] as String,
      isha: json['Isha'] as String,
    );

Map<String, dynamic> _$PrayerTimesModelToJson(PrayerTimesModel instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
    };

PrayerDateModel _$PrayerDateModelFromJson(Map<String, dynamic> json) =>
    PrayerDateModel(
      hijri: HijriDateModel.fromJson(json['hijri'] as Map<String, dynamic>),
      gregorian: GregorianDateModel.fromJson(
        json['gregorian'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PrayerDateModelToJson(PrayerDateModel instance) =>
    <String, dynamic>{'hijri': instance.hijri, 'gregorian': instance.gregorian};

HijriDateModel _$HijriDateModelFromJson(Map<String, dynamic> json) =>
    HijriDateModel(
      day: json['day'] as String,
      year: json['year'] as String,
      month: HijriMonthModel.fromJson(json['month'] as Map<String, dynamic>),
      weekday: HijriWeekdayModel.fromJson(
        json['weekday'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$HijriDateModelToJson(HijriDateModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'year': instance.year,
      'month': instance.month,
      'weekday': instance.weekday,
    };

HijriMonthModel _$HijriMonthModelFromJson(Map<String, dynamic> json) =>
    HijriMonthModel(en: json['en'] as String, ar: json['ar'] as String);

Map<String, dynamic> _$HijriMonthModelToJson(HijriMonthModel instance) =>
    <String, dynamic>{'en': instance.en, 'ar': instance.ar};

HijriWeekdayModel _$HijriWeekdayModelFromJson(Map<String, dynamic> json) =>
    HijriWeekdayModel(en: json['en'] as String, ar: json['ar'] as String);

Map<String, dynamic> _$HijriWeekdayModelToJson(HijriWeekdayModel instance) =>
    <String, dynamic>{'en': instance.en, 'ar': instance.ar};

GregorianDateModel _$GregorianDateModelFromJson(Map<String, dynamic> json) =>
    GregorianDateModel(
      date: json['date'] as String,
      day: json['day'] as String,
      year: json['year'] as String,
      month: GregorianMonthModel.fromJson(
        json['month'] as Map<String, dynamic>,
      ),
      weekday: GregorianWeekdayModel.fromJson(
        json['weekday'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$GregorianDateModelToJson(GregorianDateModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'year': instance.year,
      'month': instance.month,
      'weekday': instance.weekday,
    };

GregorianMonthModel _$GregorianMonthModelFromJson(Map<String, dynamic> json) =>
    GregorianMonthModel(
      number: (json['number'] as num).toInt(),
      en: json['en'] as String,
    );

Map<String, dynamic> _$GregorianMonthModelToJson(
  GregorianMonthModel instance,
) => <String, dynamic>{'number': instance.number, 'en': instance.en};

GregorianWeekdayModel _$GregorianWeekdayModelFromJson(
  Map<String, dynamic> json,
) => GregorianWeekdayModel(en: json['en'] as String);

Map<String, dynamic> _$GregorianWeekdayModelToJson(
  GregorianWeekdayModel instance,
) => <String, dynamic>{'en': instance.en};
