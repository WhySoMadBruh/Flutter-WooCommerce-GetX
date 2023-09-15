import 'package:get/get.dart';
import './app_route.dart';
import 'package:mbb/views/dashboard/dashboard_binding.dart';
import '../views/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoute.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
