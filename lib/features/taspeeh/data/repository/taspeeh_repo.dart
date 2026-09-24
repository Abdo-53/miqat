import 'package:isar_community/isar.dart';
import 'package:miqat/core/service/database/local_database_service.dart';
import 'package:miqat/features/taspeeh/data/default_taspeh_data.dart';
import 'package:miqat/features/taspeeh/data/model/taspeh_model.dart';
import 'package:miqat/features/taspeeh/data/model/user_taspeh_model.dart';

class TaspeehRepo {
  final LocalDatabaseService localDatabaseService;

  TaspeehRepo({required this.localDatabaseService});

  List<TaspehModel> getDefaultTaspeehs() {
    return DefaultTaspehData.data;
  }

  Future<List<UserTaspehModel>> getUserTaspeehs() async {
    return localDatabaseService.database.userTaspehModels.where().findAll();
  }

  Future<void> addTaspeeh(UserTaspehModel taspeeh) async {
    await localDatabaseService.database.writeTxn(() async {
      await localDatabaseService.database.userTaspehModels.put(taspeeh);
    });
  }

  Future<void> deleteTaspeeh(int id) async {
    await localDatabaseService.database.writeTxn(() async {
      await localDatabaseService.database.userTaspehModels.delete(id);
    });
  }
}
