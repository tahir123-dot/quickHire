import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';

import '../../../core/themes/colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Address'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: Column(
                children: [
                  SizedBox(height: 45.h),
                  TextFormField(
                    decoration: AppInputTheme.searchBar(
                      hint: 'Search Location',
                      icon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          "assets/icons/locationIcon.svg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        "assets/images/hero.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  AppButtonTheme.iconTextButton(
                    text: 'Choose Current Location',
                    icon: Icons.location_on_outlined,
                    backgroundColor: AppColors.purpleLight,
                    textColor: AppColors.blackColor,
                    sideColor: AppColors.purpleLight,
                    onPressed: () => print('Location Choose'),
                  ),
                  SizedBox(height: 15.h),
                  AppButtonTheme.iconTextButton(
                    text: 'Save Address',
                    backgroundColor: AppColors.blackColor,
                    textColor: AppColors.whiteColor,
                    icon: null,
                    onPressed: () => print('Address Saved'),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
