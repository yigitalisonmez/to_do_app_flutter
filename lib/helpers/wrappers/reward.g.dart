// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RewardAdapter extends TypeAdapter<Reward> {
  @override
  final int typeId = 3;

  @override
  Reward read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reward(
      gold: fields[0] as int,
      xp: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Reward obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gold)
      ..writeByte(1)
      ..write(obj.xp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RewardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
