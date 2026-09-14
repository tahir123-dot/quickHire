import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/provider/data/mapper/team_member_mapper.dart';
import 'package:mobile/user/data/datasources/user_data_sources.dart';
import 'package:mobile/user/data/dto/booking_dto.dart';
import 'package:mobile/user/data/model/provider_info.dart';
import 'package:mobile/user/data/model/provider_profile.dart';
import 'package:mobile/user/data/model/team_availability_model.dart';
import 'package:mobile/user/data/repositories/provider_list/provider_list_repository.dart';

class ProviderListRepositoryImpl implements ProviderListRepository {
  final UserDataSources user;

  ProviderListRepositoryImpl(this.user);

  @override
  Future<List<ProviderInfoModel>> getProvidersByCategory(String categoryId) {
    return user.getProvidersByCategory(categoryId);
  }

  @override
  Future<ProviderProfileView> getProviderProfileById(String providerId) {
    return user.getProviderProfileById(providerId);
  }

  @override
  Future<List<TeamMemberEntity>> getProviderTeamMembers(
    String providerId,
  ) async {
    final models = await user.getProviderTeamMembers(providerId);
    return TeamMemberMapper.toEntityList(models);
  }

  @override
  Future<TeamAvailabilityModel?> getTeamMembersSlots(
    String ownerId,
    String date,
  ) {
    return user.getTeamMemberSlotsByDay(ownerId, date);
  }

  @override
  Future<String> submitBooking(SubmitBookingDto dto) async {
    return await user.submitBooking(dto.toJson());
  }
}
