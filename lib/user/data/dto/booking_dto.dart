class SubmitBookingDto {
  final String serviceProviderId;
  final String? teamMemberId;
  final List<BookingServiceDto> services;
  final String startTime;
  final int totalDuration;
  final DateTime bookingDate;
  final double totalAmount;

  SubmitBookingDto({
    required this.serviceProviderId,
    this.teamMemberId,
    required this.services,
    required this.startTime,
    required this.totalDuration,
    required this.bookingDate,
    required this.totalAmount,
  });

  Map<String, dynamic> toJson() => {
    'service_provider_id': serviceProviderId,
    'team_member_id': teamMemberId,
    'services': services.map((s) => s.toJson()).toList(),
    'start_time': startTime,
    'total_duration': totalDuration,
    'booking_date': bookingDate.toIso8601String(),
    'total_amount': totalAmount,
  };
}

class BookingServiceDto {
  final String serviceId;
  final String name;
  final double price;
  final int duration;

  BookingServiceDto({
    required this.serviceId,
    required this.name,
    required this.price,
    required this.duration,
  });

  Map<String, dynamic> toJson() => {
    'service_id': serviceId,
    'name': name,
    'price': price,
    'duration': duration,
  };
}
