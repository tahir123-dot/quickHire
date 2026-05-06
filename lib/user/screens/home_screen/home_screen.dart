import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/category/filter_category/category_section.dart';
import 'package:mobile/components/service_offer/service_preview.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_input_theme.dart';

import '../../../core/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["Barber", "Electrician", "Plumber", "Doctor"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarWidget(),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                //SizedBox(height: 13.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      // top bar
                      SizedBox(height: 13.h),
                      // search bar
                      TextFormField(
                        decoration: AppInputTheme.searchBar(
                          hint: 'Search services ',
                          icon: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                    ],
                  ),
                ),
                // service category
                CategorySection(categories: categories),
                SizedBox(height: 28.h),
                // hero section bar ads
                // HeroSection(), we use this component in future for ads and promotions

                // service Provider cards
                ServicePreview(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
