import 'package:mobile/user/data/datasources/user_data_sources.dart';
import 'package:mobile/user/data/model/provider_info.dart';
import 'package:mobile/user/data/repositories/provider_list/provider_list_repository.dart';

class ProviderListRepositoryImpl implements ProviderListRepository {
  final UserDataSources user;

  ProviderListRepositoryImpl(this.user);

  @override
  Future<List<ProviderInfoModel>> getProvidersByCategory(String categoryId) {
    return user.getProvidersByCategory(categoryId);
  }
}
