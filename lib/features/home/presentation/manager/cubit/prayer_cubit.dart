import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/features/home/data/repo/prayer_repository.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final PrayerRepository _prayerRepository;

  PrayerCubit(this._prayerRepository) : super(PrayerInitial());

  Future<void> getPrayerTimes() async {
    final cachedPrayerTimes = _prayerRepository.getCachedPrayerTimes();

    if (cachedPrayerTimes != null) {
      emit(
        PrayerSuccess(
          cachedPrayerTimes,
          isFromCache: true,
          isRefreshing: true,
        ),
      );
    } else {
      emit(PrayerLoading());
    }

    try {
      final response = await _prayerRepository.getPrayerTimes();

      emit(
        PrayerSuccess(
          response,
          isFromCache: false,
          isRefreshing: false,
        ),
      );
    } catch (error) {
      if (cachedPrayerTimes != null) {
        emit(
          PrayerSuccess(
            cachedPrayerTimes,
            isFromCache: true,
            isRefreshing: false,
          ),
        );
      } else {
        emit(PrayerError(error));
      }
    }
  }
}
