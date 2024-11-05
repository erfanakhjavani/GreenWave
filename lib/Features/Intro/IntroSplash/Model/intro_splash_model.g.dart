// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_splash_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntroSplashModelAdapter extends TypeAdapter<IntroSplashModel> {
  @override
  final int typeId = 0;

  @override
  IntroSplashModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntroSplashModel(
      data: fields[1] as String?,
      isRegistered: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, IntroSplashModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.isRegistered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntroSplashModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
