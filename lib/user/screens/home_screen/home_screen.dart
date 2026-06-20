import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/category/filter_category/category_section.dart';
import 'package:mobile/components/input_box/hero_section.dart';
import 'package:mobile/components/service_offer/service_preview.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/user/bloc/blocimpl/category_bloc.dart';
import 'package:mobile/user/bloc/state/category_state.dart';

import '../../../core/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 12.w,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              width: 18.w,
                              height: 10.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                    ],
                  ),
                ),
                // hero section bar ads
                HeroSection(), //we use this component in future for ads and promotions
                SizedBox(height: 28.h),

                // service category
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is CategoryLoaded) {
                      return CategorySection(
                        categories: state.categories,
                      ); // 👈 pass karo
                    }

                    return SizedBox();
                  },
                ),

                SizedBox(height: 28.h),

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
