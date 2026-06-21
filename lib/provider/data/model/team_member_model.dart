class TeamMemberModel {
  final String id;
  final String serviceProviderId;
  final String ownerId;
  final String ownerType;
  final String name;

  TeamMemberModel({
    required this.id,
    required this.serviceProviderId,
    required this.ownerId,
    required this.ownerType,
    required this.name,
  });

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'],
      serviceProviderId: json['serviceProviderId'],
      ownerId: json['ownerId'],
      ownerType: json['ownerType'],
      name: json['name'],
    );
  }
}
