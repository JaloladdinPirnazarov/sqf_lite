import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/ui/ui_components.dart';

import '../view_model/minds_view_model.dart';

class AllMindsPage extends StatefulWidget {
  const AllMindsPage({Key? key}) : super(key: key);

  @override
  _AllMindsPageState createState() => _AllMindsPageState();
}

class _AllMindsPageState extends State<AllMindsPage> {
  UIComponents components = UIComponents();
  @override
  void initState() {
    super.initState();
    context.read<MindsViewModel>().readMinds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("All minds"),

      ),
      body: Consumer<MindsViewModel>(
        builder: (context, value, child) {
          if (value.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.minds != null) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: value.minds!.length,
              itemBuilder: (context, position) {
                var mind = value.minds![position];
                return components.buildMindItem(mind, context);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
