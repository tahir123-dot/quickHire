import 'package:mobile/user/data/model/category_model.dart';

abstract class MainCategoriesRepository {
  // get main category for filter and for select account Type
  Future<List<CategoryModel>> getCategories();
}
