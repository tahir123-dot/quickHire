import 'package:mobile/shared/data/datasources/notification_datasource.dart';
import 'package:mobile/shared/data/model/notification_model.dart';
import 'package:mobile/shared/data/repositories/notification/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSources remote;
  NotificationRepositoryImpl(this.remote);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    return await remote.getNotifications();
  }
}
