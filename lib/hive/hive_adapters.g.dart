// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: (fields[0] as num).toInt(),
      username: fields[1] as String,
      email: fields[2] as String,
      profilePictureUrl: fields[3] as String?,
      role: fields[4] as Roles,
      accessToken: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.profilePictureUrl)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RolesAdapter extends TypeAdapter<Roles> {
  @override
  final int typeId = 1;

  @override
  Roles read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Roles.admin;
      case 1:
        return Roles.user;
      default:
        return Roles.admin;
    }
  }

  @override
  void write(BinaryWriter writer, Roles obj) {
    switch (obj) {
      case Roles.admin:
        writer.writeByte(0);
      case Roles.user:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RolesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
