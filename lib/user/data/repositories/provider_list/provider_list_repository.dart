import 'package:mobile/user/data/model/provider_info.dart';

abstract class ProviderListRepository {
  Future<List<ProviderInfoModel>> getProvidersByCategory(String categoryId);
}
