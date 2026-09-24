import 'package:miqat/core/service/local_json_service.dart';
import '../model/azkar_item_model.dart';

class AzkarRepo {
  const AzkarRepo(this.Service);

  final LocalJsonService Service;

  Future<List<AzkarItemModel>> loadAzkar(String path) async {
    final json = await Service.loadJson(path);

    final category = json.first;

    final List items = category["array"];

    return items.map((e) => AzkarItemModel.fromJson(e)).toList();
  }
}
