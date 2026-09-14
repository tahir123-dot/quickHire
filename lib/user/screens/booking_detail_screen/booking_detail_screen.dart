import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'package:mobile/user/bloc/blocimpl/booking_cubit.dart';
import 'package:mobile/user/bloc/blocimpl/provider_profile_bloc.dart';
import 'package:mobile/user/bloc/event/provider_profile_event.dart';
import 'package:mobile/user/bloc/state/booking_state.dart';
import 'package:mobile/user/bloc/state/provider_profile_state.dart';
import 'package:mobile/user/data/dto/booking_dto.dart';

import '../../../core/themes/app_button_theme.dart';
import '../../../core/themes/colors.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProviderProfileViewBloc>(
      create: (_) => getIt<ProviderProfileViewBloc>(),
      child: BlocListener<ProviderProfileViewBloc, ProviderProfileViewState>(
        listener: (context, submitState) {
          if (submitState is BookingSubmitSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Booking confirmed!")));
            context.read<BookingCubit>().reset();
            context.go(UserRoutesConstants.homePath);
          }

          if (submitState is BookingSubmitError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(submitState.message)));
          }
        },
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: TopBarIconWithCenterText(pageName: 'Booking Details'),
              ),
              body: SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    SizedBox(height: 24.h),
                    _buildProviderSection(state),
                    _buildTeamMemberSection(state),
                    SizedBox(height: 16.h),
                    _buildDateTimeSection(state),
                    SizedBox(height: 20.h),
                    _buildServicesSection(state),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: AppColors.horizontalLine,
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: TextStyle(fontSize: 18.sp)),
                          Text(
                            "Rs. ${_totalAmount(state).toStringAsFixed(0)}",
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      _buildConfirmButton(context, state),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ===================== HELPERS =====================

  double _totalAmount(BookingState state) {
    return state.selectedServices.fold<double>(0, (sum, s) => sum + s.price);
  }

  int _totalDuration(BookingState state) {
    return state.selectedServices.fold<int>(0, (sum, s) => sum + s.duration);
  }

  // ===================== SECTIONS =====================

  Widget _buildProviderSection(BookingState state) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.horizontalLine, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: state.providerImage != null
                ? NetworkImage(state.providerImage!)
                : null,
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
                        state.providerName ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.verified,
                      color: AppColors.blackColor,
                      size: 15.sp,
                    ),
                  ],
                ),
                if (state.location != null) ...[
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12.sp,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        state.location!,
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberSection(BookingState state) {
    if (state.memberName == null) return const SizedBox();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.horizontalLine, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.memberName!,
                  style: TextStyle(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "Your professional",
                  style: TextStyle(fontSize: 12.sp, color: AppColors.greyColor),
                ),
              ],
            ),
          ),
          Icon(
            Icons.how_to_reg_outlined,
            size: 20.sp,
            color: AppColors.greyColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeSection(BookingState state) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.horizontalLine, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _dateTimeCard(
              icon: Icons.calendar_month_outlined,
              label: "Date",
              value: state.selectedDate != null
                  ? "${state.selectedDate!.day}/${state.selectedDate!.month}/${state.selectedDate!.year}"
                  : '',
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: _dateTimeCard(
              icon: Icons.watch_later_outlined,
              label: "Time",
              value: state.selectedTime ?? '',
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateTimeCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.paragraphBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10.5.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BookingState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.content_cut, size: 18.sp),
            SizedBox(width: 6.w),
            Text(
              'Services',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemCount: state.selectedServices.length,
          itemBuilder: (context, index) {
            final service = state.selectedServices[index];

            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.horizontalLine),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        service.name,
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Rs. ${service.price.toStringAsFixed(0)}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.hourglass_bottom,
                        size: 12.sp,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${service.duration} min",
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context, BookingState state) {
    return BlocBuilder<ProviderProfileViewBloc, ProviderProfileViewState>(
      builder: (context, submitState) {
        final isLoading = submitState is BookingSubmitLoading;
        final canSubmit =
            state.providerId != null &&
            state.selectedDate != null &&
            state.selectedTime != null &&
            state.selectedServices.isNotEmpty;

        return AppButtonTheme.iconTextButton(
          text: isLoading ? 'Submitting...' : 'Confirm',
          icon: null,
          backgroundColor: AppColors.blackColor,
          textColor: AppColors.whiteColor,
          onPressed: (isLoading || !canSubmit)
              ? null
              : () {
                  final dto = SubmitBookingDto(
                    serviceProviderId: state.providerId!,
                    teamMemberId: state.memberId,
                    services: state.selectedServices
                        .map(
                          (s) => BookingServiceDto(
                            serviceId: s.serviceId,
                            name: s.name,
                            price: s.price,
                            duration: s.duration,
                          ),
                        )
                        .toList(),
                    startTime: state.selectedTime!,
                    totalDuration: _totalDuration(state),
                    bookingDate: state.selectedDate!,
                    totalAmount: _totalAmount(state),
                  );

                  context.read<ProviderProfileViewBloc>().add(
                    SubmitBookingEvent(dto: dto),
                  );
                },
        );
      },
    );
  }
}
