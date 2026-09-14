abstract class ProviderBookingEvent {}

class FetchProviderBookingsEvent extends ProviderBookingEvent {}

class UpdateProviderBookingStatusEvent extends ProviderBookingEvent {
  final String bookingId;
  final String status;

  UpdateProviderBookingStatusEvent({
    required this.bookingId,
    required this.status,
  });
}
