import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/user/data/dto/booking_dto.dart';
import 'package:mobile/user/data/model/provider_info.dart';
import 'package:mobile/user/data/model/provider_profile.dart';
import 'package:mobile/user/data/model/team_availability_model.dart';

abstract class ProviderListRepository {
  Future<List<ProviderInfoModel>> getProvidersByCategory(String categoryId);

  // fetch proivder by id
  Future<ProviderProfileView> getProviderProfileById(String providerId);

  // fetch provider team members by provider id
  Future<List<TeamMemberEntity>> getProviderTeamMembers(String providerId);

  // fetch team member availbilty
  Future<TeamAvailabilityModel?> getTeamMembersSlots(
    String ownerId,
    String date,
  );

  // submit booking
  Future<String> submitBooking(SubmitBookingDto dto);
}
