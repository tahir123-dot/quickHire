import 'package:flutter/material.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';

import '../../../components/booking/provider_booking_card.dart';
import '../../../components/stat_box/stat_box.dart';
import '../../../core/size_config/size_config.dart';
import '../../../core/themes/colors.dart';

class ProviderBookingScreen extends StatefulWidget {
  const ProviderBookingScreen({super.key});

  @override
  State<ProviderBookingScreen> createState() => _ProviderBookingScreenState();
}

class _ProviderBookingScreenState extends State<ProviderBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: SizeConfig.blockHeight * 3),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 4.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBarMinimal(pageName: 'My Activity'),
                  SizedBox(height: 16),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.horizontalLine,
                  ),
                  SizedBox(height: 10),

                  // stats
                  Row(
                    children: [
                      Expanded(
                        child: StatBox(
                          value: 'Work In progress',
                          label: '0.00',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: StatBox(value: 'In review', label: '0.0'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: StatBox(value: 'In review', label: '0.0'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.horizontalLine,
                  ),
                  SizedBox(height: 25),
                  Column(
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
                ],
              ),
            ),
            SizedBox(height: 25),
            ProviderBookingCard(
              date: 'date',
              time: 'time ',
              duration: '30 min',
            ),
            SizedBox(height: 25),
            ProviderBookingCard(
              date: 'date',
              time: 'time ',
              duration: '30 min',
            ),
          ],
        ),
      ),
    );
  }
}
