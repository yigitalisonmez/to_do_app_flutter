// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoutineAdapter extends TypeAdapter<Routine> {
  @override
  final int typeId = 2;

  @override
  Routine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Routine(
      id: fields[0] as String,
      routineName: fields[1] as String,
      routineList: (fields[2] as List).cast<RoutineItem>(),
      dayTime: fields[3] as DayTime,
    );
  }

  @override
  void write(BinaryWriter writer, Routine obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.routineName)
      ..writeByte(2)
      ..write(obj.routineList)
      ..writeByte(3)
      ..write(obj.dayTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoutineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DayTimeAdapter extends TypeAdapter<DayTime> {
  @override
  final int typeId = 4;

  @override
  DayTime read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayTime.Morning;
      case 1:
        return DayTime.Afternoon;
      case 2:
        return DayTime.Evening;
      case 3:
        return DayTime.Night;
      case 4:
        return DayTime.Other;
      default:
        return DayTime.Morning;
    }
  }

  @override
  void write(BinaryWriter writer, DayTime obj) {
    switch (obj) {
      case DayTime.Morning:
        writer.writeByte(0);
        break;
      case DayTime.Afternoon:
        writer.writeByte(1);
        break;
      case DayTime.Evening:
        writer.writeByte(2);
        break;
      case DayTime.Night:
        writer.writeByte(3);
        break;
      case DayTime.Other:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
