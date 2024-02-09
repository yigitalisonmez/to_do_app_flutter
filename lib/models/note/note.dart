import 'package:hive/hive.dart';
// dart run build_runner build
part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  DateTime date;

  Note(
      {required this.id,
      required this.title,
      this.content = '',
      required this.date});
}
