import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_dashboard_event.dart';
import 'package:mobile/provider/bloc/state/provider_dashboard_state.dart';
import 'package:mobile/provider/data/repositories/provider_dashboard_repository.dart';

class ProviderDashboardBloc
    extends Bloc<ProviderDashboardEvent, ProviderDashboardState> {
  final ProviderDashboardRepository repository;

  ProviderDashboardBloc({required this.repository})
    : super(ProviderDashboardInitial()) {
    on<GetProviderDashboard>(_onGetProviderDashboard);
  }

  Future<void> _onGetProviderDashboard(
    GetProviderDashboard event,
    Emitter<ProviderDashboardState> emit,
  ) async {
    emit(ProviderDashboardLoading());

    try {
      final dashboard = await repository.getProviderDashboard();

      emit(ProviderDashboardLoaded(dashboard: dashboard));
    } catch (e) {
      emit(ProviderDashboardError(message: e.toString()));
    }
  }
}
