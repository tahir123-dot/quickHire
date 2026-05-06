import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';

import '../../../../core/themes/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,

        title: TopBarIconWithCenterText(pageName: 'Notification'),
      ),
      body: SafeArea(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 60.h),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.searchBarBackground,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 5.h,
                ),
                leading: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                title: Text('Tahir Rashid', style: TextStyle(fontSize: 14.sp)),
                subtitle: Text(
                  "Notification message",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.lightgreyColor,
                  ),
                ),
                trailing: Text(
                  "Just Now",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.lightgreyColor,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 3.h);
          },
        ),
      ),
    );
  }
}
