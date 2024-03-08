import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/view_models/routines_view_model.dart';

class RoutinesView extends StatefulWidget {
  static String path = '/routines-view';
  const RoutinesView({super.key});

  @override
  State<RoutinesView> createState() => _RoutinesViewState();
}

class _RoutinesViewState extends State<RoutinesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: paintRoadUI(16),
          ),
        ],
      ),
    );
  }

  List<Widget> paintRoadUI(int taskNumber) {
    List<Widget> road = [];
    for (var i = 1; i <= 10; ++i) {
      road.add(
        Container(
            child: Image.asset(
                'assets/tiles/FieldsTile_${Provider.of<RoutinesViewModel>(context).getRandomInt(16)}.png')),
      );
    }
    return road;
  }
}
