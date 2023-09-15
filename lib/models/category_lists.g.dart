// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_lists.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryListsAdapter extends TypeAdapter<CategoryLists> {
  @override
  final int typeId = 2;

  @override
  CategoryLists read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryLists(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryLists obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryListsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
