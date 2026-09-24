import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_state.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';

class HomeContinueCubit extends Cubit<HomeContinueState> {
  HomeContinueCubit(this._repository) : super(const HomeContinueState());

  final QuranAudioRepository _repository;

  Future<void> refresh() async {
    final lastRead = await _repository.getLastRead();
    final lastListening = await _repository.getLastListening();
  
    emit(state.copyWith(lastRead: lastRead, lastListening: lastListening));
  }
}
