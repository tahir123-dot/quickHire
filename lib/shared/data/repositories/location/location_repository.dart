import 'package:mobile/shared/data/dto/location_dto.dart';
import 'package:mobile/shared/data/entity/location_entity.dart';

abstract class LocationRepository {
  // add location
  Future<LocationEntity> addLocation(LocationDto dto);

  // update location
  Future<LocationEntity> updateLocation(UpdateLocationDto dto);

  // get location (token se current user pata chal jata hai)
  Future<LocationEntity> getLocation();
}
