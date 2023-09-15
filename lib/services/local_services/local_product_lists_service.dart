import 'package:hive/hive.dart';
import 'package:mbb/models/product_lists.dart';

class LocalProductListsService {
  late Box<ProductLists> _productListsBox;

  Future<void> init() async {
    _productListsBox = await Hive.openBox('ProductLists');
  }

  Future<void> assignProductLists(
      {required List<ProductLists> productsLists}) async {
    await _productListsBox.clear();
    await _productListsBox.addAll(productsLists);
  }

  List<ProductLists> getProductLists() => _productListsBox.values.toList();
}
