import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/views/account/auth/signin_screen.dart';
import 'package:mbb/views/cart/cart_components/cart_list.dart';
import 'package:mbb/views/cart/cart_components/cart_loading.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Obx(() {
          if (authController.customer.value != null) {
            if (cartController.cart.value!.products!.isNotEmpty) {
              cartController.cart.value!.products!;
              return CartList(cart: cartController.cart.value!);
            } else {
              return const CartLoading();
            }
          } else {
            return const SignInScreen();
          }
        })
      ],
    ));
  }
}
