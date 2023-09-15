import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banners.g.dart';

List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
    jsonDecode(val).map((banner) => AdBanner.fromJson(banner)));

@HiveType(typeId: 1)
class AdBanner {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;

  AdBanner({required this.title, required this.image});

  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
        title: data['name'],
        image: data['image']['src'],
      );
}
