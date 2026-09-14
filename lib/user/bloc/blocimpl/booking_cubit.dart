// booking_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/user/bloc/state/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState());

  // Screen 1 se aane wala data
  void setProviderInfo({
    required String providerId,
    required String providerName,
    required String providerImage,
    String? location,
  }) {
    emit(
      state.copyWith(
        providerId: providerId,
        providerName: providerName,
        providerImage: providerImage,
        location: location,
      ),
    );
  }

  void setSelectedServices(List<SelectedServiceInfo> services) {
    emit(state.copyWith(selectedServices: services));
  }

  // Screen 2 se aane wala data
  void setTeamMember({
    required String memberId,
    required String memberName,
    required String ownerId,
  }) {
    emit(
      state.copyWith(
        memberId: memberId,
        memberName: memberName,
        ownerId: ownerId,
      ),
    );
  }

  // Screen 3 se aane wala data
  void setDateTime({required DateTime date, required String time}) {
    emit(state.copyWith(selectedDate: date, selectedTime: time));
  }

  // Reset — jab booking complete ho jaye ya cancel ho
  void reset() {
    emit(BookingState());
  }
}
