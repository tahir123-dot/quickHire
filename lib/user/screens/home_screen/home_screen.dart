import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/input_box/hero_section.dart';
import 'package:mobile/components/category/filter_category/category_section.dart';
import 'package:mobile/components/service_offer/service_preview.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/size_config/size_config.dart';
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
                SizedBox(height: SizeConfig.blockHeight * 3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockWidth * 4.0,
                  ),
                  child: Column(
                    children: [
                      // top bar
                      SizedBox(height: 16),
                      // search bar
                      TextFormField(
                        decoration: AppInputTheme.searchBar(
                          hint: 'Search services ',
                          icon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                // service category
                CategorySection(categories: categories),
                SizedBox(height: 16),
                // hero section bar ads
                HeroSection(),
                SizedBox(height: 16),

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
