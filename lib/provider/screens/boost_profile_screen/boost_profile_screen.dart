import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/screens/boost_profile_screen/component/boostplan.dart';
import 'package:mobile/provider/screens/boost_profile_screen/component/runads.dart';

class BoostProfileScreen extends StatefulWidget {
  const BoostProfileScreen({super.key});

  @override
  State<BoostProfileScreen> createState() => _BoostProfileScreenState();
}

class _BoostProfileScreenState extends State<BoostProfileScreen> {
  int selectedTab = 0;

  final premiumBoostData = {
    "title": "Boost your profile",
    "subtitle": "More customers, more bookings",
    "info": "Boosted providers get up to 4x more bookings in the first week",
  };

  final adsPlanData = {
    "title": "Get more customers",
    "subtitle": "Select plan and get more customers",
    "info":
        "Customers post real job requests — visible only to premium providers.",
  };

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> currentData = selectedTab == 0
        ? premiumBoostData
        : adsPlanData;
    return Scaffold(
      backgroundColor: Color(0Xfff8f8f6),

      appBar: AppBar(
        backgroundColor: Color(0Xfff8f8f6),
        surfaceTintColor: Colors.transparent,

        title: Text('Plans & Pricing', style: TextStyle(fontSize: 19)),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            const SizedBox(height: 26),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.15),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? Color(0xFF534AB7)
                              : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Boost Profile",
                          style: TextStyle(
                            color: selectedTab == 0
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,

                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: selectedTab == 1
                              ? Color(0xff854f0b)
                              : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Run Ads",
                          style: TextStyle(
                            color: selectedTab == 1
                                ? AppColors.whiteColor
                                : AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // premium and run ads
            Column(
              children: [
                Container(
                  // heading and premium message
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.15),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: selectedTab == 0
                                ? Color(0xFFEEEDFE)
                                : Color(0xfffaeeda),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Icon(
                            selectedTab == 0
                                ? Icons.rocket_launch_outlined
                                : Icons.campaign_outlined,

                            color: selectedTab == 0
                                ? Color(0xFF534AB7)
                                : Color(0xff854f0b),
                          ),
                        ),
                        title: Text(
                          currentData["title"] as String,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          currentData["subtitle"] as String,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? Color(0xFFEEEDFE)
                              : Color(0xfffaeeda),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: ListTile(
                          leading: Icon(
                            selectedTab == 0
                                ? Icons.bar_chart_outlined
                                : Icons.remove_red_eye_outlined,
                            color: selectedTab == 0
                                ? Color(0xFF534AB7)
                                : Color(0xff854f0b),
                          ),
                          title: Text(
                            currentData["info"] as String,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: selectedTab == 0
                                  ? Color(0xFF534AB7)
                                  : Color(0xff854f0b),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 26),

                selectedTab == 0 ? BoostPlan() : RunAdsPlan(),

                const SizedBox(height: 26),

                Container(
                  alignment: Alignment.center,

                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedTab == 0
                        ? Color(0xFF534AB7)
                        : Color(0xff854f0b),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),

                const SizedBox(height: 26),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
