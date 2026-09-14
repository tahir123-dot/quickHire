import 'package:mobile/provider/data/model/provider_booking_model.dart';

abstract class ProviderBookingState {}

// fetch provider bookings list states
class ProviderBookingLoading extends ProviderBookingState {}

class ProviderBookingLoaded extends ProviderBookingState {
  final List<ProviderBookingModel> bookings;
  ProviderBookingLoaded({required this.bookings});
}

class ProviderBookingEmpty extends ProviderBookingState {}

class ProviderBookingError extends ProviderBookingState {
  final String message;
  ProviderBookingError({required this.message});
}

// update booking status

class ProviderBookingStatusUpdating extends ProviderBookingState {}

class ProviderBookingStatusUpdated extends ProviderBookingState {}

class ProviderBookingStatusUpdateError extends ProviderBookingState {
  final String message;

  ProviderBookingStatusUpdateError({required this.message});
}
