import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/entity/availability_entity.dart';
import 'package:mobile/provider/data/entity/service_entity.dart';
import 'package:mobile/provider/data/entity/sub_category_entity.dart';
import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/provider/data/model/provider_booking_model.dart';

abstract class ServiceProviderRepository {
  Future<void> createProviderProfile(InitServiceProviderDto dto);
  Future<void> createProviderBusinessDetails(UpdateBusinessDetailsDto dto);
  Future<void> createProviderBannerImage(UpdateBannerDto dto);
  Future<List<SubCategoryEntity>> getSubCategories();
  Future<void> addProviderService(AddServiceDto dto);
  Future<List<ServiceEntity>> getProviderServices();
  Future<void> deleteProviderService(String serviceId);
  Future<List<TeamMemberEntity>> getTeamList();
  Future<void> deleteTeamMember(String teamMemberId);
  Future<void> addAvailability(AddAvailabilityDto dto);
  Future<AvailabilityEntity?> getAvailability();

  Future<List<ProviderBookingModel>> getProviderBookings();
  Future<void> updateBookingStatus(String bookingId, String status);
}
