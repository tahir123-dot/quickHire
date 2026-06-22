import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/entity/availability_entity.dart';
import 'package:mobile/provider/data/entity/service_entity.dart';
import 'package:mobile/provider/data/entity/sub_category_entity.dart';
import 'package:mobile/provider/data/entity/team_member_entity.dart';

abstract class ServiceProviderRepository {
  Future<void> createProviderProfile(InitServiceProviderDto dto);
  Future<void> createProviderBusinessDetails(UpdateBusinessDetailsDto dto);
  Future<void> createProviderBannerImage(UpdateBannerDto dto);
  Future<List<SubCategoryEntity>> getSubCategories(String categoryId);
  Future<void> addProviderService(AddServiceDto dto);
  Future<List<ServiceEntity>> getProviderServices(String serviceProviderId);
  Future<void> deleteProviderService(String serviceId);
  Future<List<TeamMemberEntity>> getTeamList(String serviceProviderId);
  Future<void> deleteTeamMember(String teamMemberId);
  Future<void> addAvailability(AddAvailabilityDto dto);
  Future<AvailabilityEntity> getAvailability(String ownerId);
}
