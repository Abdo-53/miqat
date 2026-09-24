import 'dart:ui';

abstract class LocalizationState {}

final class LocalizationChanged extends LocalizationState {
  final Locale locale;
  LocalizationChanged(this.locale);
}
