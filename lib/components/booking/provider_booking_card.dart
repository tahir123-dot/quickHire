import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/themes/colors.dart';

class ProviderBookingCard extends StatelessWidget {
  final String date;
  final String time;
  final String duration;

  const ProviderBookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("no routes ");
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //User info + Cancel button
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    title: Row(
                      children: [
                        Text("Tahir Rashid", style: TextStyle(fontSize: 17.sp)),
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
                        print("Cancel Booking");
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
                  SizedBox(height: 6),

                  // Date and Time info

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

                  const SizedBox(height: 6),
                  const Divider(height: 1, color: AppColors.horizontalLine),
                  const SizedBox(height: 8),

                  Text(
                    "Pkr 300",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
