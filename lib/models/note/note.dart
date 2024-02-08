import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  String id;
  @HiveField(1)
  String content;
  @HiveField(2)
  DateTime date;

  Note({required this.id, required this.content, required this.date});
}
