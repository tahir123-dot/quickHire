class ProviderRoutesConstants {
  static const String provider = "/provider";

  // relative segments — sirf GoRoute(path: ...) definitions ke liye
  static const String dashboard = "dashboard";
  static const String booking = "booking";
  static const String boost = "boost";
  static const String editProfile = "editProfile";
  static const String serviceCategoryScreen = "serviceCategoryScreen";
  static const String businessDetails = "editProfile/businessDetails";
  static const String banner = "editProfile/banner";
  static const String payment = "editProfile/payment";
  static const String customerReview = "editProfile/customerReview";
  static const String addTeam = "editProfile/addTeam";
  static const String teamList = "teamList";
  static const String addServiceScreen = "editProfile/addServiceScreen";
  static const String viewServiceScreen = "viewServiceScreen";
  static const String addAvailability = "editProfile/addAvailability";

  // full paths — sirf navigation calls (push/go) ke liye
  static String get editProfilePath => '$provider/$editProfile';
  static String get businessDetailsPath => '$provider/$businessDetails';
  static String get bannerPath => '$provider/$banner';
  static String get paymentPath => '$provider/$payment';
  static String get customerReviewPath => '$provider/$customerReview';
  static String get addTeamPath => '$provider/$addTeam';
  static String get teamListPath => '$provider/$addTeam/$teamList';
  static String get addServiceScreenPath => '$provider/$addServiceScreen';
  static String get viewServiceScreenPath =>
      '$provider/$addServiceScreen/$viewServiceScreen';
  static String get addAvailabilityPath => '$provider/$addAvailability';
  static String get serviceCategoryScreenPath =>
      '$provider/$serviceCategoryScreen';

  // standalone top-level routes (already full path — /provider ke bahar hain route file mein)
  static const String providerAddCampaign = "/providerAddCampaign";
  static const String providerAdsPlan = "/providerAdsPlan";
  static const String providerProfile = "/providerProfile";
  static const String providerCategory = "/providerCategory";
}
