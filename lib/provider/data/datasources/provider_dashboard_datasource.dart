import 'package:dio/dio.dart';
import 'package:mobile/provider/data/api/api.dart';

abstract class ProviderDashboardDataSource {
  Future<Map<String, dynamic>> getProviderDashboard();
}

class ProviderDashboardDataSourceImpl implements ProviderDashboardDataSource {
  final Dio dio;

  ProviderDashboardDataSourceImpl({required this.dio});

  @override
  // dashboard
  Future<Map<String, dynamic>> getProviderDashboard() async {
    final response = await dio.get(ProviderApiEndPoints.providerDashboard);

    return response.data;
  }
}
