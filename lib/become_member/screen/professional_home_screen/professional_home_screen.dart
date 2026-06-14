import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';
import '../../../components/top_bar_widget/top_bar_widget.dart';

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
            SizedBox(height: 120.h), //SizeConfig.blockHeight * 3),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w, //SizeConfig.blockWidth * 4.0,
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

                SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
