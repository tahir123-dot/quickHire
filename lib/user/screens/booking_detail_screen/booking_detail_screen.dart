import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../core/themes/app_button_theme.dart';
import '../../../core/themes/colors.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({super.key});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: TopBarIconWithCenterText(pageName: 'Booking Details'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            Column(
              children: [
                SizedBox(height: 47.h),

                // provider info
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "Tahir Rashid",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.verified,
                        color: AppColors.darkBlueColor,
                        size: 15.sp,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Islamabad F6",
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),

                SizedBox(height: 23.h),

                // date and time
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 20.sp),
                    SizedBox(width: 4.w),
                    Text(
                      'Tuesday, 16 December',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined, size: 20.sp),
                    SizedBox(width: 4.w),
                    Text(
                      "9:30-10:05 am (35 mins duration)",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),

                SizedBox(height: 85.h),
                // service take info
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.horizontalLine),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add on Dazzle Dry Polish',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text('pkr 300', style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Text(
                            '5 mint with Elize',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.lightgreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 6.h),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 14.h,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.horizontalLine),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add on Dazzle Dry Polish',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text('pkr 300', style: TextStyle(fontSize: 14.sp)),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Text(
                            '5 mint with Elize',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.lightgreyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
            children: [
              Divider(thickness: 1, height: 1, color: AppColors.horizontalLine),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 18.sp)),
                  Text("from 23.9", style: TextStyle(fontSize: 18.sp)),
                ],
              ),

              SizedBox(height: 16.h),

              AppButtonTheme.iconTextButton(
                text: 'Confirm',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(UserRoutesConstants.payment);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
