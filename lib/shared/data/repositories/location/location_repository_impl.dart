import 'package:mobile/shared/data/datasources/location_remote_datasource.dart';
import 'package:mobile/shared/data/dto/location_dto.dart';
import 'package:mobile/shared/data/entity/location_entity.dart';
import 'package:mobile/shared/data/mapper/location.dart';
import 'package:mobile/shared/data/model/location_model.dart';
import 'package:mobile/shared/data/repositories/location/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSources remote;
  LocationRepositoryImpl(this.remote);

  // add location
  @override
  Future<LocationEntity> addLocation(LocationDto dto) async {
    final LocationResponseModel model = await remote.addLocation(dto);
    return LocationMapper.toEntity(model);
  }

  // update location
  @override
  Future<LocationEntity> updateLocation(UpdateLocationDto dto) async {
    final LocationResponseModel model = await remote.updateLocation(dto);
    return LocationMapper.toEntity(model);
  }

  // get location
  @override
  Future<LocationEntity> getLocation() async {
    final LocationResponseModel model = await remote.getLocation();
    return LocationMapper.toEntity(model);
  }
}
