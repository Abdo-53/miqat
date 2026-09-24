import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/generated/l10n.dart';

class PrayerTimeItemModel {
  final String image;
  final String Function(BuildContext) name;

  const PrayerTimeItemModel({required this.image, required this.name});

  static final List<PrayerTimeItemModel> items = [
    PrayerTimeItemModel(
      image: AppAsset.fajr,
      name: (context) => S.of(context).home_fajr,
    ),
    PrayerTimeItemModel(
      image: AppAsset.dhr,
      name: (context) => S.of(context).home_dhr,
    ),
    PrayerTimeItemModel(
      image: AppAsset.asr,
      name: (context) => S.of(context).home_asr,
    ),
    PrayerTimeItemModel(
      image: AppAsset.mghrb,
      name: (context) => S.of(context).home_mghrb,
    ),
    PrayerTimeItemModel(
      image: AppAsset.isa,
      name: (context) => S.of(context).home_isa,
    ),
  ];
}
