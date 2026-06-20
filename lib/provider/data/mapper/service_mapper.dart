import '../entity/service_entity.dart';
import '../model/service_model.dart';

class ServiceMapper {
  static ServiceEntity toEntity(ServiceModel model) {
    return ServiceEntity(
      id: model.id,
      serviceName: model.serviceName,
      serviceDuration: model.serviceDuration,
      servicePrice: model.servicePrice,
      createdAt: model.createdAt,
    );
  }

  static List<ServiceEntity> toEntityList(List<ServiceModel> models) {
    return models.map((m) => toEntity(m)).toList();
  }
}
