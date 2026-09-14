// provider_profile_state.dart
import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/user/data/model/provider_profile.dart';
import 'package:mobile/user/data/model/team_availability_model.dart';

abstract class ProviderProfileViewState {}

class ProviderProfileViewLoading extends ProviderProfileViewState {}

class ProviderProfileViewLoaded extends ProviderProfileViewState {
  final ProviderProfileView provider;
  ProviderProfileViewLoaded({required this.provider});
}

class ProviderProfileViewError extends ProviderProfileViewState {
  final String message;
  ProviderProfileViewError({required this.message});
}

// screen 3 team member loading, loaded, error state
class ProviderTeamMembersLoading extends ProviderProfileViewState {}

// if empty
class ProviderTeamMemberAvailabilityEmpty extends ProviderProfileViewState {}

class ProviderTeamMembersLoaded extends ProviderProfileViewState {
  final List<TeamMemberEntity> teamMembers;
  ProviderTeamMembersLoaded({required this.teamMembers});
}

class ProviderTeamMembersError extends ProviderProfileViewState {
  final String message;
  ProviderTeamMembersError({required this.message});
}

// screen 4 provider team member availability loading, loaded, error state
class ProviderTeamMemberAvailabilityLoading extends ProviderProfileViewState {}

class ProviderTeamMemberAvailabilityLoaded extends ProviderProfileViewState {
  final TeamAvailabilityModel teamAvailability;
  ProviderTeamMemberAvailabilityLoaded({required this.teamAvailability});
}

class ProviderTeamMemberAvailabilityError extends ProviderProfileViewState {
  final String message;
  ProviderTeamMemberAvailabilityError({required this.message});
}

// screen 5 — Booking Submit ke states

class BookingSubmitInitial extends ProviderProfileViewState {}

class BookingSubmitLoading extends ProviderProfileViewState {}

class BookingSubmitSuccess extends ProviderProfileViewState {
  final String bookingId;
  BookingSubmitSuccess({required this.bookingId});
}

class BookingSubmitError extends ProviderProfileViewState {
  final String message;
  BookingSubmitError({required this.message});
}
