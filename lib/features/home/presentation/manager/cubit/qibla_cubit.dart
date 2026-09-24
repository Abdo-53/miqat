import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/features/home/data/model/qibla_direction_model.dart';
import 'package:miqat/features/home/data/repo/qibla_repository.dart';
import 'package:miqat/features/home/presentation/manager/cubit/qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit({required this.repository}) : super(const QiblaInitial());

  final QiblaRepository repository;

  StreamSubscription<double?>? _headingSubscription;
  Future<void> initialize() async {
    if (isClosed) return;

    emit(const QiblaLoading());

    try {
      final bearing = await repository.getQiblaBearing();

      if (isClosed) return;

      await _headingSubscription?.cancel();

      if (isClosed) return;

      _headingSubscription = repository.getHeadingStream().listen(
        (heading) {
          if (isClosed) return;

          if (heading == null) {
            emit(const QiblaError('Compass sensor unavailable'));
            return;
          }

          emit(
            QiblaReady(
              direction: QiblaDirectionModel(
                bearing: bearing,
                heading: heading,
              ),
            ),
          );
        },
        onError: (error) {
          if (isClosed) return;

          emit(QiblaError(error.toString()));
        },
      );
    } catch (e) {
      if (isClosed) return;

      if (e.toString().contains('Location settings are not enabled')) {
        emit(const QiblaLocationDisabled());
        return;
      }

      emit(QiblaError(e.toString()));
    }
  }
}
