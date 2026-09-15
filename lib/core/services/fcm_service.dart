import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile/core/services/local_notification_service.dart';

class FcmService {
  final Dio _dio;
  final LocalNotificationService _localNotificationService;

  FcmService(this._dio, LocalNotificationService localNotificationService)
    : _localNotificationService = localNotificationService;

  Future<void> initAndSyncToken() async {
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission();

    final permissionGranted =
        settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;

    if (!permissionGranted) return;

    final token = await messaging.getToken();
    if (token != null) {
      await _sendTokenToBackend(token);
    }

    messaging.onTokenRefresh.listen((newToken) {
      _sendTokenToBackend(newToken);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        _localNotificationService.show(
          notification.title ?? '',
          notification.body ?? '',
        );
      }
    });
  }

  Future<void> _sendTokenToBackend(String token) async {
    try {
      await _dio.post('/update-fcm-token', data: {'fcmToken': token});
    } catch (e) {
      print('Failed to sync FCM token: $e');
    }
  }
}
