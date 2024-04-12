import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/routine/routine_item.dart';

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
  @HiveField(4)
  Other,
}

extension DayTimeEx on DayTime {
  getText() {
    switch (this) {
      case DayTime.Morning:
        return 'Morning';
      case DayTime.Afternoon:
        return 'Afternoon';
      case DayTime.Evening:
        return 'Evening';
      case DayTime.Night:
        return 'Night';
      case DayTime.Other:
        return 'Other';
    }
  }
}

@HiveType(typeId: 2)
class Routine {
  @HiveField(0)
  String id;
  @HiveField(1)
  String routineName;
  @HiveField(2)
  List<RoutineItem> routineList;
  @HiveField(3)
  DayTime dayTime;

  Routine({
    required this.id,
    required this.routineName,
    required this.routineList,
    required this.dayTime,
  });
}
