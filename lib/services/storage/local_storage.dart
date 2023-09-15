import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static Future<String?> scrureRead({required String key}) async {
    const FlutterSecureStorage fss = FlutterSecureStorage();
    final result = await fss.read(key: key);
    return result;
  }

  static Future<void> secureWrite(
      {required String key, required String val}) async {
    const FlutterSecureStorage fss = FlutterSecureStorage();
    await fss.write(key: key, value: val);
  }

  static Future<void> secureRemove({required String key}) async {
    const FlutterSecureStorage fss = FlutterSecureStorage();
    await fss.delete(key: key);
  }
}
