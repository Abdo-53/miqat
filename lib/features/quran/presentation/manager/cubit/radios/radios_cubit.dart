import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:miqat/core/service/api/api_result/api_result.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/result_state.dart';

class RadiosCubit extends Cubit<ResultState<List<RadioModel>>> {
  RadiosCubit(this._repository) : super(const ResultState.idle());

  final QuranAudioRepository _repository;

  Future<void> getRadios({String language = 'ar'}) async {
    emit(const ResultState.loading());

    final result = await _repository.getRadios(
      language: language,
    );

    result.when(
      success: (data) {
        emit(ResultState.success(data));
      },
      failure: (networkExceptions) {
        emit(ResultState.error(networkExceptions));
      },
    );
  }
}
