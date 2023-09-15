import 'package:flutter/material.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/models/category_lists.dart';
import 'package:mbb/views/home/components/carousel_category/category_card.dart';

class CategorySliderView extends StatefulWidget {
  final List<CategoryLists> categoryList;
  const CategorySliderView({super.key, required this.categoryList});

  @override
  State<CategorySliderView> createState() => _CategorySliderViewState();
}

class _CategorySliderViewState extends State<CategorySliderView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeController.categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            imageUrl: homeController.categoryList[index].image,
            name: homeController.categoryList[index].title,
            id: homeController.categoryList[index].id,
          );
        },
      ),
    );
  }
}
