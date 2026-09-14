import 'package:mobile/user/data/model/customer_booking_model.dart';

abstract class CustomerBookingState {}

class CustomerBookingLoading extends CustomerBookingState {}

class CustomerBookingLoaded extends CustomerBookingState {
  final List<CustomerBookingModel> bookings;
  CustomerBookingLoaded({required this.bookings});
}

class CustomerBookingEmpty extends CustomerBookingState {}

class CustomerBookingError extends CustomerBookingState {
  final String message;
  CustomerBookingError({required this.message});
}

// cancel
class CustomerBookingCancelSuccess extends CustomerBookingState {}

class CustomerBookingCancelError extends CustomerBookingState {
  final String message;
  CustomerBookingCancelError({required this.message});
}
