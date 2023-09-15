import 'dart:convert';

import 'package:hive/hive.dart';

part 'product_lists.g.dart';

List<ProductLists> productListsListFromJson(String val) =>
    List<ProductLists>.from(
        jsonDecode(val).map((procuts) => ProductLists.fromJson(procuts)));

@HiveType(typeId: 3)
class ProductLists {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String sku;
  @HiveField(4)
  String type;
  @HiveField(5)
  String price;
  @HiveField(6)
  String regularPrice;
  @HiveField(7)
  String? salePrice;
  @HiveField(8)
  String stockStatus;
  @HiveField(9)
  String featuredImage;
  @HiveField(10)
  List<String> images;
  @HiveField(11)
  List<Variations>? variations;

  ProductLists({
    required this.id,
    required this.name,
    required this.sku,
    required this.type,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.stockStatus,
    required this.featuredImage,
    required this.images,
    required this.variations,
  });

  factory ProductLists.fromJson(Map<String, dynamic> data) {
    return ProductLists(
      id: data['id'],
      name: data['name'],
      sku: data['sku'],
      type: data['type'],
      price: data['price'],
      regularPrice: data['regular_price'],
      salePrice: data['sale_price'],
      stockStatus: data['stock_status'],
      featuredImage: data['images'][0]['src'],
      images: List<String>.from(data['images'].map((image) => image['src'])),
      variations: (data['type'] == 'variable')
          ? List<Variations>.from(data['product_variations']
              .map((data) => Variations.fromJson(data)))
          : [],
    );
  }
}

@HiveType(typeId: 4)
class Variations {
  @HiveField(0)
  int vid;
  @HiveField(1)
  String regularPrice;
  @HiveField(2)
  String salePrice;
  @HiveField(3)
  String stockStatus;
  @HiveField(4)
  String option;

  Variations({
    required this.vid,
    required this.regularPrice,
    required this.salePrice,
    required this.stockStatus,
    required this.option,
  });

  factory Variations.fromJson(Map<String, dynamic> data) => Variations(
        vid: data['id'],
        regularPrice: data['regular_price'].toString(),
        salePrice: data['sale_price'].toString(),
        stockStatus: data['stock_status'] ?? "",
        option: data['attributes'][0]['option'],
      );
}
