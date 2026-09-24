import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.prefService) : super(ThemeChanged(prefService.getTheme()));

  final SharedPreferencesService prefService;

  Future<void> changeTheme(ThemeMode mode) async {
    await prefService.saveTheme(mode);

    emit(ThemeChanged(mode));
  }
}
