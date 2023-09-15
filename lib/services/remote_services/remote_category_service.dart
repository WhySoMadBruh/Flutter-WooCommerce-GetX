import 'package:http/http.dart' as http;
import 'package:mbb/constants/config.dart';

class RemoteCategoryService {
  var client = http.Client();

  var remoteUrl =
      '${Config.shopUrl}products/categories?per_page=100&exclude=133,134,135,136&hide_empty=1&consumer_key=${Config.key}&consumer_secret=${Config.secret}';
  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }
}
