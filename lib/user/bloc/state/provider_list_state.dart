import 'package:mobile/user/data/model/provider_info.dart';

abstract class ProviderListState {}

// this state use for provider list show on home screen on user side
class ProvidersListLoading extends ProviderListState {}

class ProvidersListLoaded extends ProviderListState {
  final List<ProviderInfoModel> providers;
  ProvidersListLoaded({required this.providers});
}

class ProvidersListError extends ProviderListState {
  final String message;
  ProvidersListError({required this.message});
}
