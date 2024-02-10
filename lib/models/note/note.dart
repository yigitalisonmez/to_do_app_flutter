import 'package:hive/hive.dart';
// dart run build_runner build
part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime date;

  Note({required this.title, this.content = '', required this.date});
}
