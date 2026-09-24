import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/features/azkar/data/model/azkar_item_model.dart';
import 'package:miqat/features/azkar/data/repo/azkar_repo.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.repo) : super(AzkarInitial());

  final AzkarRepo repo;

  Future<void> loadAzkar(String path) async {
    emit(AzkarLoading());

    try {
      final azkar = await repo.loadAzkar(path);

      emit(AzkarSuccess(azkar));
    } catch (e) {
      emit(AzkarFailure(e.toString()));
    }
  }
}
