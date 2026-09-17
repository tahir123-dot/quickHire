import 'package:mobile/provider/data/datasources/provider_dashboard_datasource.dart';
import 'package:mobile/provider/data/model/provider_dashbarod_model.dart';
import 'package:mobile/provider/data/repositories/provider_dashboard_repository.dart';

class ProviderDashboardRepositoryImpl implements ProviderDashboardRepository {
  final ProviderDashboardDataSource dataSource;

  ProviderDashboardRepositoryImpl({required this.dataSource});

  // dashboard data load
  @override
  Future<DashboardModel> getProviderDashboard() async {
    final response = await dataSource.getProviderDashboard();

    if (response['success'] != true) {
      throw Exception(response['message'] ?? 'Failed to load dashboard');
    }

    return DashboardModel.fromJson(response['data']);
  }
}
