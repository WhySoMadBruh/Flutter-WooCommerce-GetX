import 'package:http/http.dart' as http;
import 'package:mbb/constants/config.dart';

class RemoteBannerService {
  var client = http.Client();

  var remoteUrl = '${Config.siteUrl}pages/278';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(
        '${Config.shopUrl}products/categories?parent=133&consumer_key=${Config.key}&consumer_secret=${Config.secret}'));
    return response;
  }
}
