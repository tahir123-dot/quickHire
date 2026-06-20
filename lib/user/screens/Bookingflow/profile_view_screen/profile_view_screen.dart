import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/customer_reviews/customer_reviews.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import '../../../../components/category/filter_category/category_section.dart';
import '../../../../components/service_card/service_card.dart';
import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/colors.dart';
import '../../../../routes/provider_routes/provider_routes_constants.dart';

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
      body: CustomScrollView(
        slivers: [
          /// APP BAR
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: false,
            floating: false,
            snap: false,
            automaticallyImplyLeading: false,
            expandedHeight: 286.h,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/hero.png",
                fit: BoxFit.cover,
              ),
            ),

            title: TopBarThreeThings(
              pageName: '',
              imagePath: "assets/icons/VerticalDot.svg",
              isMenu: true,
            ),
          ),

          /// CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 31.h),

                  ProviderTopBarWidget(
                    providerName: 'Tahir Rashid',
                    location: "Islamabad, Pakistan",
                  ),

                  SizedBox(height: 10),

                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(fontSize: 14.sp),
                  ),

                  SizedBox(height: 22.h),

                  Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 22.h),

                  //CategorySection(categories: serviceCategories),
                  SizedBox(height: 28.h),

                  ServiceCardToggle(
                    serviceName: 'Main cut',
                    price: '300',
                    time: '30 min',
                  ),

                  ServiceCardToggle(
                    serviceName: 'Main cut',
                    price: '300',
                    time: '30 min',
                  ),

                  ServiceCardToggle(
                    serviceName: 'Main cut',
                    price: '300',
                    time: '30 min',
                  ),
                  ServiceCardToggle(
                    serviceName: 'Main cut',
                    price: '300',
                    time: '30 min',
                  ),
                  ServiceCardToggle(
                    serviceName: 'Main cut',
                    price: '300',
                    time: '30 min',
                  ),
                  ServiceCardToggle(
                    serviceName: 'Main cut',
                    price: '300',
                    time: '30 min',
                  ),
                  SizedBox(height: 28.h),

                  /// Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Customer Reviews',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(ProviderRoutesConstants.customerReview);
                        },
                        child: Text(
                          "View all",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),

                  CustomerReviews(),
                  CustomerReviews(),
                  CustomerReviews(),

                  AppButtonTheme.iconTextButton(
                    text: 'Add',
                    icon: null,
                    backgroundColor: AppColors.blackColor,
                    textColor: AppColors.whiteColor,
                    onPressed: () {
                      context.push(UserRoutesConstants.teamSelect);
                    },
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
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
