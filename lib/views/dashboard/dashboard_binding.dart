import 'package:get/get.dart';
import 'package:mbb/controller/auth_controller.dart';
import 'package:mbb/controller/cart_controller.dart';
import 'package:mbb/controller/dashboard_controller.dart';
import 'package:mbb/controller/home_controller.dart';
import 'package:mbb/controller/search_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SearchController());
    Get.put(DashboardController());
    Get.put(AuthController());
    Get.put(CartController());
  }
}
