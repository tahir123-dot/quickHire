import 'package:mobile/provider/data/entity/service_entity.dart';
import 'package:mobile/provider/data/entity/sub_category_entity.dart';

abstract class ProviderState {}

/// ================= INITIAL =================
/// Represents the initial state of the provider-related operations.
class ProviderInitial extends ProviderState {}

/// ================= LOADING =================
/// Indicates that a provider-related operation is currently in progress.
/// This state can be used to show a loading indicator in the UI.
class ProviderLoading extends ProviderState {}

/// ================= SUCCESS =================
/// Represents a successful completion of a provider-related operation.
/// This state can be used to show a success message or update the UI accordingly.
class ProviderSuccess extends ProviderState {
  final String message;

  ProviderSuccess({required this.message});
}

/// ================= ERROR =================
/// Represents an error that occurred during a provider-related operation.
/// This state can be used to show an error message in the UI.
class ProviderError extends ProviderState {
  final String errorMessage;

  ProviderError({required this.errorMessage});
}

// sub categories loaded
class SubCategoriesLoaded extends ProviderState {
  final List<SubCategoryEntity> subCategories;
  SubCategoriesLoaded({required this.subCategories});
}

// serivces
class ServicesLoaded extends ProviderState {
  final List<ServiceEntity> services;
  ServicesLoaded({required this.services});
}
