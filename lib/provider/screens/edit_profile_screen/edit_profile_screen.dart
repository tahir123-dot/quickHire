import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/category/filter_category/category_section.dart';
import 'package:mobile/components/service_card/service_card.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> serviceCategories = [
    "Barber",
    "Electrician",
    "Plumber",
    "Doctor",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarThreeThings(
          pageName: 'My Profile',
          imagePath: "assets/icons/payment.svg",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          child: Column(
            children: [
              SizedBox(height: 25),
              ProviderTopBarWidget(
                providerName: 'Tahir R.H',
                location: "Islamabad, Pakistan",
                icon: Icons.edit,
              ),
              SizedBox(height: 10),

              // Description
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: Text(
                      'View Profile',
                      style: TextStyle(color: AppColors.purpleDark),
                    ),
                    onPressed: () {
                      context.push(ProviderRoutesConstants.providerProfileView);
                    },
                  ),
                ],
              ),
              TextField(
                maxLines: 5, // jitni lines ka input chahiye
                minLines: 3, // optional
                decoration: InputDecoration(
                  hintText: "Enter your description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: AppColors.searchBarBackground,
                ),
              ),

              // three picture
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: [
                    Container(
                      width: SizeConfig.blockWidth * 35,
                      height: SizeConfig.blockHeight * 15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.transparentBackground,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/hero.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockWidth * 35,
                      height: SizeConfig.blockHeight * 15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.transparentBackground,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/hero.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockWidth * 35,
                      height: SizeConfig.blockHeight * 15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.transparentBackground,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/hero.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Services',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 15),
              // service category new for all service provider
              CategorySection(categories: serviceCategories),
              SizedBox(height: 20),

              // service list
              ServiceCard(
                serviceName: 'Main cut',
                price: '300.0',
                time: '30 min to 1 hr 15 min',
              ),
              ServiceCard(
                serviceName: 'Main cut',
                price: '300.0',
                time: '30 min to 1 hr 15 min',
              ),
              ServiceCard(
                serviceName: 'Main cut',
                price: '300.0',
                time: '30 min to 1 hr 15 min',
              ),

              // My service add place
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Services',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(ProviderRoutesConstants.addServiceScreen);
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 20), // add team and View team button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Text(
                      'View Team',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      context.push(ProviderRoutesConstants.providerTeamList);
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(ProviderRoutesConstants.providerAddTeam);
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 22),
              // Location and Availability button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtonTheme.iconTextButton(
                    text: 'Add Location',
                    icon: null,
                    backgroundColor: AppColors.blackColor,
                    width: SizeConfig.blockWidth * 45,
                    opacity: 1.0,
                    elevation: 0,
                    textColor: AppColors.whiteColor,
                    onPressed: () {
                      context.push(SharedRoutesConstant.addressScreen);
                    },
                  ),
                  AppButtonTheme.iconTextButton(
                    text: 'Add Availability',
                    icon: null,
                    width: SizeConfig.blockWidth * 45,
                    backgroundColor: AppColors.purpleLight,
                    sideColor: AppColors.purpleLight,
                    opacity: 1.0,
                    elevation: 0,
                    textColor: AppColors.blackColor,
                    onPressed: () {
                      context.push(
                        ProviderRoutesConstants.providerAddAvailability,
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
