import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/category/service_category.dart';
import '../../../../core/themes/app_text_theme.dart';
import '../../../../routes/provider_routes/provider_routes_constants.dart';

class ServicesCategoryScreen extends StatelessWidget {
  const ServicesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 93.h),

              Text(
                'Choose a category that represents your business',
                style: AppTextTheme.h1,
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 35.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 12.h,
                children: [
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerMainScreen,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerMainScreen,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerMainScreen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
