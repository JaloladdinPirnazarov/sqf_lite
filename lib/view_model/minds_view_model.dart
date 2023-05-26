import 'package:flutter/cupertino.dart';
import 'package:sqf_lite/data/repository/mind_repository.dart';

import '../data/model/mind_model.dart';

class MindsViewModel extends ChangeNotifier{
  MindRepository? mindRepository;
  MindsViewModel({required this.mindRepository});

  List<MindModel>? minds;
  bool loading = false;

  void addMind(MindModel mindModel) async{
    mindRepository!.addMind(mindModel);
  }

  Future<void> updateMinds(MindModel mindModel, String mind) async{
    mindRepository!.updateMind(mindModel, mind);
    readMinds();
  }

  Future<void> deleteMind(String mind) async{
    mindRepository!.delete(mind);
    readMinds();
  }


  Future<void> readMinds() async{
    loadingChanger();
    minds = await mindRepository!.readMind();
    loadingChanger();
  }

  void loadingChanger(){
    loading = !loading;
    notifyListeners();
  }
}