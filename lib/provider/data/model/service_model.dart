class ServiceModel {
  final String id;
  final String serviceName;
  final int serviceDuration;
  final double servicePrice;
  final String createdAt;

  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
    required this.createdAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      serviceName: json['service_name'],
      serviceDuration: json['service_duration'],
      servicePrice: (json['service_price'] as num).toDouble(),
      createdAt: json['createdAt'],
    );
  }
}
