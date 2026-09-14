import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'package:mobile/user/bloc/blocimpl/booking_cubit.dart';
import 'package:mobile/user/bloc/blocimpl/provider_profile_bloc.dart';
import 'package:mobile/user/bloc/event/provider_profile_event.dart';
import 'package:mobile/user/bloc/state/provider_profile_state.dart';
import 'package:mobile/utils/time_formatter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/themes/colors.dart';

class UserCalenderScreen extends StatelessWidget {
  final String ownerId;

  const UserCalenderScreen({super.key, required this.ownerId});

  @override
  Widget build(BuildContext context) {
    final todayFormatted = DateTime.now().toIso8601String().split('T')[0];

    return BlocProvider<ProviderProfileViewBloc>(
      create: (_) => getIt<ProviderProfileViewBloc>()
        ..add(
          FetchProviderTeamMemberAvailabilityEvent(
            ownerId: ownerId,
            date: todayFormatted,
          ),
        ),
      child: _UserCalenderScreenContent(ownerId: ownerId),
    );
  }
}

class _UserCalenderScreenContent extends StatefulWidget {
  final String ownerId;

  const _UserCalenderScreenContent({required this.ownerId});

  @override
  State<_UserCalenderScreenContent> createState() =>
      _UserCalenderScreenContentState();
}

class _UserCalenderScreenContentState
    extends State<_UserCalenderScreenContent> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int? selectedSlotIndex; // 👈 UI highlight ke liye
  String? selectedSlotValue; // 👈 asal value jo BookingCubit mein jayegi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarIconWithCenterText(pageName: 'Date and Time'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),

              TableCalendar(
                firstDay: DateTime.now(),
                focusedDay: _focusedDay,
                lastDay: DateTime.now().add(Duration(days: 90)),

                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },

                onDaySelected: (newSelectedDay, newFocusedDay) {
                  setState(() {
                    _selectedDay = newSelectedDay;
                    _focusedDay = newFocusedDay;
                    selectedSlotIndex =
                        null; // 👈 naya din select hote hi purani slot-selection reset
                    selectedSlotValue = null;
                  });

                  final formattedDate = newSelectedDay.toIso8601String().split(
                    'T',
                  )[0];

                  context.read<ProviderProfileViewBloc>().add(
                    FetchProviderTeamMemberAvailabilityEvent(
                      ownerId: widget.ownerId,
                      date: formattedDate,
                    ),
                  );
                },

                onPageChanged: (newFocusedDay) {
                  _focusedDay = newFocusedDay;
                },

                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  headerPadding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 0,
                  ),
                  titleCentered: false,
                  titleTextStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  titleTextFormatter: (date, locale) {
                    return DateFormat.yMMM().format(date);
                  },
                  leftChevronPadding: EdgeInsets.zero,
                  rightChevronPadding: EdgeInsets.zero,
                  leftChevronMargin: EdgeInsets.zero,
                  rightChevronMargin: EdgeInsets.zero,
                ),

                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.blackColor,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.blueColor,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Text(
                'Choose Time',
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12.h),

              BlocBuilder<ProviderProfileViewBloc, ProviderProfileViewState>(
                builder: (context, state) {
                  if (state is ProviderTeamMemberAvailabilityLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is ProviderTeamMemberAvailabilityError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is ProviderTeamMemberAvailabilityEmpty) {
                    return Center(
                      child: Text("No slots available for this date"),
                    );
                  }

                  if (state is ProviderTeamMemberAvailabilityLoaded) {
                    final slots = state.teamAvailability.slots;

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: slots.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final slot = slots[index];
                        final isSelected = selectedSlotIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSlotIndex = index; // 👈 highlight ke liye
                              selectedSlotValue = slot; // 👈 asal value save ki
                            });
                          },
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.blackColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.blackColor
                                    : AppColors.greyColor,
                              ),
                            ),
                            child: Text(
                              TimeFormatter.to12Hour(slot),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),

              SizedBox(height: 24.h),

              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: (_selectedDay == null || selectedSlotValue == null)
                    ? null // 👈 disabled jab tak date+time dono select na ho
                    : () {
                        context.read<BookingCubit>().setDateTime(
                          date: _selectedDay!,
                          time: selectedSlotValue!,
                        );

                        context.push(UserRoutesConstants.bookingDetail);
                      },
              ),

              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
