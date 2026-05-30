import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'fake_data.dart';

class ServicePreview extends StatefulWidget {
  const ServicePreview({super.key});

  @override
  State<ServicePreview> createState() => _ServicePreviewState();
}

class _ServicePreviewState extends State<ServicePreview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FakeData.mockData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final provider = FakeData.mockData[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.push(UserRoutesConstants.providerProfile);
              },
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25.r,
                      backgroundImage: AssetImage(provider.profileImage),
                    ),
                    title: Row(
                      children: [
                        Text(
                          provider.providerName,
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.verified,
                          color: AppColors.darkBlueColor,
                          size: 15,
                        ),
                      ],
                    ),

                    subtitle: Text(
                      provider.location,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.lightgreyColor,
                      ),
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.listBackground,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        fixedSize: Size(106.w, 47.h),
                      ),
                      onPressed: () {
                        context.push(UserRoutesConstants.providerProfile);
                      },
                      child: Text(
                        'Book',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Category
                        Text(
                          provider.categoryName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 12.h),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: AppColors.horizontalLine,
                        ),

                        SizedBox(height: 14.h),

                        /// 3 Columns Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: AppColors.darkBlueColor,
                                ),
                                Text(
                                  "${provider.rating} (876) ",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: AppColors.horizontalLine,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${provider.experience} Years Experience",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: AppColors.horizontalLine,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${provider.clients}+ Clients",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 28.h),

                        /// Description
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.paragraphBackground,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Text(
                            provider.description,
                            style: TextStyle(
                              color: AppColors.lightgreyColor,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),

                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 1,
              width: double.infinity,
              color: AppColors.horizontalLine,
            ),
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}
