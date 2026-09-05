abstract class ProviderListEvent {}

// Home screen py providers load karni ho
class FetchProvidersHomeEvent extends ProviderListEvent {
  final String categoryId;

  FetchProvidersHomeEvent({required this.categoryId});
}
