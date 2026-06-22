import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/screens/provider_booking_screen/component/bookingcard.dart';

class ProviderBookingScreen extends StatefulWidget {
  const ProviderBookingScreen({super.key});

  @override
  State<ProviderBookingScreen> createState() => _ProviderBookingScreenState();
}

class _ProviderBookingScreenState extends State<ProviderBookingScreen> {
  String selectedFilter = 'All';
  final List<String> filter = ['All', 'Confirmed', 'Pending', 'Done'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F6),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: AppColors.whiteColor,
            surfaceTintColor: AppColors.transparentBackground,
            elevation: 0,
            titleSpacing: 16.w,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bookings',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEDFE),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 13,
                        color: Color(0xFF534AB7),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Today  6',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF534AB7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: filter.map((item) {
                      final isSelected = selectedFilter == item;
                      return GestureDetector(
                        onTap: () => setState(() => selectedFilter = item),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF534AB7)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF534AB7)
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
        body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (_, index) => const BookingCardR(
            url: '',
            name: 'Salman Ahmed',
            location: 'Gulberg, Lahore',
            dateAndday: 'Fri, 30 May 2025 Friday',
            time: '10:00 AM',
            duration: '45 min',
            price: 800,
            totalServices: 2,
            services: ['Haircut', 'Shave'],
            teamUrl: '',
            teamName: 'Raza Bhai',
            status: 'done',
          ),
        ),
      ),
    );
  }
}
