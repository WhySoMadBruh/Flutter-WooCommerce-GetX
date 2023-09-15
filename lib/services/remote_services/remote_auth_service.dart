import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/config.dart';

class RemoteAuthService {
  var client = http.Client();

  Future<dynamic> signUp({required email, required password}) async {}
  Future<dynamic> login({required email, required password}) async {
    var response = await client.post(
        Uri.parse('${Config.utilUrl}${Config.signIn}'),
        body: jsonEncode({"email": email, "password": password}));
    return response.body;
  }

  Future<dynamic> isUserLoggedInfo(
      {required cookie, required token, bool returnData = false}) async {
    var response = await client.get(
      Uri.parse(
          '${Config.utilUrl}${Config.userInfo}?cookie=$cookie&token=$token'),
    );
    return response.body;
  }
}
