import 'package:flutter/cupertino.dart';
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

  void toggleCheckbox(Routine routine, int index) {}

  /// CREATE A ROUTINE
  void createRoutine(String routineName) {
    routinesBox.add(
      Routine(
        id: const Uuid().v1(),
        routineName: routineName,
        routineList: [],
        dayTime: selectedDayTime,
      ),
    );
  }

  /// GET ROUTINES
  dynamic getAllRoutines() {
    return routinesBox.values;
  }

  /// GET ROUTINE BY ID
  Routine? getRoutineById(String routineId) {
    for (var routine in routinesBox.values) {
      if (routine.id == routineId) {
        return routine;
      }
    }
    return null;
  }

  /// UPDATE A ROUTINE
  void updateRoutine(RoutineItem newItem, int index, Routine currRoutine) {
    currRoutine.routineList[index] = newItem;
    routinesBox.put(currRoutine.id, currRoutine);
    notifyListeners();
  }

  /// DELETE ROUTINE
  void deleteRoutineById(String routineId) {
    /*routinesBox.delete(key)*/
  }

  /// ADD ITEM TO ROUTINE
  void addItemToRoutine(
      {required Routine currRoutine, required String routineItemTitle}) {
    if (currRoutine != null) {
      currRoutine.routineList.add(RoutineItem(title: routineItemTitle));
      notifyListeners();
    }
  }

  /// DELETE ITEM FROM ROUTINE

  /// EDIT ROUTINE
}

class ChipData {
  DayTime label;
  bool isSelected;

  ChipData({required this.label, required this.isSelected});
}
