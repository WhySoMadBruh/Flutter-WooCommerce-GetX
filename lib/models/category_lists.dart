import 'dart:convert';
import 'package:hive/hive.dart';

part 'category_lists.g.dart';

List<CategoryLists> categoryListsListFromJson(String val) =>
    List<CategoryLists>.from(
        jsonDecode(val).map((banner) => CategoryLists.fromJson(banner)));

@HiveType(typeId: 2)
class CategoryLists {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;

  CategoryLists({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryLists.fromJson(Map<String, dynamic> data) => CategoryLists(
        id: data['id'],
        title: data['name'],
        image: data['image']['src'],
      );
}
