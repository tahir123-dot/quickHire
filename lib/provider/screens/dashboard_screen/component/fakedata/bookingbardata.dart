// booking_bar_data.dart
class BookingBarData {
  final String day;
  final double bookings;

  const BookingBarData({required this.day, required this.bookings});
}

// Fake data
final List<BookingBarData> weeklyBookings = [
  BookingBarData(day: 'Mon', bookings: 4),
  BookingBarData(day: 'Tue', bookings: 6),
  BookingBarData(day: 'Wed', bookings: 3),
  BookingBarData(day: 'Thu', bookings: 5),
  BookingBarData(day: 'Fri', bookings: 10), // highlighted — today
  BookingBarData(day: 'Sat', bookings: 2),
  BookingBarData(day: 'Sun', bookings: 5),
];
