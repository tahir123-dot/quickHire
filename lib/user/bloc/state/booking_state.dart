// booking_state.dart

class BookingState {
  // Provider info
  final String? providerId;
  final String? providerName;
  final String? providerImage;
  final String? location;

  // Services
  final List<SelectedServiceInfo> selectedServices;

  // Team member
  final String? memberId;
  final String? memberName;
  final String? ownerId;

  // Date & Time
  final DateTime? selectedDate;
  final String? selectedTime;

  BookingState({
    this.providerId,
    this.providerName,
    this.providerImage,
    this.location,
    this.selectedServices = const [],
    this.memberId,
    this.memberName,
    this.ownerId,
    this.selectedDate,
    this.selectedTime,
  });

  // copyWith — sirf jo field change ho ge, wahi update ho ge
  BookingState copyWith({
    String? providerId,
    String? providerName,
    String? providerImage,
    String? location,
    List<SelectedServiceInfo>? selectedServices,
    String? memberId,
    String? memberName,
    String? ownerId,
    DateTime? selectedDate,
    String? selectedTime,
  }) {
    return BookingState(
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      providerImage: providerImage ?? this.providerImage,
      location: location ?? this.location,
      selectedServices: selectedServices ?? this.selectedServices,
      memberId: memberId ?? this.memberId,
      memberName: memberName ?? this.memberName,
      ownerId: ownerId ?? this.ownerId,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}

class SelectedServiceInfo {
  final String serviceId;
  final String name;
  final int duration;
  final double price;

  SelectedServiceInfo({
    required this.serviceId,
    required this.name,
    required this.duration,
    required this.price,
  });
}
