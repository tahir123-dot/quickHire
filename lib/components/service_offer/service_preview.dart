import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'package:mobile/user/data/model/provider_info.dart';

class ServicePreview extends StatelessWidget {
  final List<ProviderInfoModel> providers;
  const ServicePreview({super.key, required this.providers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: providers.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        final provider = providers[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 14.h),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: () {
              context.push(
                UserRoutesConstants.providerProfile,
                extra: provider.id,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.horizontalLine, width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== Top row: avatar, name, location, book button =====
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 26.r,
                          backgroundImage: NetworkImage(provider.profileImage),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      provider.name,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Icon(
                                    Icons.verified,
                                    color: AppColors.darkBlueColor,
                                    size: 16.r,
                                  ),
                                ],
                              ),
                              if (provider.location != null &&
                                  provider.location!.isNotEmpty) ...[
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 13.r,
                                      color: AppColors.lightgreyColor,
                                    ),
                                    SizedBox(width: 3.w),
                                    Expanded(
                                      child: Text(
                                        provider.location!,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.lightgreyColor,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.listBackground,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            minimumSize: Size(0, 34.h),
                          ),
                          onPressed: () {
                            context.push(
                              UserRoutesConstants.providerProfile,
                              extra: provider.id,
                            );
                          },
                          child: Text(
                            'Book',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ===== Type badge + divider + description =====
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 14.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.listBackground.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            provider.type,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.listBackground,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: AppColors.horizontalLine,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.paragraphBackground,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            provider.description,
                            style: TextStyle(
                              color: AppColors.lightgreyColor,
                              fontSize: 13.sp,
                              height: 1.4,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
