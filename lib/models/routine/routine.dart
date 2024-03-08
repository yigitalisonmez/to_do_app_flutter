import 'package:hive/hive.dart';
import 'package:todoey_flutter/helpers/wrappers/reward.dart';
// dart run build_runner build
part 'routine.g.dart';

@HiveType(typeId: 2)
class Routine {
  @HiveField(0)
  String taskDescription;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  Reward reward;

  @HiveField(3)
  DateTime date;

  Routine({
    required this.taskDescription,
    this.isDone = false,
    required this.date,
    required this.reward,
  });
}
