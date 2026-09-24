import 'package:isar_community/isar.dart';
import 'package:miqat/features/taspeeh/data/model/user_taspeh_model.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabaseService {
  late Isar database;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    database = await Isar.open([UserTaspehModelSchema], directory: dir.path);
  }
}
