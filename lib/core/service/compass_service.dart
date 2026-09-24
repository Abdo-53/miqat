import 'package:flutter_device_compass/flutter_device_compass.dart';

class CompassService {
  Stream<double?> get headingStream =>
      FlutterCompass.events?.map((event) => event.heading) ??
      const Stream.empty();
}
