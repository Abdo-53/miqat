import 'package:flutter_bloc/flutter_bloc.dart';

part 'azkar_counter_state.dart';

class AzkarCounterCubit extends Cubit<AzkarCounterState> {
  AzkarCounterCubit({required int target})
    : super(AzkarCounterState(current: 0, target: target));

  void increment() {
    if (state.current == state.target) return;

    emit(AzkarCounterState(current: state.current + 1, target: state.target));
  }

  void decrement() {
    if (state.current == 0) return;

    emit(AzkarCounterState(current: state.current - 1, target: state.target));
  }

  void reset() {
    emit(AzkarCounterState(current: 0, target: state.target));
  }

  void changeTarget(int target) {
    emit(AzkarCounterState(current: 0, target: target));
  }
}
