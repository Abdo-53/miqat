import 'package:flutter_bloc/flutter_bloc.dart';

part 'taspeeh_counter_state.dart';

class TaspeehCounterCubit extends Cubit<TaspeehCounterState> {
  TaspeehCounterCubit({required int target})
    : super(TaspeehCounterState(current: 0, target: target));

  void increment() {
    if (state.current == state.target) return;

    emit(TaspeehCounterState(current: state.current + 1, target: state.target));
  }

  void decrement() {
    if (state.current == 0) return;

    emit(TaspeehCounterState(current: state.current - 1, target: state.target));
  }

  void reset() {
    emit(TaspeehCounterState(current: 0, target: state.target));
  }
}
