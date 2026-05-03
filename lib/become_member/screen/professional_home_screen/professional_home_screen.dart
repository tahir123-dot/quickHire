import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';
import '../../../components/booking/provider_booking_card.dart';
import '../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../core/size_config/size_config.dart';

class ProfessionalHomeScreen extends StatefulWidget {
  const ProfessionalHomeScreen({super.key});

  @override
  State<ProfessionalHomeScreen> createState() => _ProfessionalHomeScreenState();
}

class _ProfessionalHomeScreenState extends State<ProfessionalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.searchBarBackground,
        title: Text('Become a member'),
      ),
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
                      const Text(
                        'Today Booking',
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
