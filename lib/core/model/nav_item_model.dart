import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_asset.dart';
import 'package:miqat/generated/l10n.dart';

class NavItemModel {
  final String image;
  final String Function(BuildContext) title;

  const NavItemModel({required this.image, required this.title});

  static final items = [
    NavItemModel(
      image: AppAsset.dua,
      title: (context) => S.of(context).home_azkar,
    ),
    NavItemModel(
      image: AppAsset.quran,
      title: (context) => S.of(context).home_quran,
    ),

    NavItemModel(
      image: AppAsset.home,

      title: (context) => S.of(context).home_main,
    ),

    NavItemModel(
      image: AppAsset.tasbih,
      title: (context) => S.of(context).home_taspeh,
    ),

    NavItemModel(
      image: AppAsset.seting,
      title: (context) => S.of(context).home_setting,
    ),
  ];
}
