import 'package:mobile/provider/data/dto/service_provider_dto.dart';

abstract class ServiceProviderRepository {
  
  Future<void> createProviderProfile(InitServiceProviderDto dto);

  Future<void> createProviderBusinessDetails(UpdateBusinessDetailsDto dto);

 
  Future<void> createProviderBannerImage(UpdateBannerDto dto);
}
