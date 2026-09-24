class QiblaDirectionModel {
  final double bearing;
  final double heading;

  const QiblaDirectionModel({required this.bearing, required this.heading});

  double get relativeDirection {
    var direction = bearing - heading;

    if (direction < 0) {
      direction += 360;
    }

    return direction;
  }
}
