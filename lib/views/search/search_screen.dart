import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/views/search/components/products_loading_grid.dart';
import 'package:mbb/views/search/components/product_list_view.dart';

import '../../components/main_header.dart';
import '../home/components/carousel_category/category_loading.dart';
import '../home/components/carousel_category/category_slider_view.dart';

class SearchScreen extends StatefulWidget {
  final int? categoryId;
  const SearchScreen({super.key, this.categoryId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      const MainHeader(),
      Obx(() {
        if (homeController.categoryList.isNotEmpty) {
          return Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: searchController.scrollVisibility == RxBool(true)
                  ? true
                  : false,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity:
                    searchController.scrollVisibility == RxBool(true) ? 1 : 0,
                child: CategorySliderView(
                  categoryList: homeController.categoryList,
                ),
              ));
        } else {
          return const CategoryLoading();
        }
      }),
      Expanded(
        child: Obx(() {
          if (searchController.productList.isNotEmpty) {
            return ProductListView(
              categoryID: searchController.catVal,
              products: searchController.productList,
              totalRecord: searchController.productList.length,
            );
          } else {
            return const ProductsLoadingGrid();
          }
        }),
      )
    ]));
  }
}
