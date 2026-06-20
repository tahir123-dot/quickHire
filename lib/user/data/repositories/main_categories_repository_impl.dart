import 'package:mobile/user/data/datasources/user_data_sources.dart';
import 'package:mobile/user/data/model/category_model.dart';
import 'package:mobile/user/data/repositories/main_categories_repository.dart';

class MainCategoriesRepositoryImpl implements MainCategoriesRepository {
  final UserDataSources user;

  MainCategoriesRepositoryImpl(this.user);

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await user.getCategories();
  }
}
