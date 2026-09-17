class NotificationModel {
  final String id;
  final String type;
  final String title;
  final String message;
  final bool isRead;
  final String timeAgo;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.isRead,
    required this.timeAgo,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
      timeAgo: json['timeAgo'] as String,
    );
  }
}
