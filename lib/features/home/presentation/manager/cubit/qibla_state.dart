import 'package:miqat/features/home/data/model/qibla_direction_model.dart';

abstract class QiblaState {
  const QiblaState();
}

class QiblaInitial extends QiblaState {
  const QiblaInitial();
}

class QiblaLoading extends QiblaState {
  const QiblaLoading();
}

class QiblaReady extends QiblaState {
  const QiblaReady({required this.direction});

  final QiblaDirectionModel direction;
}

class QiblaError extends QiblaState {
  const QiblaError(this.message);

  final String message;
}

class QiblaLocationDisabled extends QiblaState {
  const QiblaLocationDisabled();
}
