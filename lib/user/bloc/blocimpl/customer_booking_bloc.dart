import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/user/bloc/event/customer_booking_event.dart';
import 'package:mobile/user/bloc/state/customer_booking_state.dart';
import 'package:mobile/user/data/repositories/customer_bookings/customer_booking_repository.dart';

class CustomerBookingBloc
    extends Bloc<CustomerBookingEvent, CustomerBookingState> {
  final CustomerBookingRepository repository;

  CustomerBookingBloc(this.repository) : super(CustomerBookingLoading()) {
    on<FetchCustomerBookingsEvent>(_onFetchBookings);
    on<CancelCustomerBookingEvent>(_onCancelBooking);
  }

  // fetch booking
  Future<void> _onFetchBookings(
    FetchCustomerBookingsEvent event,
    Emitter<CustomerBookingState> emit,
  ) async {
    emit(CustomerBookingLoading());
    try {
      final bookings = await repository.getCustomerBookings();

      if (bookings.isEmpty) {
        emit(CustomerBookingEmpty());
      } else {
        emit(CustomerBookingLoaded(bookings: bookings));
      }
    } catch (e) {
      emit(CustomerBookingError(message: e.toString()));
    }
  }

  // cancel booking
  Future<void> _onCancelBooking(
    CancelCustomerBookingEvent event,
    Emitter<CustomerBookingState> emit,
  ) async {
    try {
      await repository.cancelBooking(event.bookingId);
      emit(CustomerBookingCancelSuccess());
    } catch (e) {
      emit(CustomerBookingCancelError(message: e.toString()));
    }
  }
}
