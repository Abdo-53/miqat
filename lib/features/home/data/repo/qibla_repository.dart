import 'package:miqat/core/service/compass_service.dart';
import 'package:miqat/core/service/location_service.dart';
import 'package:miqat/features/home/presentation/view/widget/helper/qibla_calculator.dart';

class QiblaRepository {
  QiblaRepository({
    required this.locationService,
    required this.compassService,
  });

  final LocationService locationService;
  final CompassService compassService;

  Future<double> getQiblaBearing() async {
    final position = await locationService.getCurrentPosition();

    return QiblaCalculator.calculateBearing(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  Stream<double?> getHeadingStream() {
    return compassService.headingStream;
  }
}
