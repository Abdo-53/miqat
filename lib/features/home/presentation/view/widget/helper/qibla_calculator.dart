import 'dart:math';

class QiblaCalculator {
  static const double kaabaLatitude = 21.422487;
  static const double kaabaLongitude = 39.826206;

  static double calculateBearing({
    required double latitude,
    required double longitude,
  }) {
    final userLat = _toRadians(latitude);
    final userLon = _toRadians(longitude);

    final kaabaLat = _toRadians(kaabaLatitude);
    final kaabaLon = _toRadians(kaabaLongitude);

    final deltaLon = kaabaLon - userLon;

    final y = sin(deltaLon) * cos(kaabaLat);

    final x =
        cos(userLat) * sin(kaabaLat) -
        sin(userLat) * cos(kaabaLat) * cos(deltaLon);

    final bearing = atan2(y, x) * 180 / pi;

    return (bearing + 360) % 360;
  }

  static double _toRadians(double degree) {
    return degree * pi / 180;
  }
}
