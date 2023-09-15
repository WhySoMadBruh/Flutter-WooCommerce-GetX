import 'package:http/http.dart' as http;
import 'package:mbb/constants/config.dart';

class RemoteProductService {
  var client = http.Client();

  Future<dynamic> getProducts(
      {int? pageNumber,
      int? pageSize,
      String? strSearch,
      int? categoryId,
      int? sortBy}) async {
    String parameter = "";
    if (pageNumber != null) {
      parameter += "&page=$pageNumber";
    }
    if (strSearch != null) {
      parameter += "&search=$strSearch";
    }
    if (categoryId != null) {
      parameter += "&category=$categoryId";
    }
    if (sortBy != null) {
      parameter += "&orderby=$sortBy";
    }
    var remoteProductUrl =
        '${Config.shopUrl}products?&per_page=$pageSize&consumer_key=${Config.key}&consumer_secret=${Config.secret}$parameter';
    var response = await client.get(Uri.parse(remoteProductUrl));
    return response;
  }

  // Future<dynamic> getVariationProducts(
  //     {required int id, required int vid}) async {
  //   var remotevariationProductUrl =
  //       '${Config.shopUrl}products/$id/variations/$vid/&consumer_key=${Config.key}&consumer_secret=${Config.secret}';
  //   var response = await client.get(Uri.parse(remotevariationProductUrl));
  //   return response;
  // }
}
