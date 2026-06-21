import '../entity/team_member_entity.dart';
import '../model/team_member_model.dart';

class TeamMemberMapper {
  static TeamMemberEntity toEntity(TeamMemberModel model) {
    return TeamMemberEntity(
      id: model.id,
      serviceProviderId: model.serviceProviderId,
      ownerId: model.ownerId,
      ownerType: model.ownerType,
      name: model.name,
    );
  }

  static List<TeamMemberEntity> toEntityList(List<TeamMemberModel> models) {
    return models.map((m) => toEntity(m)).toList();
  }
}
