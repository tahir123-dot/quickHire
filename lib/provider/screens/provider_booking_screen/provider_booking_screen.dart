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
            backgroundColor: AppColors.whiteColor,
            surfaceTintColor: AppColors.transparentBackground,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Bookings', style: TextStyle(fontSize: 19)),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEDFE),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Today 6',
                    style: TextStyle(fontSize: 13, color: Color(0xFF534AB7)),
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(52),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 6,
                    children: filter.map((item) {
                      final isSelected = selectedFilter == item;
                      return GestureDetector(
                        onTap: () => setState(() => selectedFilter = item),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF534AB7)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFF534AB7)),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF534AB7),
                              fontSize: 14.sp,
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
          padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 16),
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, index) => BookingCardR(
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
            status: 'Confirmed',
          ),
        ),
      ),
    );
  }
}
