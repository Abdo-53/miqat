import 'package:isar_community/isar.dart';

part 'user_taspeh_model.g.dart';

//

@collection
class UserTaspehModel {
  Id id = Isar.autoIncrement;

  late String title;

  late int target;

  UserTaspehModel({required this.title, required this.target});
}
