import 'package:dio/dio.dart';
import 'package:mobile/shared/data/api/api.dart';
import 'package:mobile/shared/data/dto/location_dto.dart';
import 'package:mobile/shared/data/model/location_model.dart';

abstract class LocationDataSources {
  Future<LocationResponseModel> addLocation(LocationDto dto);
  Future<LocationResponseModel> updateLocation(UpdateLocationDto dto);
  Future<LocationResponseModel> getLocation();
}

class LocationDataSourcesImpl implements LocationDataSources {
  final Dio dio;

  LocationDataSourcesImpl(this.dio);

  @override
  Future<LocationResponseModel> addLocation(LocationDto dto) async {
    final response = await dio.post(
      LocationApiEndPoints.addLocation,
      data: dto.toJson(),
    );
    return LocationResponseModel.fromJson(response.data['data']);
  }

  @override
  Future<LocationResponseModel> updateLocation(UpdateLocationDto dto) async {
    final response = await dio.put(
      LocationApiEndPoints.updateLocation,
      data: dto.toJson(),
    );
    return LocationResponseModel.fromJson(response.data['data']);
  }

  @override
  Future<LocationResponseModel> getLocation() async {
    final response = await dio.get(LocationApiEndPoints.getLocation);
    return LocationResponseModel.fromJson(response.data['data']);
  }
}
