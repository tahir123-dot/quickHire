import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/themes/colors.dart';

class BookingCard extends StatelessWidget {
  final String date;
  final String time;
  final String duration;
  final double rating;
  final int ratingCount;
  final int experienceYears;
  final int clientCount;

  BookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.duration,
    required this.rating,
    required this.ratingCount,
    required this.experienceYears,
    required this.clientCount,
  });

  final services = [
    'Haircut',
    'Shave',
    'Massage',
    'Facial',
    'Facial',
    'Facial',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.searchBarBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ User info + Cancel button
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  title: Row(
                    children: [
                      Text("Tahir Rashid", style: TextStyle(fontSize: 17.sp)),
                      SizedBox(width: 5),
                      Icon(
                        Icons.verified,
                        color: AppColors.darkBlueColor,
                        size: 15,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Islamabad F6",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.lightgreyColor,
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackColor,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      fixedSize: Size(106.w, 47.h),
                    ),
                    onPressed: () {
                      print('booking cancel');
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // ✅ Date and Time info
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 16.sp),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.lightgreyColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined, size: 16.sp),
                    const SizedBox(width: 4),
                    Text(
                      "$time ($duration)",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.lightgreyColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  "Pkr 300",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 15.h),
                const Divider(height: 1, color: AppColors.horizontalLine),
                SizedBox(height: 3.h),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating / Experience / Clients
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.darkBlueColor,
                        ),
                        const SizedBox(width: 4),
                        Text("$rating ($ratingCount)"),
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: AppColors.horizontalLine,
                    ),
                    Text("$experienceYears Years Experience"),
                    Container(
                      height: 20,
                      width: 1,
                      color: AppColors.horizontalLine,
                    ),
                    Text("$clientCount+ Clients"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
