import 'package:mobile/shared/data/model/notification_model.dart';

abstract class NotificationRepository {
  Future<List<NotificationModel>> getNotifications();
}
