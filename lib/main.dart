import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/data/repository/mind_repository.dart';
import 'package:sqf_lite/service/local_db_service.dart';
import 'package:sqf_lite/ui/write_to_db.dart';
import 'package:sqf_lite/view_model/minds_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MindsViewModel(
          mindRepository: MindRepository(db: LocalDatabase()),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WriteToDb(),
    );
  }
}
