import 'package:mobile/provider/data/datasources/provider_data_sources.dart';
import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/entity/availability_entity.dart';
import 'package:mobile/provider/data/entity/service_entity.dart';
import 'package:mobile/provider/data/entity/sub_category_entity.dart';
import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/provider/data/mapper/availability_mapper.dart';
import 'package:mobile/provider/data/mapper/service_mapper.dart';
import 'package:mobile/provider/data/mapper/sub_category_mapper.dart';
import 'package:mobile/provider/data/mapper/team_member_mapper.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository.dart';

class ServiceProviderRepositoryImpl implements ServiceProviderRepository {
  final ProviderDataSources dataSource;

  ServiceProviderRepositoryImpl(this.dataSource);

  @override
  Future<void> createProviderProfile(InitServiceProviderDto dto) async {
    await dataSource.createProviderProfile(dto.toJson());
  }

  @override
  Future<void> createProviderBusinessDetails(
    UpdateBusinessDetailsDto dto,
  ) async {
    final formData = await dto.toFormData();
    await dataSource.createBusinessDetails(formData);
  }

  @override
  Future<void> createProviderBannerImage(UpdateBannerDto dto) async {
    final formData = await dto.toFormData();
    await dataSource.createBannerImage(formData);
  }

  @override
  Future<List<SubCategoryEntity>> getSubCategories() async {
    final models = await dataSource.getSubCategories();
    return SubCategoryMapper.toEntityList(models); // Model → Entity
  }

  @override
  Future<void> addProviderService(AddServiceDto dto) async {
    await dataSource.addService(dto.toJson());
  }

  @override
  Future<List<ServiceEntity>> getProviderServices() async {
    final models = await dataSource.getProviderServices();
    return ServiceMapper.toEntityList(models);
  }

  @override
  Future<void> deleteProviderService(String serviceId) async {
    await dataSource.deleteService(serviceId);
  }

  @override
  Future<List<TeamMemberEntity>> getTeamList() async {
    final models = await dataSource.getTeamList();
    return TeamMemberMapper.toEntityList(models);
  }

  @override
  Future<void> deleteTeamMember(String teamMemberId) async {
    await dataSource.deleteTeamMember(teamMemberId);
  }

  @override
  Future<void> addAvailability(AddAvailabilityDto dto) async {
    await dataSource.addAvailability(dto.toJson());
  }

  @override
  Future<AvailabilityEntity?> getAvailability() async {
    final model = await dataSource.getAvailability();
    if (model == null) return null;
    return AvailabilityMapper.toEntity(model);
  }
}
