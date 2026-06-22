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
      backgroundColor: const Color(0xFFF8F8F6),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: TopBarWidget(),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            SizedBox(height: 20.h),

            // ─── Header ───
            _sectionHeader(title: 'Today\'s Overview', subtitle: _todayDate()),
            SizedBox(height: 14.h),

            // ─── Stat Cards ───
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.35,
              children: const [
                StatCard(
                  icon: Icons.calendar_today_outlined,
                  title: 'Bookings',
                  value: '6',
                  subtitle: '+12 from yesterday',
                ),
                StatCard(
                  icon: Icons.currency_rupee_outlined,
                  title: 'Earnings',
                  value: 'Rs 60,000',
                  subtitle: '+12 from yesterday',
                ),
                StatCard(
                  icon: Icons.remove_red_eye_outlined,
                  title: 'Profile Views',
                  value: '128',
                  subtitle: 'This week',
                ),
                StatCard(
                  icon: Icons.star_outline,
                  title: 'Rating',
                  value: '4.7',
                  subtitle: '48 reviews',
                  iconColor: Color(0xFFBA7517),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // ─── Chart Section ───
            _sectionHeader(
              title: 'Weekly Bookings',
              subtitle: 'This week\'s booking trend',
            ),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(14.r),
              child: BookingBarChart(data: weeklyBookings, highlightIndex: 2),
            ),

            SizedBox(height: 24.h),

            // ─── Upcoming Bookings ───
            _sectionHeader(
              title: 'Upcoming Bookings',
              subtitle: 'Your next appointments',
            ),
            SizedBox(height: 12.h),

            UpComingBooking(),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  // ─── Helpers ───

  String _todayDate() {
    final now = DateTime.now();
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${weekdays[now.weekday - 1]}, ${now.day} ${months[now.month - 1]} ${now.year}';
  }

  Widget _sectionHeader({required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    );
  }
}
