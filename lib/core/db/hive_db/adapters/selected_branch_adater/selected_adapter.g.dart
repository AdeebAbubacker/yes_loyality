// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedBranchDBAdapter extends TypeAdapter<SelectedBranchDB> {
  @override
  final int typeId = 1;

  @override
  SelectedBranchDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedBranchDB(
      selctedBranchName: fields[0] as String,
      id: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedBranchDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.selctedBranchName)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedBranchDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
