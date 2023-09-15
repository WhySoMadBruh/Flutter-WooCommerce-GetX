import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mbb/constants/config.dart';
import 'package:mbb/controller/controllers.dart';

import '../storage/local_storage.dart';

class RemoteCheckoutService {
  var client = http.Client();

  Future<dynamic> getToken() async {
    const tokenUrl = 'https://localhost/wp-json/wc/v3/auth/token';

    final client = http.Client();
    final response = await client.post(
      Uri.parse(tokenUrl),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${Config.key}:${Config.secret}'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'token',
        'user_permissions': 'read', // or 'write' if you need write access
      },
    );

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      final token = jsonResponse['token'] as String;
      return token;
    } else {
      throw Exception('Failed to obtain token');
    }
  }

  Future<dynamic> createOrder() async {
    try {
      var body = {
        "payment_method": "cod",
        "payment_method_title": "Cash on Delivery",
        "set_paid": false,
        "billing": {
          "first_name": authController.customer.value!.firstName,
          "last_name": authController.customer.value!.lastName,
          "address_1": "",
          "address_2": "",
          "city": "",
          "state": "",
          "postcode": "",
          "country": "",
          "email": "",
          "phone": ""
        },
        "shipping": {
          "first_name": "",
          "last_name": "",
          "address_1": "",
          "address_2": "",
          "city": "",
          "state": "",
          "postcode": "",
          "country": ""
        },
        "line_items": [
          {"product_id": 1836, "quantity": 2}
        ],
        "shipping_lines": [
          {"method_id": "wcsdm", "method_title": "WooReer"}
        ]
      };
      var remoteProductUrl = 'https://localhost/wp-json/wc/v3/orders';
      final token = await LocalStorage.scrureRead(key: 'token');
      print(token);
      var response = await client.post(
        Uri.parse(remoteProductUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "$token",
        },
        body: jsonEncode(body),
      );
      print("order stats");
      print(json.decode(response.body));
    } catch (e) {
      print(e);
    }
  }
}
