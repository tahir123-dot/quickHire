import 'package:mobile/provider/data/model/provider_dashbarod_model.dart';

abstract class ProviderDashboardState {}

class ProviderDashboardInitial extends ProviderDashboardState {}

class ProviderDashboardLoading extends ProviderDashboardState {}

class ProviderDashboardLoaded extends ProviderDashboardState {
  final DashboardModel dashboard;

  ProviderDashboardLoaded({required this.dashboard});
}

class ProviderDashboardError extends ProviderDashboardState {
  final String message;

  ProviderDashboardError({required this.message});
}
