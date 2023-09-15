import 'package:get/get.dart';

import 'package:mbb/models/ad_banners.dart';
import 'package:mbb/models/category_lists.dart';
import 'package:mbb/models/product_lists.dart';
import 'package:mbb/services/local_services/local_ad_banner_service.dart';
import 'package:mbb/services/local_services/local_category_lists_service.dart';
import 'package:mbb/services/local_services/local_product_lists_service.dart';

import 'package:mbb/services/remote_services/remote_banner_service.dart';
import 'package:mbb/services/remote_services/remote_product_services.dart';
import '../services/remote_services/remote_category_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;

  RxList<CategoryLists> categoryList =
      List<CategoryLists>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  RxList<ProductLists> productList =
      List<ProductLists>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

  final LocalAdBannersService _localAdBannersService = LocalAdBannersService();
  final LocalCategoryListsService _localCategoryListsService =
      LocalCategoryListsService();
  final LocalProductListsService _localProductListsService =
      LocalProductListsService();

  @override
  void onInit() async {
    await _localAdBannersService.init();
    await _localCategoryListsService.init();
    await _localProductListsService.init();
    getAdBanners();
    getCategoryLists();
    getProductLists();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //assign local ad banners before call api
      if (_localAdBannersService.getAdBanners().isNotEmpty) {
        bannerList.assignAll((_localAdBannersService.getAdBanners()));
      }

      //call api
      var result = await RemoteBannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(adBannerListFromJson(result.body));

        //save api result to local fb
        _localAdBannersService.assignAllAdBanners(
            adbanners: adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getCategoryLists() async {
    try {
      isCategoryLoading(true);
      if (_localCategoryListsService.getCategoryLists().isNotEmpty) {
        categoryList.assignAll((_localCategoryListsService.getCategoryLists()));
      }
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListsListFromJson(result.body));
        _localCategoryListsService.assignCategoryLists(
            categoryLists: categoryListsListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getProductLists() async {
    try {
      isProductLoading(true);
      if (_localProductListsService.getProductLists().isNotEmpty) {
        productList.assignAll((_localProductListsService.getProductLists()));
      }
      var result = await RemoteProductService().getProducts(pageSize: 20);
      if (result != null) {
        productList.assignAll(productListsListFromJson(result.body));
        _localProductListsService.assignProductLists(
            productsLists: productListsListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
    }
  }
}
