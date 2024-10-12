import 'package:flutter/cupertino.dart';
import 'package:grock/grock.dart';
import 'package:todoey_flutter/helpers/console_color.dart';
import 'package:todoey_flutter/models/routine/routine.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/routine/routine_item.dart';
import 'package:uuid/uuid.dart';

class RoutinesViewModel extends ChangeNotifier {
  late Box<Routine> routinesBox;
  static late Box<Routine> _routinesBox;

  String selectedRoutineName = '';
  DayTime selectedDayTime = DayTime.Morning;
  List<ChipData> chips = [
    ChipData(label: DayTime.Morning, isSelected: true),
    ChipData(label: DayTime.Afternoon, isSelected: false),
    ChipData(label: DayTime.Evening, isSelected: false),
    ChipData(label: DayTime.Night, isSelected: false),
    ChipData(label: DayTime.Other, isSelected: false),
  ];

  RoutinesViewModel() {
    routinesBox = _routinesBox;
  }

  static Future<void> initRoutineBox() async {
    ConsoleColor.printInColor("Fonksiyona girildi", ConsoleColor.green);
    ConsoleColor.printInColor("starting to initialize", ConsoleColor.green);
    _routinesBox = await Hive.openBox('routines');
    ConsoleColor.printInColor("RoutineBox initiated", ConsoleColor.green);
  }

  void toggleIsOpen(ValueNotifier<bool> isOpen, Routine routine, int index) {
    isOpen.value = !(isOpen.value);
    notifyListeners();
  }

  void selectChip(int index, DayTime dayTime) {
    for (var chip in chips) {
      chip.isSelected = false;
    }
    chips[index].isSelected = true;
    selectedDayTime = dayTime;
    notifyListeners();
  }

  void toggleCheckbox(String routineId, int index) {
    Routine? currRoutine = getRoutineById(routineId);
    if (currRoutine != null) {
      currRoutine.routineList[index].isDone =
          !(currRoutine.routineList[index].isDone);
    }
    notifyListeners();
  }

  String calculateProgress({required String routineId}) {
    Routine? routine = getRoutineById(routineId);
    int count = 0;
    for (var habit in routine!.routineList) {
      if (habit.isDone) {
        count++;
      }
    }
    return '$count/${routine.routineList.length} ';
  }

  /// CREATE A ROUTINE
  void createRoutine(String routineName) {
    String newRoutineId = const Uuid().v1();
    routinesBox.put(
      newRoutineId,
      Routine(
        id: newRoutineId,
        routineName: routineName,
        routineList: [],
        dayTime: selectedDayTime,
      ),
    );
    notifyListeners();
  }

  /// GET ROUTINES
  dynamic getAllRoutines() {
    return routinesBox.values;
  }

  /// GET ROUTINE BY ID
  Routine? getRoutineById(String routineId) {
    return routinesBox.get(routineId);
  }

  /// TODO HATALIIIII
/*  /// UPDATE A ROUTINE
  void updateRoutine(RoutineItem newItem, int index, Routine currRoutine) {
    currRoutine.routineList[index] = newItem;
    routinesBox.put(currRoutine.id, currRoutine);
    notifyListeners();
  }*/

  /// DELETE ROUTINE
  void deleteRoutineById(String routineId) {
    routinesBox.delete(routineId);
    notifyListeners();
  }

  /// ADD ITEM TO ROUTINE
  void addItemToRoutine({
    required Routine currRoutine,
    required String routineItemTitle,
  }) async {
    currRoutine.routineList.add(RoutineItem(title: routineItemTitle));
    await routinesBox.put(currRoutine.id, currRoutine);
    notifyListeners();
  }

  /// DELETE ITEM FROM ROUTINE
  void deleteItemFromRoutine({required String routineId, required index}) {
    Routine? currRoutine = getRoutineById(routineId);
    if (currRoutine != null) {
      currRoutine!.routineList.removeAt(index);
    }
    notifyListeners();
  }

  /// EDIT ROUTINE

  /// DELETE ALL ROUTINES
  void deleteAllRoutines() async {
    await routinesBox.clear();
  }

  void reorderHabits(
      {required int oldIndex,
      required int newIndex,
      required String routineId}) {
    // an adjustment needed when its on the edge
    if (oldIndex < newIndex) {
      newIndex--;
    }

    Routine routine = getRoutineById(routineId)!;
    RoutineItem habit = routine.routineList.removeAt(oldIndex);
    routine.routineList.insert(newIndex, habit);
    routinesBox.put(routineId, routine);
    notifyListeners();
  }
}

class ChipData {
  DayTime label;
  bool isSelected;

  ChipData({required this.label, required this.isSelected});
}
