// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsDBAdapter extends TypeAdapter<UserDetailsDB> {
  @override
  final int typeId = 3;

  @override
  UserDetailsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsDB(
      customer_id: fields[0] as dynamic,
      name: fields[1] as String,
      email: fields[2] as dynamic,
      image: fields[3] as dynamic,
      phone: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsDB obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.customer_id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
