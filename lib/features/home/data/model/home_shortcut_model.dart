import 'package:flutter/material.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/generated/l10n.dart';

class HomeShortcutModel {
  final IconData icon;
  final String Function(BuildContext) text;
  final String route;

  const HomeShortcutModel({
    required this.icon,
    required this.text,
    required this.route,
  });

  static const itemData = [
    HomeShortcutModel(
      icon: Icons.explore_outlined,
      text: _qiblaText,
      route: AppRouter.kQiblaView,
    ),
    HomeShortcutModel(
      icon: Icons.mosque_outlined,
      text: _adhanText,
      route: AppRouter.kAdhanView,
    ),
  ];

  static String _qiblaText(BuildContext context) {
    return S.of(context).home_qibla;
  }

  static String _adhanText(BuildContext context) {
    return S.of(context).home_adhan;
  }
}
