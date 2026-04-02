import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/customer_reviews/customer_reviews.dart';
import '../../../components/category/filter_category/category_section.dart';
import '../../../components/service_card/service_card.dart';
import '../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../core/size_config/size_config.dart';
import '../../../core/themes/app_button_theme.dart';
import '../../../core/themes/colors.dart';
import '../../../routes/provider_routes/provider_routes_constants.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  List<String> serviceCategories = [
    "Barber",
    "Electrician",
    "Plumber",
    "Doctor",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarThreeThings(
          pageName: 'My Profile',
          imagePath: "assets/icons/VerticalDot.svg",
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          children: [
            SizedBox(height: 25),
            ProviderTopBarWidget(
              providerName: 'Tahir R.H',
              location: "Islamabad, Pakistan",
            ),
            SizedBox(height: 10),
            // Description

            // About and rating in one line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.yellowRating, size: 14),
                    Text(' 4.3 (355)', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),

            //Description Static
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            SizedBox(height: 20),

            // three images of service provider work
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

            SizedBox(height: 10),

            // service text heading
            Text(
              'Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            // service category new for all service provider
            CategorySection(categories: serviceCategories),
            SizedBox(height: 20),

            // service list
            ServiceCardToggle(
              serviceName: 'Main cut',
              price: '300.0',
              time: '30 min to 1 hr 15 min',
            ),
            ServiceCardToggle(
              serviceName: 'Main cut',
              price: '300.0',
              time: '30 min to 1 hr 15 min',
            ),
            ServiceCardToggle(
              serviceName: 'Main cut',
              price: '300.0',
              time: '30 min to 1 hr 15 min',
            ),

            SizedBox(height: 22),
            // Add button and move on team list screen
            AppButtonTheme.iconTextButton(
              text: 'Add',
              icon: null,
              backgroundColor: AppColors.blackColor,
              width: double.infinity,
              elevation: 1,
              textColor: AppColors.whiteColor,
              onPressed: () {
                context.push(ProviderRoutesConstants.providerTeamList);
              },
            ),

            SizedBox(height: 15),
            //Customer Reviews
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Customer Reviews',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: Text(
                    'View all',
                    style: TextStyle(color: AppColors.blackColor),
                  ),
                  onPressed: () {
                    context.push(
                      ProviderRoutesConstants.providerCustomerReview,
                    );
                  },
                ),
              ],
            ),
            CustomerReviews(),

            SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

/*
 ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerEditProfile);
          }, child: Text('Edit Profile Screen')),
          ElevatedButton(onPressed: (){
            context.push();
          }, child: Text('customer Review Screen')),
          ElevatedButton(onPressed: (){
            context.push(SharedRoutesConstant.settingScreen);
          }, child: Text('Setting screen')),
* */
