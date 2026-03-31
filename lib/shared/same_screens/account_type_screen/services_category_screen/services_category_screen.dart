import 'package:flutter/material.dart';
import 'package:mobile/components/category/service_category.dart';
import '../../../../core/size_config/size_config.dart';
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
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.blockHeight * 9),
              SizedBox(
                width: SizeConfig.blockWidth * 90,
                child: Text(
                  'Offer your Services',
                  style: AppTextTheme.h1.copyWith(fontSize: 30, height: 1.4),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 15,
                runSpacing: 12,
                children: [
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerEditProfile,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerEditProfile,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerEditProfile,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerEditProfile,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerEditProfile,
                  ),
                  ServiceCategory(
                    title: 'Barber',
                    icon: Icons.content_cut,
                    route: ProviderRoutesConstants.providerEditProfile,
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
