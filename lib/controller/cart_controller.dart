import 'dart:convert';

import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/models/cart.dart';
import 'package:mbb/services/remote_services/remote_cart_services.dart';
import 'package:mbb/services/remote_services/remote_checkout_service.dart';
import 'package:mbb/services/storage/local_storage.dart';
import 'package:mbb/services/remote_services/remote_auth_service.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  Rxn<Cart> cart = Rxn<Cart>().obs();

  @override
  void onInit() {
    if (isUserLoggedIn != false) {
      fetchCartProduct();
    }
    super.onInit();
  }

  Future<bool> isUserLoggedIn() async {
    final cookie = await LocalStorage.scrureRead(key: 'cookie');
    final token = await LocalStorage.scrureRead(key: 'token');

    try {
      var result = await RemoteAuthService()
          .isUserLoggedInfo(cookie: cookie, token: token);

      if (jsonDecode(result)['user'] != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  void addToCart(
      {required int userId, int? id, int? quantity, int? vid}) async {
    try {
      if (authController.customer.value != null) {
        var cartService = RemoteCartService();
        final int userID = authController.customer.value!.id!;
        var result = await cartService.addToCart(
          userId: userID,
          id: id,
          quantity: quantity,
          vid: vid,
        );

        if (jsonDecode(result.body)['cart'] != null) {
          cart.value = cartFromJson(result.body);
        }
      }
    } catch (e) {
      print(e);
    }

    // print(result);
  }

  void updateCart(
      {required dynamic userId,
      dynamic id,
      dynamic quantity,
      dynamic cartItemKey}) async {
    try {
      final cookie = await LocalStorage.scrureRead(key: 'cookie');
      final token = await LocalStorage.scrureRead(key: 'token');
      var userIdQuery = await RemoteAuthService()
          .isUserLoggedInfo(cookie: cookie, token: token);
      var userId = jsonDecode(userIdQuery)['user']['id'];
      var cartService = RemoteCartService();
      cartService.updateCart(
          userId: userId, id: id, quantity: quantity, cartItemKey: cartItemKey);
    } catch (e) {
      print(e);
    }
  }

  void deleteCartItem({required dynamic userId, dynamic cartItemKey}) async {
    try {
      final cookie = await LocalStorage.scrureRead(key: 'cookie');
      final token = await LocalStorage.scrureRead(key: 'token');
      var userIdQuery = await RemoteAuthService()
          .isUserLoggedInfo(cookie: cookie, token: token);
      var userId = jsonDecode(userIdQuery)['user']['id'];
      var cartService = RemoteCartService();
      cartService.removeFromCart(userId: userId, cartItemKey: cartItemKey);
      fetchCartProduct();
    } catch (e) {
      print(e);
    }
  }

  void fetchCartProduct() async {
    try {
      RemoteCheckoutService().getToken();

      final cookie = await LocalStorage.scrureRead(key: 'cookie');
      final token = await LocalStorage.scrureRead(key: 'token');
      var userIdQuery = await RemoteAuthService()
          .isUserLoggedInfo(cookie: cookie, token: token);
      var userId = jsonDecode(userIdQuery)['user']['id'];
      var cartService = RemoteCartService();
      var result = await cartService.fetchCartProducts(userId: userId);
      // print(json.decode(result.body));
      if (json.decode(result.body)['status'] != false) {
        cart.value = cartFromJson(result.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
