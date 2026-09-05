import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/user/bloc/event/provider_list_event.dart';
import 'package:mobile/user/bloc/state/provider_list_state.dart';
import 'package:mobile/user/data/repositories/provider_list/provider_list_repository.dart';

class ProviderListBloc extends Bloc<ProviderListEvent, ProviderListState> {
  final ProviderListRepository providerListRepository;

  ProviderListBloc(this.providerListRepository)
    : super(ProvidersListLoading()) {
    on<FetchProvidersHomeEvent>(_onFetchProvidersHome);
  }

  Future<void> _onFetchProvidersHome(
    FetchProvidersHomeEvent event,
    Emitter<ProviderListState> emit,
  ) async {
    emit(ProvidersListLoading());

    try {
      final providers = await providerListRepository.getProvidersByCategory(
        event.categoryId,
      );
      emit(ProvidersListLoaded(providers: providers));
    } catch (e) {
      emit(ProvidersListError(message: e.toString()));
    }
  }
}
