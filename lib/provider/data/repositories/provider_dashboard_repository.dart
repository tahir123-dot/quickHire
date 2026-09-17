import 'package:mobile/provider/data/model/provider_dashbarod_model.dart';

abstract class ProviderDashboardRepository {
  Future<DashboardModel> getProviderDashboard();
}
