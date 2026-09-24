import 'package:flutter/material.dart';

abstract class ThemeState {}

class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;

  ThemeChanged(this.themeMode);
}
