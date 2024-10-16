// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoutineItemAdapter extends TypeAdapter<RoutineItem> {
  @override
  final int typeId = 5;

  @override
  RoutineItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoutineItem(
      title: fields[1] as String,
    )
      ..id = fields[0] as String
      ..isDone = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, RoutineItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoutineItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
