import 'package:mobile/shared/data/entity/location_entity.dart';
import 'package:mobile/shared/data/model/location_model.dart';

class LocationMapper {
  static LocationEntity toEntity(LocationResponseModel model) {
    return LocationEntity(
      ownerId: model.ownerId,
      ownerType: model.ownerType,
      countryCode: model.countryCode,
      addressLine: model.addressLine,
      city: model.city,
      state: model.state,
      latitude: model.latitude,
      longitude: model.longitude,
      h3Index: model.h3Index,
    );
  }
}
