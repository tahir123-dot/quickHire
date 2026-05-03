import 'package:flutter/material.dart';
import 'package:mobile/components/booking/booking_card.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/size_config/size_config.dart';

import '../../../core/themes/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarMinimal(pageName: 'Activity'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),

                // booking and number
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            'Bookings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Positioned(
                            right: -23,
                            top: -8,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.transparentBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "12",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ✅ Badge Text
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 3,
                  width: SizeConfig.blockWidth * 35,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              BookingCard(
                date: "Tuesday, 16 December",
                time: "9:30-10:05 am",
                duration: "35 mins",
                rating: 4.3,
                ratingCount: 876,
                experienceYears: 10,
                clientCount: 120,
              ),
              SizedBox(height: 20),
              BookingCard(
                date: "Tuesday, 16 December",
                time: "9:30-10:05 am",
                duration: "35 mins",
                rating: 4.3,
                ratingCount: 876,
                experienceYears: 10,
                clientCount: 120,
              ),
              SizedBox(height: 20),
              BookingCard(
                date: "Tuesday, 16 December",
                time: "9:30-10:05 am",
                duration: "35 mins",
                rating: 4.3,
                ratingCount: 876,
                experienceYears: 10,
                clientCount: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
