import 'package:flutter/cupertino.dart';
import 'package:grock/grock.dart';
import 'package:todoey_flutter/models/routine/routine.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/routine/routine_item.dart';
import 'package:uuid/uuid.dart';

class RoutinesViewModel extends ChangeNotifier {
  late Box<Routine> routinesBox;

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
    _initRoutineBox();
  }
  void _initRoutineBox() async {
    routinesBox = await Hive.openBox('routines');
    getAllRoutines();
    notifyListeners();
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
    if (currRoutine.isNotNull) {
      currRoutine!.routineList[index].isDone =
          !(currRoutine!.routineList[index].isDone);
    }
    notifyListeners();
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
    for (var key in routinesBox.keys) {
      print(key);
      print(routinesBox.get(key)!.id);
    }
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
    if (currRoutine != null) {
      currRoutine.routineList.add(RoutineItem(title: routineItemTitle));
      await routinesBox.put(currRoutine.id, currRoutine);
    }
    notifyListeners();
  }

  /// DELETE ITEM FROM ROUTINE
  void deleteItemFromRoutine({required String routineId, required index}) {
    Routine? currRoutine = getRoutineById(routineId);
    if (currRoutine.isNotNull) {
      currRoutine!.routineList.removeAt(index);
    }
    notifyListeners();
  }

  /// EDIT ROUTINE

  /// DELETE ALL ROUTINES
  void deleteAllRoutines() async {
    await routinesBox.clear();
  }
}

class ChipData {
  DayTime label;
  bool isSelected;

  ChipData({required this.label, required this.isSelected});
}
