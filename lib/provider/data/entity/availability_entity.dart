class AvailabilityEntity {
  final String ownerId;
  final String ownerType;
  final List<String> days;
  final String startTime;
  final String endTime;
  final int slotDuration;
  final String? breakStart;
  final String? breakEnd;

  AvailabilityEntity({
    required this.ownerId,
    required this.ownerType,
    required this.days,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
    this.breakStart,
    this.breakEnd,
  });
}
