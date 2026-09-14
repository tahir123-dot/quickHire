// provider_booking_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_booking_event.dart';
import 'package:mobile/provider/bloc/state/provider_booking_state.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository.dart';

class ProviderBookingBloc
    extends Bloc<ProviderBookingEvent, ProviderBookingState> {
  final ServiceProviderRepository repository;

  ProviderBookingBloc(this.repository) : super(ProviderBookingLoading()) {
    on<FetchProviderBookingsEvent>(_onFetchBookings);
    on<UpdateProviderBookingStatusEvent>(_onUpdateStatus);
  }

  Future<void> _onFetchBookings(
    FetchProviderBookingsEvent event,
    Emitter<ProviderBookingState> emit,
  ) async {
    emit(ProviderBookingLoading());
    try {
      final bookings = await repository.getProviderBookings();

      if (bookings.isEmpty) {
        emit(ProviderBookingEmpty());
      } else {
        emit(ProviderBookingLoaded(bookings: bookings));
      }
    } catch (e) {
      emit(ProviderBookingError(message: e.toString()));
    }
  }

  // status update
  Future<void> _onUpdateStatus(
    UpdateProviderBookingStatusEvent event,
    Emitter<ProviderBookingState> emit,
  ) async {
    emit(ProviderBookingStatusUpdating());
    try {
      await repository.updateBookingStatus(event.bookingId, event.status);

      emit(ProviderBookingStatusUpdated());
      add(FetchProviderBookingsEvent());
    } catch (e) {
      emit(ProviderBookingStatusUpdateError(message: e.toString()));
    }
  }
}
