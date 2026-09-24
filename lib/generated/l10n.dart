// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Next`
  String get common_next {
    return Intl.message('Next', name: 'common_next', desc: '', args: []);
  }

  /// `Back`
  String get common_back {
    return Intl.message('Back', name: 'common_back', desc: '', args: []);
  }

  /// `Skip`
  String get common_skip {
    return Intl.message('Skip', name: 'common_skip', desc: '', args: []);
  }

  /// `Start Now`
  String get common_startNow {
    return Intl.message(
      'Start Now',
      name: 'common_startNow',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get common_cancel {
    return Intl.message('Cancel', name: 'common_cancel', desc: '', args: []);
  }

  /// `Save`
  String get common_save {
    return Intl.message('Save', name: 'common_save', desc: '', args: []);
  }

  /// `Done`
  String get common_done {
    return Intl.message('Done', name: 'common_done', desc: '', args: []);
  }

  /// `Retry`
  String get common_retry {
    return Intl.message('Retry', name: 'common_retry', desc: '', args: []);
  }

  /// `Loading...`
  String get common_loading {
    return Intl.message(
      'Loading...',
      name: 'common_loading',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get common_search {
    return Intl.message('Search', name: 'common_search', desc: '', args: []);
  }

  /// `Yes`
  String get common_yes {
    return Intl.message('Yes', name: 'common_yes', desc: '', args: []);
  }

  /// `No`
  String get common_no {
    return Intl.message('No', name: 'common_no', desc: '', args: []);
  }

  /// `Adhan`
  String get home_adhan {
    return Intl.message('Adhan', name: 'home_adhan', desc: '', args: []);
  }

  /// `Assalamu Alaikum`
  String get home_greeting {
    return Intl.message(
      'Assalamu Alaikum',
      name: 'home_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Miqat`
  String get home_welcome {
    return Intl.message(
      'Welcome to Miqat',
      name: 'home_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Times`
  String get home_prayerTimes {
    return Intl.message(
      'Prayer Times',
      name: 'home_prayerTimes',
      desc: '',
      args: [],
    );
  }

  /// `Next Prayer`
  String get home_nextPrayer {
    return Intl.message(
      'Next Prayer',
      name: 'home_nextPrayer',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Time`
  String get home_remainingTime {
    return Intl.message(
      'Remaining Time',
      name: 'home_remainingTime',
      desc: '',
      args: [],
    );
  }

  /// `Qibla`
  String get home_qibla {
    return Intl.message('Qibla', name: 'home_qibla', desc: '', args: []);
  }

  /// `Today's Azkar`
  String get home_dailyAzkar {
    return Intl.message(
      'Today\'s Azkar',
      name: 'home_dailyAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Continue Reading`
  String get home_continueReading {
    return Intl.message(
      'Continue Reading',
      name: 'home_continueReading',
      desc: '',
      args: [],
    );
  }

  /// `Hijri Date`
  String get home_hijriDate {
    return Intl.message(
      'Hijri Date',
      name: 'home_hijriDate',
      desc: '',
      args: [],
    );
  }

  /// `Gregorian Date`
  String get home_gregorianDate {
    return Intl.message(
      'Gregorian Date',
      name: 'home_gregorianDate',
      desc: '',
      args: [],
    );
  }

  /// `Quran`
  String get home_quran {
    return Intl.message('Quran', name: 'home_quran', desc: '', args: []);
  }

  /// `Tasbeh`
  String get home_taspeh {
    return Intl.message('Tasbeh', name: 'home_taspeh', desc: '', args: []);
  }

  /// `Home`
  String get home_main {
    return Intl.message('Home', name: 'home_main', desc: '', args: []);
  }

  /// `Azkar`
  String get home_azkar {
    return Intl.message('Azkar', name: 'home_azkar', desc: '', args: []);
  }

  /// `Settings`
  String get home_setting {
    return Intl.message('Settings', name: 'home_setting', desc: '', args: []);
  }

  /// `Fajr`
  String get home_fajr {
    return Intl.message('Fajr', name: 'home_fajr', desc: '', args: []);
  }

  /// `Dhuhr`
  String get home_dhr {
    return Intl.message('Dhuhr', name: 'home_dhr', desc: '', args: []);
  }

  /// `Asr`
  String get home_asr {
    return Intl.message('Asr', name: 'home_asr', desc: '', args: []);
  }

  /// `Maghrib`
  String get home_mghrb {
    return Intl.message('Maghrib', name: 'home_mghrb', desc: '', args: []);
  }

  /// `Isha`
  String get home_isa {
    return Intl.message('Isha', name: 'home_isa', desc: '', args: []);
  }

  /// `Prayer Times`
  String get prayer_title {
    return Intl.message(
      'Prayer Times',
      name: 'prayer_title',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get prayer_fajr {
    return Intl.message('Fajr', name: 'prayer_fajr', desc: '', args: []);
  }

  /// `Sunrise`
  String get prayer_sunrise {
    return Intl.message('Sunrise', name: 'prayer_sunrise', desc: '', args: []);
  }

  /// `Dhuhr`
  String get prayer_dhuhr {
    return Intl.message('Dhuhr', name: 'prayer_dhuhr', desc: '', args: []);
  }

  /// `Asr`
  String get prayer_asr {
    return Intl.message('Asr', name: 'prayer_asr', desc: '', args: []);
  }

  /// `Maghrib`
  String get prayer_maghrib {
    return Intl.message('Maghrib', name: 'prayer_maghrib', desc: '', args: []);
  }

  /// `Isha`
  String get prayer_isha {
    return Intl.message('Isha', name: 'prayer_isha', desc: '', args: []);
  }

  /// `Qibla Direction`
  String get prayer_qibla {
    return Intl.message(
      'Qibla Direction',
      name: 'prayer_qibla',
      desc: '',
      args: [],
    );
  }

  /// `Holy Quran`
  String get quran_title {
    return Intl.message('Holy Quran', name: 'quran_title', desc: '', args: []);
  }

  /// `Read`
  String get quran_read {
    return Intl.message('Read', name: 'quran_read', desc: '', args: []);
  }

  /// `Listen`
  String get quran_listen {
    return Intl.message('Listen', name: 'quran_listen', desc: '', args: []);
  }

  /// `Quran Radio`
  String get quran_radio {
    return Intl.message('Quran Radio', name: 'quran_radio', desc: '', args: []);
  }

  /// `Last Read`
  String get quran_lastRead {
    return Intl.message(
      'Last Read',
      name: 'quran_lastRead',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get quran_bookmark {
    return Intl.message(
      'Bookmarks',
      name: 'quran_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Surahs`
  String get quran_surahs {
    return Intl.message('Surahs', name: 'quran_surahs', desc: '', args: []);
  }

  /// `Quran Radio`
  String get radio_title {
    return Intl.message('Quran Radio', name: 'radio_title', desc: '', args: []);
  }

  /// `Live Radio`
  String get radio_live {
    return Intl.message('Live Radio', name: 'radio_live', desc: '', args: []);
  }

  /// `Reciters`
  String get radio_reciters {
    return Intl.message('Reciters', name: 'radio_reciters', desc: '', args: []);
  }

  /// `Azkar`
  String get azkar_title {
    return Intl.message('Azkar', name: 'azkar_title', desc: '', args: []);
  }

  /// `Morning Azkar`
  String get azkar_morning {
    return Intl.message(
      'Morning Azkar',
      name: 'azkar_morning',
      desc: '',
      args: [],
    );
  }

  /// `Evening Azkar`
  String get azkar_evening {
    return Intl.message(
      'Evening Azkar',
      name: 'azkar_evening',
      desc: '',
      args: [],
    );
  }

  /// `Before Sleep`
  String get azkar_sleep {
    return Intl.message(
      'Before Sleep',
      name: 'azkar_sleep',
      desc: '',
      args: [],
    );
  }

  /// `After Waking Up`
  String get azkar_wakeup {
    return Intl.message(
      'After Waking Up',
      name: 'azkar_wakeup',
      desc: '',
      args: [],
    );
  }

  /// `After Prayer`
  String get azkar_afterPrayer {
    return Intl.message(
      'After Prayer',
      name: 'azkar_afterPrayer',
      desc: '',
      args: [],
    );
  }

  /// `Tasbeeh`
  String get tasbeeh_title {
    return Intl.message('Tasbeeh', name: 'tasbeeh_title', desc: '', args: []);
  }

  /// `Tasbeeh Counter`
  String get tasbeeh_counter {
    return Intl.message(
      'Tasbeeh Counter',
      name: 'tasbeeh_counter',
      desc: '',
      args: [],
    );
  }

  /// `Reset Counter`
  String get tasbeeh_reset {
    return Intl.message(
      'Reset Counter',
      name: 'tasbeeh_reset',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Count`
  String get tasbeeh_tapToCount {
    return Intl.message(
      'Tap to Count',
      name: 'tasbeeh_tapToCount',
      desc: '',
      args: [],
    );
  }

  /// `The Remaining`
  String get tasbeeh_theRemaining {
    return Intl.message(
      'The Remaining',
      name: 'tasbeeh_theRemaining',
      desc: '',
      args: [],
    );
  }

  /// `Subhan Allah`
  String get tasbeeh_subhanAllah {
    return Intl.message(
      'Subhan Allah',
      name: 'tasbeeh_subhanAllah',
      desc: '',
      args: [],
    );
  }

  /// `Alhamdulillah`
  String get tasbeeh_alhamdulillah {
    return Intl.message(
      'Alhamdulillah',
      name: 'tasbeeh_alhamdulillah',
      desc: '',
      args: [],
    );
  }

  /// `Allahu Akbar`
  String get tasbeeh_allahuAkbar {
    return Intl.message(
      'Allahu Akbar',
      name: 'tasbeeh_allahuAkbar',
      desc: '',
      args: [],
    );
  }

  /// `La ilaha illa Allah`
  String get tasbeeh_laIlahaIllallah {
    return Intl.message(
      'La ilaha illa Allah',
      name: 'tasbeeh_laIlahaIllallah',
      desc: '',
      args: [],
    );
  }

  /// `Astaghfirullah`
  String get tasbeeh_astaghfirullah {
    return Intl.message(
      'Astaghfirullah',
      name: 'tasbeeh_astaghfirullah',
      desc: '',
      args: [],
    );
  }

  /// `Allahumma salli wa sallim 'ala nabiyyina Muhammad`
  String get tasbeeh_salatIbrahim {
    return Intl.message(
      'Allahumma salli wa sallim \'ala nabiyyina Muhammad',
      name: 'tasbeeh_salatIbrahim',
      desc: '',
      args: [],
    );
  }

  /// `Subhan Allah wa bihamdih`
  String get tasbeeh_subhanAllahWaBihamdih {
    return Intl.message(
      'Subhan Allah wa bihamdih',
      name: 'tasbeeh_subhanAllahWaBihamdih',
      desc: '',
      args: [],
    );
  }

  /// `Subhan Allah al-'Azim wa bihamdih`
  String get tasbeeh_subhanAllahAlAzeem {
    return Intl.message(
      'Subhan Allah al-\'Azim wa bihamdih',
      name: 'tasbeeh_subhanAllahAlAzeem',
      desc: '',
      args: [],
    );
  }

  /// `Subhan Allah, Alhamdulillah, La ilaha illa Allah, Allahu Akbar`
  String get tasbeeh_baqiyatAlsalihat {
    return Intl.message(
      'Subhan Allah, Alhamdulillah, La ilaha illa Allah, Allahu Akbar',
      name: 'tasbeeh_baqiyatAlsalihat',
      desc: '',
      args: [],
    );
  }

  /// `La hawla wa la quwwata illa billah`
  String get tasbeeh_laHawla {
    return Intl.message(
      'La hawla wa la quwwata illa billah',
      name: 'tasbeeh_laHawla',
      desc: '',
      args: [],
    );
  }

  /// `Add Reminder`
  String get tasbeeh_addzikr {
    return Intl.message(
      'Add Reminder',
      name: 'tasbeeh_addzikr',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get tasbeeh_resetCounter {
    return Intl.message(
      'Reset',
      name: 'tasbeeh_resetCounter',
      desc: '',
      args: [],
    );
  }

  /// `Reminder Name`
  String get tasbeeh_zikrName {
    return Intl.message(
      'Reminder Name',
      name: 'tasbeeh_zikrName',
      desc: '',
      args: [],
    );
  }

  /// `Reminder Count`
  String get tasbeeh_zikrCount {
    return Intl.message(
      'Reminder Count',
      name: 'tasbeeh_zikrCount',
      desc: '',
      args: [],
    );
  }

  /// `Delete Tasbeeh?`
  String get tasbeeh_deleteTitle {
    return Intl.message(
      'Delete Tasbeeh?',
      name: 'tasbeeh_deleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this Tasbeeh?`
  String get tasbeeh_deleteMessage {
    return Intl.message(
      'Are you sure you want to delete this Tasbeeh?',
      name: 'tasbeeh_deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Hadith`
  String get hadith_title {
    return Intl.message('Hadith', name: 'hadith_title', desc: '', args: []);
  }

  /// `Favorite Hadith`
  String get hadith_favorites {
    return Intl.message(
      'Favorite Hadith',
      name: 'hadith_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Dua`
  String get dua_title {
    return Intl.message('Dua', name: 'dua_title', desc: '', args: []);
  }

  /// `Favorite Dua`
  String get dua_favorites {
    return Intl.message(
      'Favorite Dua',
      name: 'dua_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_title {
    return Intl.message('Profile', name: 'profile_title', desc: '', args: []);
  }

  /// `Edit Profile`
  String get profile_edit {
    return Intl.message(
      'Edit Profile',
      name: 'profile_edit',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profile_language {
    return Intl.message(
      'Language',
      name: 'profile_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get profile_theme {
    return Intl.message('Theme', name: 'profile_theme', desc: '', args: []);
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Dark Mode`
  String get settings_darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'settings_darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get settings_location {
    return Intl.message(
      'Location',
      name: 'settings_location',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get settings_about {
    return Intl.message(
      'About App',
      name: 'settings_about',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get settings_privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'settings_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification_title {
    return Intl.message(
      'Notifications',
      name: 'notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Reminder`
  String get notification_prayer {
    return Intl.message(
      'Prayer Reminder',
      name: 'notification_prayer',
      desc: '',
      args: [],
    );
  }

  /// `Azkar Reminder`
  String get notification_azkar {
    return Intl.message(
      'Azkar Reminder',
      name: 'notification_azkar',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get error_noInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'error_noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error`
  String get error_unknown {
    return Intl.message(
      'Unexpected Error',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Unable to Get Location`
  String get error_location {
    return Intl.message(
      'Unable to Get Location',
      name: 'error_location',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get error_server {
    return Intl.message(
      'Server Error',
      name: 'error_server',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Miqat`
  String get onboarding_title1 {
    return Intl.message(
      'Welcome to Miqat',
      name: 'onboarding_title1',
      desc: '',
      args: [],
    );
  }

  /// `Your daily companion for organizing worship and getting closer to Allah.`
  String get onboarding_desc1 {
    return Intl.message(
      'Your daily companion for organizing worship and getting closer to Allah.',
      name: 'onboarding_desc1',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Times & Qibla`
  String get onboarding_title2 {
    return Intl.message(
      'Prayer Times & Qibla',
      name: 'onboarding_title2',
      desc: '',
      args: [],
    );
  }

  /// `Know accurate prayer times and the Qibla wherever you are.`
  String get onboarding_desc2 {
    return Intl.message(
      'Know accurate prayer times and the Qibla wherever you are.',
      name: 'onboarding_desc2',
      desc: '',
      args: [],
    );
  }

  /// `Holy Quran`
  String get onboarding_title3 {
    return Intl.message(
      'Holy Quran',
      name: 'onboarding_title3',
      desc: '',
      args: [],
    );
  }

  /// `Read the Quran and listen to your favorite reciters or Quran Radio.`
  String get onboarding_desc3 {
    return Intl.message(
      'Read the Quran and listen to your favorite reciters or Quran Radio.',
      name: 'onboarding_desc3',
      desc: '',
      args: [],
    );
  }

  /// `Azkar & Tasbeeh`
  String get onboarding_title4 {
    return Intl.message(
      'Azkar & Tasbeeh',
      name: 'onboarding_title4',
      desc: '',
      args: [],
    );
  }

  /// `Keep up with your daily Azkar and use the Tasbeeh Counter.`
  String get onboarding_desc4 {
    return Intl.message(
      'Keep up with your daily Azkar and use the Tasbeeh Counter.',
      name: 'onboarding_desc4',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Change Theme`
  String get changeTheme {
    return Intl.message(
      'Change Theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `System Mode`
  String get systemMode {
    return Intl.message('System Mode', name: 'systemMode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message('Contact Us', name: 'contact_us', desc: '', args: []);
  }

  /// `Reciters`
  String get reciters {
    return Intl.message('Reciters', name: 'reciters', desc: '', args: []);
  }

  /// `Radio`
  String get radio {
    return Intl.message('Radio', name: 'radio', desc: '', args: []);
  }

  /// `Browse all reciters and recitations`
  String get browseAllReciters {
    return Intl.message(
      'Browse all reciters and recitations',
      name: 'browseAllReciters',
      desc: '',
      args: [],
    );
  }

  /// `Listen to live Quran radio stations`
  String get listenLiveRadio {
    return Intl.message(
      'Listen to live Quran radio stations',
      name: 'listenLiveRadio',
      desc: '',
      args: [],
    );
  }

  /// `Reciter`
  String get reciter {
    return Intl.message('Reciter', name: 'reciter', desc: '', args: []);
  }

  /// `Station`
  String get radioStation {
    return Intl.message('Station', name: 'radioStation', desc: '', args: []);
  }

  /// `Search for a reciter...`
  String get searchReciter {
    return Intl.message(
      'Search for a reciter...',
      name: 'searchReciter',
      desc: '',
      args: [],
    );
  }

  /// `Choose the narration or Mushaf`
  String get chooseMushafDescription {
    return Intl.message(
      'Choose the narration or Mushaf',
      name: 'chooseMushafDescription',
      desc: '',
      args: [],
    );
  }

  /// `Search for a surah...`
  String get searchSurah {
    return Intl.message(
      'Search for a surah...',
      name: 'searchSurah',
      desc: '',
      args: [],
    );
  }

  /// `Search for a surah or ayah...`
  String get searchSurahOrAya {
    return Intl.message(
      'Search for a surah or ayah...',
      name: 'searchSurahOrAya',
      desc: '',
      args: [],
    );
  }

  /// `Audio`
  String get audio {
    return Intl.message('Audio', name: 'audio', desc: '', args: []);
  }

  /// `Current Recitation`
  String get currentRecitation {
    return Intl.message(
      'Current Recitation',
      name: 'currentRecitation',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message('Download', name: 'download', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Verses`
  String get verses {
    return Intl.message('Verses', name: 'verses', desc: '', args: []);
  }

  /// `LIVE`
  String get live {
    return Intl.message('LIVE', name: 'live', desc: '', args: []);
  }

  /// `Live Broadcast`
  String get liveBroadcast {
    return Intl.message(
      'Live Broadcast',
      name: 'liveBroadcast',
      desc: '',
      args: [],
    );
  }

  /// `Search for a radio...`
  String get searchRadio {
    return Intl.message(
      'Search for a radio...',
      name: 'searchRadio',
      desc: '',
      args: [],
    );
  }

  /// `Downloading Surah...`
  String get downloadingSurah {
    return Intl.message(
      'Downloading Surah...',
      name: 'downloadingSurah',
      desc: '',
      args: [],
    );
  }

  /// `Surah downloaded successfully`
  String get surahDownloadedSuccessfully {
    return Intl.message(
      'Surah downloaded successfully',
      name: 'surahDownloadedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Select Surah`
  String get selectSurah {
    return Intl.message(
      'Select Surah',
      name: 'selectSurah',
      desc: '',
      args: [],
    );
  }

  /// `No favorite surahs yet`
  String get noFavoritesSurahs {
    return Intl.message(
      'No favorite surahs yet',
      name: 'noFavoritesSurahs',
      desc: '',
      args: [],
    );
  }

  /// `No favorite reciters yet`
  String get noFavoritesReciters {
    return Intl.message(
      'No favorite reciters yet',
      name: 'noFavoritesReciters',
      desc: '',
      args: [],
    );
  }

  /// `No favorite radios yet`
  String get noFavoritesRadios {
    return Intl.message(
      'No favorite radios yet',
      name: 'noFavoritesRadios',
      desc: '',
      args: [],
    );
  }

  /// `Select a radio station`
  String get selectRadio {
    return Intl.message(
      'Select a radio station',
      name: 'selectRadio',
      desc: '',
      args: [],
    );
  }

  /// `Audios`
  String get quran_audios {
    return Intl.message('Audios', name: 'quran_audios', desc: '', args: []);
  }

  /// `January`
  String get month_january {
    return Intl.message('January', name: 'month_january', desc: '', args: []);
  }

  /// `February`
  String get month_february {
    return Intl.message('February', name: 'month_february', desc: '', args: []);
  }

  /// `March`
  String get month_march {
    return Intl.message('March', name: 'month_march', desc: '', args: []);
  }

  /// `April`
  String get month_april {
    return Intl.message('April', name: 'month_april', desc: '', args: []);
  }

  /// `May`
  String get month_may {
    return Intl.message('May', name: 'month_may', desc: '', args: []);
  }

  /// `June`
  String get month_june {
    return Intl.message('June', name: 'month_june', desc: '', args: []);
  }

  /// `July`
  String get month_july {
    return Intl.message('July', name: 'month_july', desc: '', args: []);
  }

  /// `August`
  String get month_august {
    return Intl.message('August', name: 'month_august', desc: '', args: []);
  }

  /// `September`
  String get month_september {
    return Intl.message(
      'September',
      name: 'month_september',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get month_october {
    return Intl.message('October', name: 'month_october', desc: '', args: []);
  }

  /// `November`
  String get month_november {
    return Intl.message('November', name: 'month_november', desc: '', args: []);
  }

  /// `December`
  String get month_december {
    return Intl.message('December', name: 'month_december', desc: '', args: []);
  }

  /// `Start reading first`
  String get home_noReadingYet {
    return Intl.message(
      'Start reading first',
      name: 'home_noReadingYet',
      desc: '',
      args: [],
    );
  }

  /// `Continue Listening`
  String get home_continueListening {
    return Intl.message(
      'Continue Listening',
      name: 'home_continueListening',
      desc: '',
      args: [],
    );
  }

  /// `Start listening first`
  String get home_noListeningYet {
    return Intl.message(
      'Start listening first',
      name: 'home_noListeningYet',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get page {
    return Intl.message('Page', name: 'page', desc: '', args: []);
  }

  /// `Surah`
  String get surah {
    return Intl.message('Surah', name: 'surah', desc: '', args: []);
  }

  /// `Adhkar of the Adhan`
  String get azkarAdhan {
    return Intl.message(
      'Adhkar of the Adhan',
      name: 'azkarAdhan',
      desc: '',
      args: [],
    );
  }

  /// `Opening Supplication`
  String get openingSupplication {
    return Intl.message(
      'Opening Supplication',
      name: 'openingSupplication',
      desc: '',
      args: [],
    );
  }

  /// `Ruku' Supplications`
  String get rukuSupplications {
    return Intl.message(
      'Ruku\' Supplications',
      name: 'rukuSupplications',
      desc: '',
      args: [],
    );
  }

  /// `Sujud Supplications`
  String get sujudSupplications {
    return Intl.message(
      'Sujud Supplications',
      name: 'sujudSupplications',
      desc: '',
      args: [],
    );
  }

  /// `Prostration of Recitation Supplication`
  String get tilawahSujudSupplication {
    return Intl.message(
      'Prostration of Recitation Supplication',
      name: 'tilawahSujudSupplication',
      desc: '',
      args: [],
    );
  }

  /// `Tashahhud`
  String get tashahhud {
    return Intl.message('Tashahhud', name: 'tashahhud', desc: '', args: []);
  }

  /// `Supplications After the Final Tashahhud Before Salam`
  String get afterFinalTashahhudBeforeSalam {
    return Intl.message(
      'Supplications After the Final Tashahhud Before Salam',
      name: 'afterFinalTashahhudBeforeSalam',
      desc: '',
      args: [],
    );
  }

  /// `Adhkar After Prayer`
  String get afterPrayerAdhkar {
    return Intl.message(
      'Adhkar After Prayer',
      name: 'afterPrayerAdhkar',
      desc: '',
      args: [],
    );
  }

  /// `Istikhara Supplication`
  String get istikharaSupplication {
    return Intl.message(
      'Istikhara Supplication',
      name: 'istikharaSupplication',
      desc: '',
      args: [],
    );
  }

  /// `Long press a tasbeeh to remove it`
  String get tasbeeh_deleteHint {
    return Intl.message(
      'Long press a tasbeeh to remove it',
      name: 'tasbeeh_deleteHint',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get settings_appSettings {
    return Intl.message(
      'App Settings',
      name: 'settings_appSettings',
      desc: '',
      args: [],
    );
  }

  /// `App Appearance`
  String get settings_appTheme {
    return Intl.message(
      'App Appearance',
      name: 'settings_appTheme',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get settings_appLanguage {
    return Intl.message(
      'App Language',
      name: 'settings_appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Notifications & Alerts`
  String get settings_notifications {
    return Intl.message(
      'Notifications & Alerts',
      name: 'settings_notifications',
      desc: '',
      args: [],
    );
  }

  /// `{count}  radio stations available`
  String radioCount(int count) {
    return Intl.message(
      '$count  radio stations available',
      name: 'radioCount',
      desc: 'Number of available Quran radio stations',
      args: [count],
    );
  }

  /// `{count}  reciters available`
  String reciterCount(int count) {
    return Intl.message(
      '$count  reciters available',
      name: 'reciterCount',
      desc: '',
      args: [count],
    );
  }

  /// `Welcome to Miqat`
  String get onboardingWelcomeTitle {
    return Intl.message(
      'Welcome to Miqat',
      name: 'onboardingWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your daily companion to help you organize your worship and grow closer to Allah.`
  String get onboardingWelcomeDescription {
    return Intl.message(
      'Your daily companion to help you organize your worship and grow closer to Allah.',
      name: 'onboardingWelcomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Times & Qibla`
  String get onboardingPrayerTitle {
    return Intl.message(
      'Prayer Times & Qibla',
      name: 'onboardingPrayerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get accurate prayer times and find the Qibla direction wherever you are.`
  String get onboardingPrayerDescription {
    return Intl.message(
      'Get accurate prayer times and find the Qibla direction wherever you are.',
      name: 'onboardingPrayerDescription',
      desc: '',
      args: [],
    );
  }

  /// `The Holy Quran`
  String get onboardingQuranTitle {
    return Intl.message(
      'The Holy Quran',
      name: 'onboardingQuranTitle',
      desc: '',
      args: [],
    );
  }

  /// `Read the Holy Quran and listen to recitations by renowned reciters anytime.`
  String get onboardingQuranDescription {
    return Intl.message(
      'Read the Holy Quran and listen to recitations by renowned reciters anytime.',
      name: 'onboardingQuranDescription',
      desc: '',
      args: [],
    );
  }

  /// `Adhkar & Tasbeeh`
  String get onboardingAdhkarTitle {
    return Intl.message(
      'Adhkar & Tasbeeh',
      name: 'onboardingAdhkarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Keep up with your daily adhkar and use the digital tasbeeh, all in one place.`
  String get onboardingAdhkarDescription {
    return Intl.message(
      'Keep up with your daily adhkar and use the digital tasbeeh, all in one place.',
      name: 'onboardingAdhkarDescription',
      desc: '',
      args: [],
    );
  }

  /// `Qibla direction`
  String get qiblaDirection {
    return Intl.message(
      'Qibla direction',
      name: 'qiblaDirection',
      desc: '',
      args: [],
    );
  }

  /// `You are facing the Qibla`
  String get qiblaAligned {
    return Intl.message(
      'You are facing the Qibla',
      name: 'qiblaAligned',
      desc: '',
      args: [],
    );
  }

  /// `Turn your phone to find the Qibla`
  String get qiblaTurnPhone {
    return Intl.message(
      'Turn your phone to find the Qibla',
      name: 'qiblaTurnPhone',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Reminder`
  String get notification_prayerTitle {
    return Intl.message(
      'Prayer Reminder',
      name: 'notification_prayerTitle',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for Fajr prayer`
  String get notification_fajr {
    return Intl.message(
      'It is now time for Fajr prayer',
      name: 'notification_fajr',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for Dhuhr prayer`
  String get notification_dhuhr {
    return Intl.message(
      'It is now time for Dhuhr prayer',
      name: 'notification_dhuhr',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for Asr prayer`
  String get notification_asr {
    return Intl.message(
      'It is now time for Asr prayer',
      name: 'notification_asr',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for Maghrib prayer`
  String get notification_maghrib {
    return Intl.message(
      'It is now time for Maghrib prayer',
      name: 'notification_maghrib',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for Isha prayer`
  String get notification_isha {
    return Intl.message(
      'It is now time for Isha prayer',
      name: 'notification_isha',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for the morning Azkar`
  String get notification_morningAzkar {
    return Intl.message(
      'It is now time for the morning Azkar',
      name: 'notification_morningAzkar',
      desc: '',
      args: [],
    );
  }

  /// `It is now time for the evening Azkar`
  String get notification_eveningAzkar {
    return Intl.message(
      'It is now time for the evening Azkar',
      name: 'notification_eveningAzkar',
      desc: '',
      args: [],
    );
  }

  /// `Prayer notification type`
  String get adhan_notificationType {
    return Intl.message(
      'Prayer notification type',
      name: 'adhan_notificationType',
      desc: '',
      args: [],
    );
  }

  /// `Normal notification`
  String get adhan_normalNotification {
    return Intl.message(
      'Normal notification',
      name: 'adhan_normalNotification',
      desc: '',
      args: [],
    );
  }

  /// `Notification without Adhan sound`
  String get adhan_normalNotificationDescription {
    return Intl.message(
      'Notification without Adhan sound',
      name: 'adhan_normalNotificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Adhan`
  String get adhan_adhanNotification {
    return Intl.message(
      'Adhan',
      name: 'adhan_adhanNotification',
      desc: '',
      args: [],
    );
  }

  /// `Play Adhan sound when prayer time begins`
  String get adhan_adhanNotificationDescription {
    return Intl.message(
      'Play Adhan sound when prayer time begins',
      name: 'adhan_adhanNotificationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Adhan sound`
  String get adhan_sound {
    return Intl.message('Adhan sound', name: 'adhan_sound', desc: '', args: []);
  }

  /// `Mishary bin Rashid Alafasy`
  String get adhan_mashare {
    return Intl.message(
      'Mishary bin Rashid Alafasy',
      name: 'adhan_mashare',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Al-Nafees`
  String get adhan_nafess {
    return Intl.message(
      'Ahmed Al-Nafees',
      name: 'adhan_nafess',
      desc: '',
      args: [],
    );
  }

  /// `Nasser Al-Qatami`
  String get adhan_naser {
    return Intl.message(
      'Nasser Al-Qatami',
      name: 'adhan_naser',
      desc: '',
      args: [],
    );
  }

  /// `Wadie Al-Yamani`
  String get adhan_elyamane {
    return Intl.message(
      'Wadie Al-Yamani',
      name: 'adhan_elyamane',
      desc: '',
      args: [],
    );
  }

  /// `Al-Minshawi`
  String get adhan_minshawi {
    return Intl.message(
      'Al-Minshawi',
      name: 'adhan_minshawi',
      desc: '',
      args: [],
    );
  }

  /// `Al-Naqshbandi`
  String get adhan_naghshbandi {
    return Intl.message(
      'Al-Naqshbandi',
      name: 'adhan_naghshbandi',
      desc: '',
      args: [],
    );
  }

  /// `Al-Zahrani`
  String get adhan_zahrane {
    return Intl.message(
      'Al-Zahrani',
      name: 'adhan_zahrane',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get networkErrorTitle {
    return Intl.message(
      'Something went wrong',
      name: 'networkErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection and try again.`
  String get networkNoInternet {
    return Intl.message(
      'Check your internet connection and try again.',
      name: 'networkNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `The request took too long. Please try again.`
  String get networkTimeout {
    return Intl.message(
      'The request took too long. Please try again.',
      name: 'networkTimeout',
      desc: '',
      args: [],
    );
  }

  /// `The server is temporarily unavailable. Please try again later.`
  String get networkServerError {
    return Intl.message(
      'The server is temporarily unavailable. Please try again later.',
      name: 'networkServerError',
      desc: '',
      args: [],
    );
  }

  /// `The requested data could not be found.`
  String get networkNotFound {
    return Intl.message(
      'The requested data could not be found.',
      name: 'networkNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Your session may have expired. Please sign in again.`
  String get networkUnauthorized {
    return Intl.message(
      'Your session may have expired. Please sign in again.',
      name: 'networkUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission to access this content.`
  String get networkForbidden {
    return Intl.message(
      'You don\'t have permission to access this content.',
      name: 'networkForbidden',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't load the data. Please try again.`
  String get networkUnexpected {
    return Intl.message(
      'We couldn\'t load the data. Please try again.',
      name: 'networkUnexpected',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Please enable location services to use Qibla.`
  String get qiblaLocationDisabled {
    return Intl.message(
      'Please enable location services to use Qibla.',
      name: 'qiblaLocationDisabled',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
