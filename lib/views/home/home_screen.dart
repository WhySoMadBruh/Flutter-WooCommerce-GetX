import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/views/home/components/carousel_category/category_loading.dart';
import 'package:mbb/views/home/components/carousel_category/category_slider_view.dart';
import 'package:mbb/views/home/components/carousel_slider/carousel_loading.dart';
import 'package:mbb/views/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:mbb/views/home/components/carousel_product/product_loading.dart';
import 'package:mbb/views/home/components/carousel_product/product_slider_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (homeController.bannerList.isNotEmpty) {
                    return CarouselSliderView(
                      bannerList: homeController.bannerList,
                    );
                  } else {
                    return const CarouselLoading();
                  }
                }),
                Obx(() {
                  if (homeController.categoryList.isNotEmpty) {
                    return CategorySliderView(
                      categoryList: homeController.categoryList,
                    );
                  } else {
                    return const CategoryLoading();
                  }
                }),
                Obx(() {
                  if (homeController.productList.isNotEmpty) {
                    return PopularProduct(
                      popularProducts: homeController.productList,
                    );
                  } else {
                    return const ProductLoading();
                  }
                })
              ],
            ),
          )),
        ],
      ),
    );
  }
}
