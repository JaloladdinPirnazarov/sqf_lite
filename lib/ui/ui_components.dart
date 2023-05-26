import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/data/repository/mind_repository.dart';

import '../data/model/mind_model.dart';
import '../view_model/minds_view_model.dart';

class UIComponents {
  TextEditingController mindController = TextEditingController();
  TextEditingController authorController = TextEditingController();


  Widget buildMindItem(MindModel mind, BuildContext context) {
    mindController.text = mind.mind;
    authorController.text = mind.author;
    return ListTile(
      onLongPress: (){
        context.read<MindsViewModel>().deleteMind(mind.mind);
      },
      title: Text(mind.mind),
      subtitle: Text(mind.author),
      trailing: IconButton(
        icon: const Icon(Icons.edit,),
        onPressed: () {
          showDialog(context: context, builder: (context) =>
              AlertDialog(
                content: SizedBox(
                  height: 160,
                  child: Column(
                    children: [
                      TextField(
                        controller: mindController,
                        decoration: const InputDecoration(
                          labelText: "Mind",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextField(
                        controller: authorController,
                        decoration: const InputDecoration(
                          labelText: "Author",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
                title: const Text("Editing"),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.read<MindsViewModel>().updateMinds(MindModel(
                            mind: mindController.text,
                            author: authorController.text), mind.mind);
                        Navigator.pop(context);
                      }, child: const Text("edit")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("close"))
                ],
              ));
        },
      ),
    );
  }
}