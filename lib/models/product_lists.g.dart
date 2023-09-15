// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_lists.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductListsAdapter extends TypeAdapter<ProductLists> {
  @override
  final int typeId = 3;

  @override
  ProductLists read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductLists(
      id: fields[0] as int,
      name: fields[1] as String,
      sku: fields[2] as String,
      type: fields[4] as String,
      price: fields[5] as String,
      regularPrice: fields[6] as String,
      salePrice: fields[7] as String?,
      stockStatus: fields[8] as String,
      featuredImage: fields[9] as String,
      images: (fields[10] as List).cast<String>(),
      variations: (fields[11] as List?)?.cast<Variations>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductLists obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sku)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.regularPrice)
      ..writeByte(7)
      ..write(obj.salePrice)
      ..writeByte(8)
      ..write(obj.stockStatus)
      ..writeByte(9)
      ..write(obj.featuredImage)
      ..writeByte(10)
      ..write(obj.images)
      ..writeByte(11)
      ..write(obj.variations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VariationsAdapter extends TypeAdapter<Variations> {
  @override
  final int typeId = 4;

  @override
  Variations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variations(
      vid: fields[0] as int,
      regularPrice: fields[1] as String,
      salePrice: fields[2] as String,
      stockStatus: fields[3] as String,
      option: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Variations obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.vid)
      ..writeByte(1)
      ..write(obj.regularPrice)
      ..writeByte(2)
      ..write(obj.salePrice)
      ..writeByte(3)
      ..write(obj.stockStatus)
      ..writeByte(4)
      ..write(obj.option);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
