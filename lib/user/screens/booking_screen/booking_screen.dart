import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/booking/booking_card.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import '../../../core/themes/colors.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Fake Data (future me API replace karegi)
    final List<Map<String, dynamic>> bookings = [
      {
        "date": "Tuesday, 16 December",
        "time": "9:30-10:05 am",
        "duration": "35 mins",
        "rating": 4.3,
        "ratingCount": 876,
        "experienceYears": 10,
        "clientCount": 120,
      },
      {
        "date": "Wednesday, 17 December",
        "time": "11:00-11:30 am",
        "duration": "30 mins",
        "rating": 4.5,
        "ratingCount": 920,
        "experienceYears": 8,
        "clientCount": 150,
      },
      {
        "date": "Thursday, 18 December",
        "time": "2:00-2:45 pm",
        "duration": "45 mins",
        "rating": 4.1,
        "ratingCount": 650,
        "experienceYears": 6,
        "clientCount": 90,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarMinimal(pageName: 'Activity'),
      ),

      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: bookings.length + 1, // 🔥 +1 for header
          itemBuilder: (context, index) {
            /// 🔥 HEADER (index 0)
            if (index == 0) {
              return const _Header();
            }

            /// 🔥 BOOKING CARDS
            final booking = bookings[index - 1];

            return Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: BookingCard(
                date: booking["date"],
                time: booking["time"],
                duration: booking["duration"],
                rating: booking["rating"],
                ratingCount: booking["ratingCount"],
                experienceYears: booking["experienceYears"],
                clientCount: booking["clientCount"],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 🔥 HEADER SEPARATE (no rebuild issue)
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 27.h),

        /// Title + badge
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                'Bookings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),

              Positioned(
                right: -23.w,
                top: -8.h,
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: const BoxDecoration(
                    color: AppColors.transparentBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "12",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        /// underline
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 3.h,
            width: 140.w,
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),

        SizedBox(height: 50.h),
      ],
    );
  }
}
