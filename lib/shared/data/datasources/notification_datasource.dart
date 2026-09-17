import 'package:dio/dio.dart';
import 'package:mobile/shared/data/api/api.dart';
import 'package:mobile/shared/data/model/notification_model.dart';

abstract class NotificationDataSources {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationDataSourcesImpl implements NotificationDataSources {
  final Dio dio;
  NotificationDataSourcesImpl(this.dio);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await dio.get(NotficationApiEndPoints.fetchlLocation);
    final List<dynamic> data = response.data['data'];
    return data.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
