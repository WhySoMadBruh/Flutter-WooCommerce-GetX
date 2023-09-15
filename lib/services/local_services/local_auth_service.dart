import 'package:hive/hive.dart';
import 'package:mbb/models/customer.dart';

class LocalAuthService {
  late Box<String> _tokenBox;
  late Box<String> _cookieBox;
  late Box<Customer> _customerBox;

  Future<void> init() async {
    _tokenBox = await Hive.openBox<String>('token');
    _cookieBox = await Hive.openBox<String>('cookie');
    _customerBox = await Hive.openBox<Customer>('customer');
  }

  Future<void> addToken({required String token}) async {
    await _tokenBox.clear();
    await _tokenBox.put('token', token);
  }

  Future<void> addCookie({required String cookie}) async {
    await _cookieBox.clear();
    await _cookieBox.put('cookie', cookie);
  }

  Future<void> addUser({required Customer customer}) async {
    await _customerBox.clear();
    await _customerBox.put('customer', customer);
  }

  // Future<void> clear() async {
  //   await _tokenBox.clear();
  //   await _cookieBox.clear();
  //   await _customerBox.clear();
  // }

  String? getToken() => _tokenBox.get('token');
  String? getCookie() => _cookieBox.get('cookie');
  Customer? getCustomer() => _customerBox.get('customer');
}
