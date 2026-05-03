import 'package:flutter/material.dart';
import 'package:mobile/components/booking/provider_booking_card.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/colors.dart';

import '../../../components/stat_box/stat_box.dart';
import '../../../core/size_config/size_config.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider Profile')),
      body: SafeArea(
        child: ListView(

          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: SizeConfig.blockHeight * 3),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 4.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopBarWidget(),
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
                          Expanded(child: StatBox(value: '400k', label: 'Total Earning')),
                          SizedBox(width: 10),
                          Expanded(child: StatBox(value: '120', label: 'Orders')),
                          SizedBox(width: 10),
                          Expanded(child: StatBox(value: '4.5', label: 'Rating')),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.horizontalLine,
                      ),
                      SizedBox(height: 25),
                      const Text(
                        'Upcoming Booking',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
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
          ],
        ),
      ),
    );
  }
}
