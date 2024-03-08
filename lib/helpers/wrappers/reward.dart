import 'package:hive/hive.dart';

// dart run build_runner build
part 'reward.g.dart';

@HiveType(typeId: 3)
class Reward {
  @HiveField(0)
  int gold;
  @HiveField(1)
  int xp;
  Reward({this.gold = 0, this.xp = 0});
}
