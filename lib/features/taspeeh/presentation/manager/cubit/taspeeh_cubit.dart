import 'package:bloc/bloc.dart';
import 'package:miqat/features/taspeeh/data/model/user_taspeh_model.dart';
import 'package:miqat/features/taspeeh/data/repository/taspeeh_repo.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_state.dart';

class TaspeehCubit extends Cubit<TaspeehState> {
  final TaspeehRepo repo;

  TaspeehCubit(this.repo) : super(TaspeehInitial());

  Future<void> loadTasbeehs() async {
    emit(TaspeehLoading());

    try {
      final defaultTaspeehs = repo.getDefaultTaspeehs();
      final userTaspeehs = await repo.getUserTaspeehs();

      emit(
        TaspeehLoaded(
          defaultTaspeehs: defaultTaspeehs,
          userTaspeehs: userTaspeehs,
        ),
      );
    } catch (e) {
      emit(TaspeehError(e.toString()));
    }
  }

  Future<void> addTaspeeh(UserTaspehModel taspeeh) async {
    try {
      await repo.addTaspeeh(taspeeh);

      await loadTasbeehs();
    } catch (e) {
      emit(TaspeehError(e.toString()));
    }
  }

  Future<void> deleteTasbeeh(int id) async {
    try {
      await repo.deleteTaspeeh(id);

      await loadTasbeehs();
    } catch (e) {
      emit(TaspeehError(e.toString()));
    }
  }
}
