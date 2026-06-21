import 'package:mobile/provider/data/datasources/provider_data_sources.dart';
import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/entity/service_entity.dart';
import 'package:mobile/provider/data/entity/sub_category_entity.dart';
import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/provider/data/mapper/service_mapper.dart';
import 'package:mobile/provider/data/mapper/sub_category_mapper.dart';
import 'package:mobile/provider/data/mapper/team_member_mapper.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository.dart';

class ServiceProviderRepositoryImpl implements ServiceProviderRepository {
  final ProviderDataSources dataSource;

  ServiceProviderRepositoryImpl(this.dataSource);

  @override
  Future<void> createProviderBusinessDetails(
    UpdateBusinessDetailsDto dto,
  ) async {
    const serviceProviderId = '6a1e6abbb5759b02bac59cc1';

    final formData = await dto.toFormData();
    await dataSource.createBusinessDetails(formData, serviceProviderId);
  }

  @override
  Future<void> createProviderProfile(InitServiceProviderDto dto) {
    throw UnimplementedError();
  }

  @override
  Future<void> createProviderBannerImage(UpdateBannerDto dto) async {
    const serviceProviderId = '6a1e6abbb5759b02bac59cc1';
    final formData = await dto.toFormData();
    await dataSource.createBannerImage(formData, serviceProviderId);
  }

  @override
  Future<List<SubCategoryEntity>> getSubCategories(String categoryId) async {
    final models = await dataSource.getSubCategories(categoryId);
    return SubCategoryMapper.toEntityList(models); // Model → Entity
  }

  @override
  Future<void> addProviderService(AddServiceDto dto) async {
    await dataSource.addService(dto.toJson());
  }

  @override
  Future<List<ServiceEntity>> getProviderServices(
    String serviceProviderId,
  ) async {
    final models = await dataSource.getProviderServices(serviceProviderId);
    return ServiceMapper.toEntityList(models);
  }

  @override
  Future<void> deleteProviderService(String serviceId) async {
    await dataSource.deleteService(serviceId);
  }

  @override
  Future<List<TeamMemberEntity>> getTeamList(String serviceProviderId) async {
    final models = await dataSource.getTeamList(serviceProviderId);
    return TeamMemberMapper.toEntityList(models);
  }
}
