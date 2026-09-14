// provider_profile_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/user/bloc/event/provider_profile_event.dart';
import 'package:mobile/user/bloc/state/provider_profile_state.dart';
import 'package:mobile/user/data/repositories/provider_list/provider_list_repository.dart';

class ProviderProfileViewBloc
    extends Bloc<ProviderProfileViewEvent, ProviderProfileViewState> {
  final ProviderListRepository repository;

  ProviderProfileViewBloc(this.repository)
    : super(ProviderProfileViewLoading()) {
    on<FetchProviderProfileByIdEvent>(_onFetch);
    on<FetchProviderTeamMembersEvent>(_onFetchTeamMembers);
    on<FetchProviderTeamMemberAvailabilityEvent>(
      _onFetchTeamMembersAvailability,
    );
    on<SubmitBookingEvent>(_onSubmitBooking);
  }

  // fetch provider profile by id
  Future<void> _onFetch(
    FetchProviderProfileByIdEvent event,
    Emitter<ProviderProfileViewState> emit,
  ) async {
    emit(ProviderProfileViewLoading());
    try {
      final provider = await repository.getProviderProfileById(
        event.providerId,
      );
      emit(ProviderProfileViewLoaded(provider: provider));
    } catch (e) {
      emit(ProviderProfileViewError(message: e.toString()));
    }
  }

  // fetch provider team members by id
  Future<void> _onFetchTeamMembers(
    FetchProviderTeamMembersEvent event,
    Emitter<ProviderProfileViewState> emit,
  ) async {
    emit(ProviderTeamMembersLoading());
    try {
      final teamMembers = await repository.getProviderTeamMembers(
        event.providerId,
      );
      emit(ProviderTeamMembersLoaded(teamMembers: teamMembers));
    } catch (e) {
      emit(ProviderTeamMembersError(message: e.toString()));
    }
  }

  // screen 4 fetch team availabiliyt
  Future<void> _onFetchTeamMembersAvailability(
    FetchProviderTeamMemberAvailabilityEvent event,
    Emitter<ProviderProfileViewState> emit,
  ) async {
    emit(ProviderTeamMemberAvailabilityLoading());
    try {
      final teamAvailability = await repository.getTeamMembersSlots(
        event.ownerId,
        event.date,
      );

      if (teamAvailability == null) {
        emit(ProviderTeamMemberAvailabilityEmpty());
      } else {
        emit(
          ProviderTeamMemberAvailabilityLoaded(
            teamAvailability: teamAvailability,
          ),
        );
      }
    } catch (e) {
      emit(ProviderTeamMemberAvailabilityError(message: e.toString()));
    }
  }

  // screen 5 submit booking
  Future<void> _onSubmitBooking(
    SubmitBookingEvent event,
    Emitter<ProviderProfileViewState> emit,
  ) async {
    emit(BookingSubmitLoading());
    try {
      final bookingId = await repository.submitBooking(event.dto);
      emit(BookingSubmitSuccess(bookingId: bookingId));
    } catch (e) {
      emit(BookingSubmitError(message: e.toString()));
    }
  }
}
