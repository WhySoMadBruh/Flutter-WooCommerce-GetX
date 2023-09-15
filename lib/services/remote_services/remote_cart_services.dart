import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mbb/constants/config.dart';

class RemoteCartService {
  var client = http.Client();

  Future<dynamic> fetchCartProducts({required userId}) async {
    try {
      var response = await client.get(
        Uri.parse('${Config.shopUrl}${Config.fetchFromCart}?user_id=$userId'),
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> updateCart(
      {required int userId,
      int? id,
      int? quantity = 1,
      String? cartItemKey}) async {
    try {
      var body = {
        "user_id": userId,
        "products": {
          "product_id": id,
          "quantity": quantity,
          "cart_item_key": cartItemKey,
        }
      };
      var remoteProductUrl = '${Config.shopUrl}${Config.updateCart}';
      var response = await client.post(
        Uri.parse(remoteProductUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      print(json.decode(response.body));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> removeFromCart(
      {required int userId, String? cartItemKey}) async {
    try {
      var body = {
        "user_id": userId,
        "cart_item_key": cartItemKey,
      };
      var remoteProductUrl = '${Config.shopUrl}${Config.removeFromCart}';
      var response = await client.post(
        Uri.parse(remoteProductUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      print(json.decode(response.body));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> addToCart(
      {required int userId, int? id, int? quantity = 1, int? vid}) async {
    try {
      var body = {
        "user_id": userId,
        "products": {
          "product_id": id,
          "quantity": quantity,
          "variation_id": vid,
        }
      };
      var remoteProductUrl = '${Config.shopUrl}${Config.addToCart}';
      var response = await client.post(
        Uri.parse(remoteProductUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
      print(response.body);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
