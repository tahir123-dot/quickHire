import 'package:mobile/provider/data/model/provider_booking_model.dart';

class ServiceProviderInfo {
  final String id;
  final String name;
  final String? phone;

  ServiceProviderInfo({required this.id, required this.name, this.phone});

  factory ServiceProviderInfo.fromJson(Map<String, dynamic> json) {
    return ServiceProviderInfo(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class CustomerBookingModel {
  final String id;
  final ServiceProviderInfo serviceProvider;
  final String? teamMemberId;
  final List<BookingServiceModel> services;
  final String startTime;
  final int totalDuration;
  final DateTime bookingDate;
  final double totalAmount;
  final String status;
  final String paymentStatus;
  final DateTime createdAt;

  CustomerBookingModel({
    required this.id,
    required this.serviceProvider,
    this.teamMemberId,
    required this.services,
    required this.startTime,
    required this.totalDuration,
    required this.bookingDate,
    required this.totalAmount,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
  });

  factory CustomerBookingModel.fromJson(Map<String, dynamic> json) {
    return CustomerBookingModel(
      id: json['id'],
      serviceProvider: ServiceProviderInfo.fromJson(json['service_provider']),
      teamMemberId: json['team_member_id'],
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
