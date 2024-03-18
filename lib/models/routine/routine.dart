import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/todo/todo.dart';

// dart run build_runner build
part 'routine.g.dart';

@HiveType(typeId: 4)
enum DayTime {
  @HiveField(0)
  Morning,
  @HiveField(1)
  Afternoon,
  @HiveField(2)
  Evening,
  @HiveField(3)
  Night,
}

String getDayTimeName(DayTime time) {
  switch (time) {
    case DayTime.Morning:
      return 'Morning';
    case DayTime.Afternoon:
      return 'Afternoon';
    case DayTime.Evening:
      return 'Evening';
    case DayTime.Night:
      return 'Night';
    default:
      return '';
  }
}

@HiveType(typeId: 2)
class Routine {
  @HiveField(0)
  List<Todo> routineList;
  @HiveField(1)
  DayTime dayTime;

  Routine({required this.routineList, required this.dayTime});
}
