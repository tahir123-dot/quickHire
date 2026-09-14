class BookingServiceModel {
  final String serviceId;
  final String name;
  final double price;
  final int duration;

  BookingServiceModel({
    required this.serviceId,
    required this.name,
    required this.price,
    required this.duration,
  });

  factory BookingServiceModel.fromJson(Map<String, dynamic> json) {
    return BookingServiceModel(
      serviceId: json['service_id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      duration: json['duration'],
    );
  }
}

class CustomerInfo {
  final String id;
  final String name;
  final String? phone;

  CustomerInfo({required this.id, required this.name, this.phone});

  factory CustomerInfo.fromJson(Map<String, dynamic> json) {
    return CustomerInfo(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class ProviderBookingModel {
  final String id;
  final CustomerInfo customer;
  final String? teamMemberId;
  final String? teamMemberName;
  final List<BookingServiceModel> services;
  final String startTime;
  final int totalDuration;
  final DateTime bookingDate;
  final double totalAmount;
  final String status;
  final String paymentStatus;
  final DateTime createdAt;

  ProviderBookingModel({
    required this.id,
    required this.customer,
    this.teamMemberId,
    this.teamMemberName,
    required this.services,
    required this.startTime,
    required this.totalDuration,
    required this.bookingDate,
    required this.totalAmount,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
  });

  factory ProviderBookingModel.fromJson(Map<String, dynamic> json) {
    return ProviderBookingModel(
      id: json['id'],
      customer: CustomerInfo.fromJson(json['customer']),
      teamMemberId: json['team_member_id'],
      teamMemberName:
          json['team_member_name'], // abhi null aayegi, baad mein aana shuru hogi
      services: (json['services'] as List)
          .map((s) => BookingServiceModel.fromJson(s))
          .toList(),
      startTime: json['start_time'],
      totalDuration: json['total_duration'],
      bookingDate: DateTime.parse(json['booking_date']),
      totalAmount: (json['total_amount'] as num).toDouble(),
      status: json['status'],
      paymentStatus: json['payment_status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
