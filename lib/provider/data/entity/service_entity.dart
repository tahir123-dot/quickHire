class ServiceEntity {
  final String id;
  final String serviceName;
  final int serviceDuration;
  final double servicePrice;
  final String createdAt;

  ServiceEntity({
    required this.id,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
    required this.createdAt,
  });
}
