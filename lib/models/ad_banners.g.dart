// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_banners.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdBannerAdapter extends TypeAdapter<AdBanner> {
  @override
  final int typeId = 1;

  @override
  AdBanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdBanner(
      title: fields[0] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AdBanner obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdBannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
