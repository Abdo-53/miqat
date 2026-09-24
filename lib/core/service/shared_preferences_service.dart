import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miqat/features/home/data/model/last_listening_model.dart';
import 'package:miqat/features/home/data/model/listening_type.dart';
import 'package:miqat/features/home/data/model/prayer_times_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences pref;

  SharedPreferencesService(this.pref);

  //================ Theme ================//

  Future<void> saveTheme(ThemeMode mode) async {
    await pref.setString('theme', mode.name);
  }

  ThemeMode getTheme() {
    switch (pref.getString('theme')) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  //============= Localization =============//

  Future<void> saveLocalization(Locale locale) async {
    await pref.setString('localization', locale.languageCode);
  }

  Locale getLocalization() {
    return Locale(pref.getString('localization') ?? 'ar');
  }

  //================ Favorites ================//

  static const String _favoriteSurahsKey = 'favorite_surahs';
  static const String _favoriteRecitersKey = 'favorite_reciters';
  static const String _favoriteRadiosKey = 'favorite_radios';

  // Surahs

  Future<void> saveFavoriteSurahs(List<String> ids) async {
    await pref.setStringList(_favoriteSurahsKey, ids);
  }

  List<String> getFavoriteSurahs() {
    return pref.getStringList(_favoriteSurahsKey) ?? [];
  }

  // Reciters

  Future<void> saveFavoriteReciters(List<String> ids) async {
    await pref.setStringList(_favoriteRecitersKey, ids);
  }

  List<String> getFavoriteReciters() {
    return pref.getStringList(_favoriteRecitersKey) ?? [];
  }

  // Radios

  Future<void> saveFavoriteRadios(List<String> ids) async {
    await pref.setStringList(_favoriteRadiosKey, ids);
  }

  List<String> getFavoriteRadios() {
    return pref.getStringList(_favoriteRadiosKey) ?? [];
  }

  //================ Last Read ================//

  static const String _lastReadPageKey = 'last_read_page';

  Future<void> saveLastReadPage(int page) async {
    await pref.setInt(_lastReadPageKey, page);
  }

  int? getLastReadPage() {
    return pref.getInt(_lastReadPageKey);
  }

  //================ Last Listening ================//

  static const _lastListeningType = 'last_listening_type';
  static const _lastListeningTitle = 'last_listening_title';
  static const _lastListeningSubtitle = 'last_listening_subtitle';
  static const _lastListeningUrl = 'last_listening_url';
  static const _lastListeningRadioId = 'last_listening_radio_id';
  static const _lastListeningReciterId = 'last_listening_reciter_id';
  static const _lastListeningMoshafId = 'last_listening_moshaf_id';
  static const _lastListeningSurahNumber = 'last_listening_surah_number';

  Future<void> saveLastListening({
    required LastListeningModel model,
  }) async {
    await pref.setString(_lastListeningType, model.type.name);
    await pref.setString(_lastListeningTitle, model.title);
    await pref.setString(_lastListeningSubtitle, model.subtitle);
    await pref.setString(_lastListeningUrl, model.url);

    if (model.radioId != null) {
      await pref.setInt(_lastListeningRadioId, model.radioId!);
    }

    if (model.reciterId != null) {
      await pref.setInt(_lastListeningReciterId, model.reciterId!);
    }

    if (model.moshafId != null) {
      await pref.setInt(_lastListeningMoshafId, model.moshafId!);
    }

    if (model.surahNumber != null) {
      await pref.setInt(_lastListeningSurahNumber, model.surahNumber!);
    }
  }

  LastListeningModel? getLastListening() {
    final type = pref.getString(_lastListeningType);

    if (type == null) {
      return null;
    }

    return LastListeningModel(
      type: ListeningType.values.byName(type),
      title: pref.getString(_lastListeningTitle) ?? '',
      subtitle: pref.getString(_lastListeningSubtitle) ?? '',
      url: pref.getString(_lastListeningUrl) ?? '',
      radioId: pref.getInt(_lastListeningRadioId),
      reciterId: pref.getInt(_lastListeningReciterId),
      moshafId: pref.getInt(_lastListeningMoshafId),
      surahNumber: pref.getInt(_lastListeningSurahNumber),
    );
  }

  //================ Notifications ================//

  static const String _notificationsEnabledKey = 'notifications_enabled';
  static const String _adhanSoundKey = 'adhan_sound';

  Future<void> saveNotificationsEnabled(bool enabled) async {
    await pref.setBool(_notificationsEnabledKey, enabled);
  }

  bool getNotificationsEnabled() =>
      pref.getBool(_notificationsEnabledKey) ?? true;

  Future<void> saveAdhanSound(String sound) async {
    await pref.setString(_adhanSoundKey, sound);
  }

  String getAdhanSound() => pref.getString(_adhanSoundKey) ?? 'naser';

  //================ Onboarding ================//

  static const String _onboardingCompletedKey = 'onboarding_completed';

  Future<void> saveOnboardingCompleted() async {
    await pref.setBool(_onboardingCompletedKey, true);
  }

  bool isOnboardingCompleted() {
    return pref.getBool(_onboardingCompletedKey) ?? false;
  }

  //================ Prayer Times ================//

  static const String _prayerTimesKey = 'prayer_times';

  Future<void> savePrayerTimes(PrayerTimesResponse response) async {
    final jsonString = jsonEncode(response.toJson());

    await pref.setString(_prayerTimesKey, jsonString);
  }

  PrayerTimesResponse? getPrayerTimes() {
    final jsonString = pref.getString(_prayerTimesKey);

    if (jsonString == null) {
      return null;
    }

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    return PrayerTimesResponse.fromJson(jsonMap);
  }
  //================ Location Settings ================//

  static const String _locationSettingsLastCheckKey =
      'location_settings_last_check';

  Future<void> saveLocationSettingsLastCheck() async {
    await pref.setInt(
      _locationSettingsLastCheckKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  DateTime? getLocationSettingsLastCheck() {
    final timestamp = pref.getInt(_locationSettingsLastCheckKey);

    if (timestamp == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
}
