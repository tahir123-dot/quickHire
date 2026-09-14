import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/customer_reviews/customer_reviews.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'package:mobile/user/bloc/blocimpl/booking_cubit.dart';
import 'package:mobile/user/bloc/blocimpl/provider_profile_bloc.dart';
import 'package:mobile/user/bloc/event/provider_profile_event.dart';
import 'package:mobile/user/bloc/state/booking_state.dart';
import 'package:mobile/user/bloc/state/provider_profile_state.dart';
import 'package:mobile/user/data/model/provider_profile.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/colors.dart';
import '../../../../routes/provider_routes/provider_routes_constants.dart';

class ProfileViewScreen extends StatelessWidget {
  final String providerId;
  const ProfileViewScreen({super.key, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProviderProfileViewBloc>(
      create: (_) =>
          getIt<ProviderProfileViewBloc>()
            ..add(FetchProviderProfileByIdEvent(providerId: providerId)),
      child: const _ProfileViewScreenContent(),
    );
  }
}

class _ProfileViewScreenContent extends StatefulWidget {
  const _ProfileViewScreenContent();

  @override
  State<_ProfileViewScreenContent> createState() =>
      _ProfileViewScreenContentState();
}

class _ProfileViewScreenContentState extends State<_ProfileViewScreenContent> {
  final Set<String> selectedServiceIds = {};

  void _toggleService(String serviceId) {
    setState(() {
      if (selectedServiceIds.contains(serviceId)) {
        selectedServiceIds.remove(serviceId);
      } else {
        selectedServiceIds.add(serviceId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderProfileViewBloc, ProviderProfileViewState>(
      builder: (context, state) {
        if (state is ProviderProfileViewLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProviderProfileViewError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        if (state is ProviderProfileViewLoaded) {
          return _buildProfile(context, state.provider);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildProfile(BuildContext context, ProviderProfileView provider) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  provider.bannerImage,
                  width: double.infinity,
                  height: 220.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 25.h,
                  left: 12.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => context.pop(),
                    ),
                  ),
                ),
                Positioned(
                  left: 30.w,
                  bottom: -37.h,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 37.r,
                      backgroundImage: NetworkImage(provider.profileImage),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===== Content =====
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 45.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          provider.name,
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.verified,
                          color: AppColors.darkBlueColor,
                          size: 18.r,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16.r, color: Colors.amber),
                        SizedBox(width: 4.w),
                        Text(
                          provider.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      provider.description,
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
                    SizedBox(height: 16.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.services.length,
                      separatorBuilder: (_, _) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        final service = provider.services[index];
                        final isSelected = selectedServiceIds.contains(
                          service.id,
                        );
                        return InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: () => _toggleService(service.id),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.listBackground.withValues(
                                      alpha: 0.08,
                                    )
                                  : AppColors.paragraphBackground,
                              borderRadius: BorderRadius.circular(12.r),
                              border: isSelected
                                  ? Border.all(
                                      color: AppColors.listBackground,
                                      width: 1.2,
                                    )
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      service.name,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 12.r,
                                          color: AppColors.lightgreyColor,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "${service.duration} min",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.lightgreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rs. ${service.price.toStringAsFixed(0)}",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Icon(
                                      isSelected
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: isSelected
                                          ? AppColors.listBackground
                                          : AppColors.lightgreyColor,
                                      size: 20.r,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 28.h),
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
                            context.push(
                              ProviderRoutesConstants.customerReview,
                            );
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
                    SizedBox(height: 16.h),
                    if (selectedServiceIds.isNotEmpty)
                      AppButtonTheme.iconTextButton(
                        text: 'Add',
                        icon: null,
                        backgroundColor: AppColors.blackColor,
                        textColor: AppColors.whiteColor,
                        onPressed: () {
                          if (selectedServiceIds.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please select at least one service",
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<BookingCubit>().setProviderInfo(
                            providerId: provider.id,
                            providerName: provider.name,
                            providerImage: provider.profileImage,
                            location: null,
                          );

                          final selectedServicesData = provider.services
                              .where((s) => selectedServiceIds.contains(s.id))
                              .map(
                                (s) => SelectedServiceInfo(
                                  serviceId: s.id,
                                  name: s.name,
                                  duration: s.duration,
                                  price: s.price,
                                ),
                              )
                              .toList();

                          context.read<BookingCubit>().setSelectedServices(
                            selectedServicesData,
                          );

                          context.push(
                            UserRoutesConstants.teamSelect,
                            extra: provider.id,
                          );
                        },
                      ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
