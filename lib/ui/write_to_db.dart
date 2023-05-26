import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/data/model/mind_model.dart';
import 'package:sqf_lite/ui/all_minds_page.dart';
import 'package:sqf_lite/view_model/minds_view_model.dart';

import '../service/local_db_service.dart';

class WriteToDb extends StatelessWidget {

  TextEditingController mindController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  LocalDatabase database = LocalDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write to db"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMindsPage()));
            context.read<MindsViewModel>().readMinds();
          }, icon: const Icon(Icons.read_more))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
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
            ElevatedButton(
                onPressed: (){
                  context.read<MindsViewModel>().addMind(MindModel(mind: mindController.text, author: authorController.text));
                },
                child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
