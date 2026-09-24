import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';

class LocationService {
  bool? _locationSettingsChecked;
  final SharedPreferencesService _sharedPreferencesService =
      getIt<SharedPreferencesService>();

  static const MethodChannel _locationSettingsChannel = MethodChannel(
    'miqat/location_settings',
  );
  Future<bool> _ensureLocationSettings() async {
    // Always check the real current location state first.
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      _locationSettingsChecked = true;
      return true;
    }

    // Location is currently OFF.
    // Now apply our dialog frequency rule.
    if (_locationSettingsChecked != null) {
      return _locationSettingsChecked!;
    }

    final lastCheck = _sharedPreferencesService.getLocationSettingsLastCheck();

    if (lastCheck != null) {
      final difference = DateTime.now().difference(lastCheck);

      if (difference < const Duration(hours: 12)) {
        _locationSettingsChecked = false;
        return false;
      }
    }

    try {
      final result = await _locationSettingsChannel.invokeMethod<bool>(
        'checkLocationSettings',
      );

      _locationSettingsChecked = result ?? false;

      await _sharedPreferencesService.saveLocationSettingsLastCheck();

      return _locationSettingsChecked!;
    } on PlatformException {
      _locationSettingsChecked = false;
      return false;
    }
  }

  Future<Position> getCurrentPosition() async {
    final settingsEnabled = await _ensureLocationSettings();

    if (!settingsEnabled) {
      throw Exception('Location settings are not enabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }
}
