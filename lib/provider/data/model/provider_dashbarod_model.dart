class DashboardModel {
  final double todayEarnings;
  final int totalBookingsToday;
  final double? rating;
  final int totalReviews;
  final double acceptRate;
  final List<WeeklyBookingModel> weeklyBookings;
  final List<UpcomingBookingModel> upcomingBookings;

  DashboardModel({
    required this.todayEarnings,
    required this.totalBookingsToday,
    required this.rating,
    required this.totalReviews,
    required this.acceptRate,
    required this.weeklyBookings,
    required this.upcomingBookings,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      todayEarnings: (json['todayEarnings'] ?? 0).toDouble(),
      totalBookingsToday: json['totalBookingsToday'] ?? 0,
      rating: json['rating'] != null
          ? (json['rating'] as num).toDouble()
          : null,
      totalReviews: json['totalReviews'] ?? 0,
      acceptRate: (json['acceptRate'] ?? 0).toDouble(),
      weeklyBookings: (json['weeklyBookings'] as List? ?? [])
          .map((e) => WeeklyBookingModel.fromJson(e))
          .toList(),
      upcomingBookings: (json['upcomingBookings'] as List? ?? [])
          .map((e) => UpcomingBookingModel.fromJson(e))
          .toList(),
    );
  }
}

//
class WeeklyBookingModel {
  final String day;
  final int count;
  final bool isToday;

  WeeklyBookingModel({
    required this.day,
    required this.count,
    required this.isToday,
  });

  factory WeeklyBookingModel.fromJson(Map<String, dynamic> json) {
    return WeeklyBookingModel(
      day: json['day'] ?? '',
      count: json['count'] ?? 0,
      isToday: json['isToday'] ?? false,
    );
  }
}

class UpcomingBookingModel {
  final String id;
  final String customerName;
  final String customerInitials;
  final String detail;
  final String time;
  final String dateLabel;
  final String status;

  UpcomingBookingModel({
    required this.id,
    required this.customerName,
    required this.customerInitials,
    required this.detail,
    required this.time,
    required this.dateLabel,
    required this.status,
  });

  factory UpcomingBookingModel.fromJson(Map<String, dynamic> json) {
    return UpcomingBookingModel(
      id: json['id'] ?? '',
      customerName: json['customerName'] ?? '',
      customerInitials: json['customerInitials'] ?? '',
      detail: json['detail'] ?? '',
      time: json['time'] ?? '',
      dateLabel: json['dateLabel'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
