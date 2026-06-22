class AvailabilityModel {
  final String ownerId;
  final String ownerType;
  final List<String> days;
  final String startTime;
  final String endTime;
  final int slotDuration;
  final String? breakStart;
  final String? breakEnd;

  AvailabilityModel({
    required this.ownerId,
    required this.ownerType,
    required this.days,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
    this.breakStart,
    this.breakEnd,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      ownerId: json['owner_id'],
      ownerType: json['ownerType'],
      days: List<String>.from(json['days']),
      startTime: json['start_time'],
      endTime: json['end_time'],
      slotDuration: json['slot_duration'],
      breakStart: json['break_start'],
      breakEnd: json['break_end'],
    );
  }
}
