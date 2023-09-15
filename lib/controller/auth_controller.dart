import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:mbb/models/customer.dart';
import 'package:mbb/services/local_services/local_auth_service.dart';
import 'package:mbb/services/remote_services/remote_auth_service.dart';
import 'package:mbb/services/storage/local_storage.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<Customer?> customer = Rxn<Customer>().obs();
  final _localAuthService = LocalAuthService();

  @override
  void onInit() {
    _localAuthService.init();
    getLoggedInUserInfo();
    super.onInit();
  }

  void authenticateUser(
      {required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading',
        dismissOnTap: false,
      );
      var result =
          await RemoteAuthService().login(email: email, password: password);
      if (jsonDecode(result)['jwt_token'] != "") {
        String token = json.decode(result)['jwt_token'];
        String cookie = json.decode(result)['cookie'];

        await LocalStorage.secureRemove(key: 'cookie');
        await LocalStorage.secureRemove(key: 'token');
        await LocalStorage.secureWrite(key: "cookie", val: cookie);
        await LocalStorage.secureWrite(key: "token", val: token);

        customer.value = customerFromJson(result);
        await _localAuthService.addUser(customer: customer.value!);
      } else {
        EasyLoading.showError(jsonDecode(result)["message"]);
      }
    } catch (e) {
      // print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  int getCurrentUserId() {
    return authController.customer.value!.id!;
  }

  void getLoggedInUserInfo() async {
    final cookie = await LocalStorage.scrureRead(key: 'cookie');
    final token = await LocalStorage.scrureRead(key: 'token');
    await _localAuthService.init();
    final Customer? customerValue = _localAuthService.getCustomer();

    try {
      if (customerValue != null) {
        customer.value = customerValue;
      }

      var result = await RemoteAuthService()
          .isUserLoggedInfo(cookie: cookie, token: token);

      if (jsonDecode(result)['user'] != null) {
        customer.value = customerFromJson(result);
        await _localAuthService.addUser(customer: customer.value!);
      }
    } catch (e) {
      print(e);
    }
  }
}
