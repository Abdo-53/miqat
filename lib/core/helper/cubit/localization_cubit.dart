import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/helper/cubit/localization_state.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(this.prefService)
    : super(LocalizationChanged(prefService.getLocalization()));

  final SharedPreferencesService prefService;

  Future<void> changeLocalization(Locale locale) async {
    await prefService.saveLocalization(locale);

    emit(LocalizationChanged(locale));
  }
}
