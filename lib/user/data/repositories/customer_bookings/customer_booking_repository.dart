import 'package:mobile/user/data/model/customer_booking_model.dart';

abstract class CustomerBookingRepository {
  Future<List<CustomerBookingModel>> getCustomerBookings();
  Future<void> cancelBooking(String bookingId);
}
