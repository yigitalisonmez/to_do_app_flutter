import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'routine_item.g.dart';

@HiveType(typeId: 5)
class RoutineItem {
  @HiveField(0)
  String id = const Uuid().v1();
  @HiveField(1)
  String title;
  @HiveField(2)
  bool isDone = false;

  RoutineItem({required this.title});
}
