import '../entity/availability_entity.dart';
import '../model/availability_model.dart';

class AvailabilityMapper {
  static AvailabilityEntity toEntity(AvailabilityModel model) {
    return AvailabilityEntity(
      ownerId: model.ownerId,
      ownerType: model.ownerType,
      days: model.days,
      startTime: model.startTime,
      endTime: model.endTime,
      slotDuration: model.slotDuration,
      breakStart: model.breakStart,
      breakEnd: model.breakEnd,
    );
  }
}
