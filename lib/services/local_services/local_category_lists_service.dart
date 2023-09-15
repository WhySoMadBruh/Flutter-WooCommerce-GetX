import 'package:hive/hive.dart';
import 'package:mbb/models/category_lists.dart';

class LocalCategoryListsService {
  late Box<CategoryLists> _categoryListsBox;

  Future<void> init() async {
    _categoryListsBox = await Hive.openBox('CategoryLists');
  }

  Future<void> assignCategoryLists(
      {required List<CategoryLists> categoryLists}) async {
    await _categoryListsBox.clear();
    await _categoryListsBox.addAll(categoryLists);
  }

  List<CategoryLists> getCategoryLists() => _categoryListsBox.values.toList();
}
