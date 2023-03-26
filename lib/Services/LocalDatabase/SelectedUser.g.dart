// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SelectedUser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedUsersAdapter extends TypeAdapter<SelectedUsers> {
  @override
  final int typeId = 0;

  @override
  SelectedUsers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedUsers()..users = (fields[0] as List?)?.cast<int>();
  }

  @override
  void write(BinaryWriter writer, SelectedUsers obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedUsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
