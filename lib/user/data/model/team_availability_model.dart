class TeamAvailabilityModel {
  final String id;
  final String ownerId;
  final String ownerType;
  final List<String> slots;

  TeamAvailabilityModel({
    required this.id,
    required this.ownerId,
    required this.ownerType,
    required this.slots,
  });

  // convert json to model
  factory TeamAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return TeamAvailabilityModel(
      id: json['id'],
      ownerId: json['ownerId'],
      ownerType: json['ownerType'],
      slots: List<String>.from(json['slots']),
    );
  }
}
