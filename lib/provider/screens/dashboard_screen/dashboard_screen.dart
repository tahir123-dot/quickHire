import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/screens/dashboard_screen/component/bookingbarchart.dart';
import 'package:mobile/provider/screens/dashboard_screen/component/fakedata/bookingbardata.dart';
import 'package:mobile/provider/screens/dashboard_screen/component/statcard.dart';
import 'package:mobile/provider/screens/dashboard_screen/component/upcoming.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xfff8f8f6),

      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,

        surfaceTintColor: Colors.transparent,

        title: TopBarWidget(),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            const SizedBox(height: 28),
            Text(
              'Today Overview',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 5,
              mainAxisSpacing: 13,
              shrinkWrap: true, // scroll issue nahi hoga
              physics:
                  const NeverScrollableScrollPhysics(), // parent scroll karega
              childAspectRatio: 1.30, // width/height
              children: const [
                StatCard(
                  icon: Icons.calendar_today_outlined,
                  title: 'Today bookings',
                  value: '6',
                  subtitle: '+12 from yesterday',
                ),
                StatCard(
                  icon: Icons.currency_rupee_outlined,
                  title: 'Today Earnings',
                  value: 'Rs 60,000',
                  subtitle: '+12 from yesterday',
                ),
                StatCard(
                  icon: Icons.remove_red_eye_outlined,
                  title: 'Profile views',
                  value: '128',
                  subtitle: 'This week',
                ),
                StatCard(
                  icon: Icons.star_outline,
                  title: 'Rating',
                  value: '4.7',
                  subtitle: '48 reviews',
                  iconColor: Color(0xFFBA7517), // amber for rating
                ),
              ],
            ),

            const SizedBox(height: 27),

            BookingBarChart(
              data: weeklyBookings,
              highlightIndex: 2, // Friday highlight — today ka index pass karo
            ),

            const SizedBox(height: 27),

            UpComingBooking(),
            SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
