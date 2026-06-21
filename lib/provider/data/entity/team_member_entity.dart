class TeamMemberEntity {
  final String id;
  final String serviceProviderId;
  final String ownerId;
  final String ownerType; // "ServiceProvider" ya "Member"
  final String name;

  // ✅ helper - owner hai ya nahi
  bool get isOwner => ownerType == 'ServiceProvider';

  TeamMemberEntity({
    required this.id,
    required this.serviceProviderId,
    required this.ownerId,
    required this.ownerType,
    required this.name,
  });
}
