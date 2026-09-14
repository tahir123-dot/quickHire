// provider_profile_event.dart
import 'package:mobile/user/data/dto/booking_dto.dart';

abstract class ProviderProfileViewEvent {}

// screen 2 fetch provider profile by id event
class FetchProviderProfileByIdEvent extends ProviderProfileViewEvent {
  final String providerId;
  FetchProviderProfileByIdEvent({required this.providerId});
}

// screen 3 fetch provider team members by provider id event
class FetchProviderTeamMembersEvent extends ProviderProfileViewEvent {
  final String providerId;
  FetchProviderTeamMembersEvent({required this.providerId});
}

// screen 4 fetch provider team member availability by team member id event
class FetchProviderTeamMemberAvailabilityEvent
    extends ProviderProfileViewEvent {
  final String ownerId;
  final String date;
  FetchProviderTeamMemberAvailabilityEvent({
    required this.ownerId,
    required this.date,
  });
}

// screen 5 submit bookings
class SubmitBookingEvent extends ProviderProfileViewEvent {
  final SubmitBookingDto dto;
  SubmitBookingEvent({required this.dto});
}
