import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/controller/dashboard_controller.dart';
import 'package:mbb/views/account/account_screen.dart';
import 'package:mbb/views/account/auth/signin_screen.dart';
import 'package:mbb/views/cart/cart_screen.dart';
import 'package:mbb/views/home/home_screen.dart';
import 'package:mbb/views/search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen(),
              SearchScreen(),
              CartScreen(),
              AccountScreen(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 0.6,
              ))),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showUnselectedLabels: true,
            currentIndex: controller.tabIndex,
            onTap: (val) {
              controller.updateIndex(val);
              if (1 == val) {
                searchController.productList.clear();
                searchController.getProductLists(
                  totalRecord: searchController.productList.length,
                );
              }
              if (2 == val) {
                cartController.fetchCartProduct();
              }
              if (3 == val) {
                if (authController.customer.value != null) {
                  controller.updateIndex(val);
                } else {
                  Get.to(const SignInScreen());
                }
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account')
            ],
          ),
        ),
      ),
    );
  }
}
