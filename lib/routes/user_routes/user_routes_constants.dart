class UserRoutesConstants {
  static const customer = "/customer";

  // relative segments — sirf GoRoute(path: ...) ke liye
  static const home = "home";
  static const booking = "booking";
  static const postjob = "postjob";
  static const profile = "profile";

  // full paths — sirf navigation calls ke liye
  static String get homePath => '$customer/$home';
  static String get bookingPath => '$customer/$booking';
  static String get postjobPath => '$customer/$postjob';
  static String get profilePath => '$customer/$profile';

  static const bookingDetail = "/customer/booking/booking-detail";
  static const phone = "/customer/profile/phone";
  static const payment = "/customer/profile/payment";
  static const serviceProvider = "/customer/home/service-provider";

  // booking flow
  static const String providerProfile = "/customer/providerProfile";
  static const String teamSelect = "/customer/teamSelect";
  static const String calender = "/customer/calendar";
  static const String bookingPreview = "/customer/bookingPreview";
}
