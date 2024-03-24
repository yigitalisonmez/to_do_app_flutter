import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/helpers/widgets/routine_card.dart';
import 'package:todoey_flutter/models/routine/routine.dart';
import 'package:todoey_flutter/models/todo/todo.dart';
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
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Routines',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
/*          RoutineCard(
            Routine(routineList: [
              Todo(
                  todoDescription: 'Wake Up',
                  time: DateTime.now(),
                  todoState: false),
              Todo(
                  todoDescription: 'Make Your Bed',
                  time: DateTime.now(),
                  todoState: false),
              Todo(
                  todoDescription: 'Wash Your Face',
                  time: DateTime.now(),
                  todoState: false),
            ], dayTime: DayTime.Morning),
          ),*/
        ],
      ),
    );
  }

/*  List<Widget> paintRoadUI(int taskNumber) {
    List<Widget> road = [];
    for (var i = 1; i <= 10; ++i) {
      road.add(
        Container(
            child: Image.asset(
                'assets/tiles/FieldsTile_${Provider.of<RoutinesViewModel>(context).getRandomInt(16)}.png')),
      );
    }
    return road;
  }*/
}
