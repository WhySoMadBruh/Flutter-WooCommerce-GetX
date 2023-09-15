import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mbb/models/product_lists.dart';

import 'package:mbb/services/remote_services/remote_product_services.dart';

class SearchController extends GetxController {
  static SearchController instance = Get.find();

  RxList<ProductLists> productList =
      List<ProductLists>.empty(growable: true).obs;
  TextEditingController searchTextControoller = TextEditingController();
  RxBool isProductLoading = false.obs;
  RxString searchVal = ''.obs;
  int? catVal;
  int? totalRec;
  RxString tagVal = ''.obs;
  RxString pageNumberVal = ''.obs;
  RxString pageSizeVal = ''.obs;
  RxBool scrollVisibility = true.obs;

  @override
  void onInit() {
    getProductLists();
    super.onInit();
  }

  void changeStatus(RxBool status) {
    if (scrollVisibility != status) {
      scrollVisibility.toggle();
    }
  }

  Future<void> getProductLists(
      {int? pageNumber,
      int? pageSize,
      String? strSearch,
      int? categoryId,
      int totalRecord = 1,
      int? sortBy}) async {
    catVal = categoryId;
    totalRec = totalRecord;
    try {
      if (productList.isEmpty || pageNumber == 0) {
        isProductLoading(true);
        productList.clear();
      }
      if (productList.length <= totalRec!) {
        var result = await RemoteProductService().getProducts(
          pageSize: 20,
          strSearch: strSearch,
          categoryId: categoryId,
          sortBy: sortBy,
          pageNumber: pageNumber,
        );
        if (result != null) {
          productList.addAll(productListsListFromJson(result.body));
        }
      }
    } finally {
      isProductLoading(false);
    }
  }
}
