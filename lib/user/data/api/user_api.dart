class UserApiEndPoints {
  // main category barber, electrican, plumber
  static const getCategory = "/get-categories";
  static const createUser = "/create-user";
  static const getProvidersByCategory = "/providers/lists";
  static const getProviderProfileById = "/providers";
  static const getProviderTeamMembers = "/providers/team";
  static const getTeamMemberAvailability = "/providers/team/availability";
  static const submitBookingRequest = "/customer/add/bookings";
  static const customerBookings = "/customer/bookings/all";
  static const bookingCancel = "/bookings";
}
