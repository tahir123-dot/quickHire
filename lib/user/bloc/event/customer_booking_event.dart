// customer_booking_event.dart
abstract class CustomerBookingEvent {}

class FetchCustomerBookingsEvent extends CustomerBookingEvent {}

class CancelCustomerBookingEvent extends CustomerBookingEvent {
  final String bookingId;
  CancelCustomerBookingEvent({required this.bookingId});
}
