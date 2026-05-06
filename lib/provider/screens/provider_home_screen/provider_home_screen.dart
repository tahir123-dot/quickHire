import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/components/booking/provider_booking_card.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/colors.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: TopBarWidget(),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 9.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: const Text(
                'Upcoming Booking',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),

            Column(
              children: [
                SizedBox(height: 25.h),

                ProviderBookingCard(
                  date: 'date',
                  time: 'time ',
                  duration: '30 min',
                ),

                SizedBox(height: 25.h),

                ProviderBookingCard(
                  date: 'date',
                  time: 'time ',
                  duration: '30 min',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
