import 'package:mobile/user/data/datasources/user_data_sources.dart';
import 'package:mobile/user/data/model/customer_booking_model.dart';
import 'package:mobile/user/data/repositories/customer_bookings/customer_booking_repository.dart';

class CustomerBookingRepositoryImpl implements CustomerBookingRepository {
  final UserDataSources dataSource;
  CustomerBookingRepositoryImpl(this.dataSource);

  @override
  Future<List<CustomerBookingModel>> getCustomerBookings() {
    return dataSource.getCustomerBookings();
  }

  @override
  Future<void> cancelBooking(String bookingId) {
    return dataSource.cancelBooking(bookingId);
  }
}
