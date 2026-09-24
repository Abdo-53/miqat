import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/generated/l10n.dart';

class AzkarCategoryModel {
  const AzkarCategoryModel({
    required this.title,
    required this.image,
    required this.path,
  });

  final String Function(BuildContext) title;
  final String image;
  final String path;

  static final List<AzkarCategoryModel> data = [
    AzkarCategoryModel(
      title: (context) => S.of(context).azkar_morning,
      image: AppAsset.morning,
      path: AppAsset.morningAzkar,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).azkar_evening,
      image: AppAsset.evening,
      path: AppAsset.eveningAzkar,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).azkar_sleep,
      image: AppAsset.sleep,
      path: AppAsset.sleepAzkar,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).azkar_wakeup,
      image: AppAsset.wakeup,
      path: AppAsset.wakeupAzkar,
    ),

    // Prayer Azkar
    AzkarCategoryModel(
      title: (context) => S.of(context).azkarAdhan,
      image: AppAsset.azan,
      path: AppAsset.adhanAzkar,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).openingSupplication,
      image: AppAsset.istiftah,
      path: AppAsset.istiftahDua,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).rukuSupplications,
      image: AppAsset.ruku,
      path: AppAsset.rukuDua,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).sujudSupplications,
      image: AppAsset.sujud,
      path: AppAsset.sujudDua,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).tashahhud,
      image: AppAsset.tashahhudImage,
      path: AppAsset.tashahhud,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).afterFinalTashahhudBeforeSalam,
      image: AppAsset.finalTashahhud,
      path: AppAsset.duaAfterFinalTashahhudBeforeSalam,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).afterPrayerAdhkar,
      image: AppAsset.prayerAzkar,
      path: AppAsset.afterSalamAzkar,
    ),

    AzkarCategoryModel(
      title: (context) => S.of(context).istikharaSupplication,
      image: AppAsset.istikhara,
      path: AppAsset.istikharaDua,
    ),
  ];
}
