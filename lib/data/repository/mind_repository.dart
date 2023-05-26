import 'package:sqf_lite/data/model/mind_model.dart';
import 'package:sqf_lite/service/local_db_service.dart';

class MindRepository{
  LocalDatabase? db;
  MindRepository({required this.db});

  void addMind(MindModel mindModel) async => await db!.addMind(mindModel);

  void delete(String mind) async => await db!.deleteMind(mind);

  Future<List<MindModel>>readMind() async {
    var result = await db!.getMinds();
    return result.map((e) => MindModel.fromJson(e)).toList();
  }

  void updateMind(MindModel mindModel, String mind) async => await db!.updateMind(mindModel, mind);


}